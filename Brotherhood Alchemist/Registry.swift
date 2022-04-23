//
//  Registry.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-23.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation
import Combine

@MainActor
class Registry {
    @Published fileprivate(set) var effects: [Effect] = []
    @Published fileprivate(set) var ingredients: [Ingredient] = []
    
    static let active: Registry = .init()
    
    fileprivate struct ExportDTO: Codable {
        let effects: [Effect.ExportDTO]
        let ingredients: [Ingredient.ExportDTO]
    }
    
    fileprivate var exportDto: ExportDTO {
        .init(
            effects: effects.map { $0.exportDto },
            ingredients: ingredients.map { $0.exportDto })
    }
    
    fileprivate func load(
        effects providedEffects: [Effect],
        ingredients providedIngredients: [Ingredient]
    ) {
        effects = providedEffects
        ingredients = providedIngredients
    }
}

@MainActor
class Effect: Identifiable {
    
    let id: UUID = .init()
    @Published private(set) var name: ConstrainedName
    @Published var value: EffectValue
    @Published var isPositive: Bool
    @Published var selection: SelectionState = .mayHave
    @Published fileprivate(set) var ingredients: [Ingredient] = []
    
    struct ExportDTO: Codable {
        let name: ConstrainedName
        let value: EffectValue
        let isPositive: Bool
    }

    var exportDto: ExportDTO {
        .init(name: name, value: value, isPositive: isPositive)
    }
    
    init(
        name providedName: ConstrainedName,
        value providedValue: EffectValue,
        isPositive providedIsPositive: Bool
    ) {
        name = providedName
        value = providedValue
        isPositive = providedIsPositive
    }
}

@MainActor
class Ingredient: Identifiable {
    
    let id: UUID = .init()
    @Published fileprivate(set) var effects: [Effect]
    @Published fileprivate(set) var name: ConstrainedName
    @Published var selection: SelectionState = .mayHave
    
    struct ExportDTO: Codable {
        let name: ConstrainedName
        let effects: [ConstrainedName]
    }
    var exportDto: ExportDTO {
        .init(name: name, effects: effects.map { $0.name })
    }

    init(
        name providedName: ConstrainedName,
        effects validatedEffects: [Effect]
    ) {
        name = providedName
        effects = validatedEffects
    }
}

@MainActor
class AddIngredientCoordinator {
    enum Errors: Error {
        case duplicateName
        case tooManyEffects
        case duplicateEffect
        case unknownEffect
    }

    func add(
        name: ConstrainedName,
        effects: [Effect],
        to registry: Registry
    ) throws -> Ingredient {
        let existingIngredientsNames: Set<String> = Set(registry.ingredients.map { (~$0.name).lowercased() })
        let lowerecasedName = (~name).lowercased()
        guard false == existingIngredientsNames.contains(lowerecasedName) else {
            throw Errors.duplicateName
        }

        guard effects.count <= 4 else {
            throw Errors.tooManyEffects
        }
        
        let uniqueEffects: Set<UUID> = Set(effects.map { $0.id })
        guard uniqueEffects.count == effects.count else {
            throw Errors.duplicateEffect
        }

        guard effects.allSatisfy({ desiredEffect in
            registry.effects.contains(where: { $0.id == desiredEffect.id })
        }) else {
            throw Errors.unknownEffect
        }
        
        let sortedEffects: [Effect] = effects.sorted(by: { ~$0.name < ~$1.name })
        
        let ingredient: Ingredient = .init(name: name, effects: sortedEffects)
        effects.forEach { effect in
            effect.ingredients.append(ingredient)
            effect.ingredients.sort(by: { ~$0.name < ~$1.name })
        }
        registry.ingredients.append(ingredient)
        registry.ingredients.sort(by: { ~$0.name < ~$1.name })
        return ingredient
    }
}

@MainActor
fileprivate class RegistryInstantiator {
    fileprivate func instantiateEffects(
        _ exportedEffects: [Effect.ExportDTO]
    ) -> [Effect] {
        exportedEffects.map { dto in
            Effect(
                name: dto.name,
                value: dto.value,
                isPositive: dto.isPositive)
        }
    }
    
    fileprivate func instantiateIngredients(
        _ namesWithAssociatedEffects: [ConstrainedName: [Effect]]
    ) -> [Ingredient] {
        namesWithAssociatedEffects.map { keyPair in
            Ingredient(
                name: keyPair.key,
                effects: keyPair.value)
        }
    }
    
    fileprivate func associateIngredientsToEffects(
        ingredients: [Ingredient],
        effects: [Effect]
    ) {
        for effect in effects {
            let mappedIngredients: [Ingredient] = ingredients.filter { ingredient in
                ingredient.effects.contains(where: { $0.id == effect.id })
            }
            effect.ingredients = mappedIngredients
        }
    }
    
    fileprivate func effects(
        matching names: [String],
        from allEffects: [Effect]
    ) -> [Effect] {
        allEffects.filter({ names.contains(~$0.name) })
    }
}

/// Effects/Ingredients Registry import/export class
final actor RegistryStorage {
    enum Errors: Error {
        case invalidState
    }
    
    /// The production runtime instance to use from the UI
    static let active: RegistryStorage = .init()
    
    private init() {} // Make sure a single instance exists
    
    /// Local file:// URL to use when reading/writing the Registry export data
    static let registryUrl: URL = try! FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: true)
        .appendingPathComponent("registry")
    
    /// Load a previously saved Registry export from disk or fallback to built-in default values
    ///
    /// - Parameter registry: Registry to populate with the data
    func load(
        into registry: Registry
    ) async {
        let registryDto: Registry.ExportDTO
        if let dtoFromDisk: Registry.ExportDTO = loadDataFromDisk() {
            registryDto = dtoFromDisk
        } else {
            registryDto = .init(
                effects: DefaultEffects.all,
                ingredients: DefaultIngredients.all)
        }

        let instantiator = await RegistryInstantiator()
        let effects: [Effect] = await instantiator.instantiateEffects(registryDto.effects)
        
        let mappedEffectsToIngredient: [ConstrainedName: [Effect]] = await mapEffectsToIngredientsNames(
            registryDto.ingredients,
            effects: effects,
            via: instantiator)
        let ingredients: [Ingredient] = await instantiator.instantiateIngredients(mappedEffectsToIngredient)
        await instantiator.associateIngredientsToEffects(ingredients: ingredients, effects: effects)
        await registry.load(effects: effects, ingredients: ingredients)
    }
    
    /// Create a dictionary associating arrays of Effect instances to ingredient names
    ///
    /// WARNING: This step expects all effects to exists, the registry data should have been validated already
    ///
    /// - Parameters:
    ///   - ingredients: Array of Ingredient.ExportDTO to use for the mapping
    ///   - effects: Array of Effect instances to use as source
    /// - Returns: Dictionary with the populated data
    private func mapEffectsToIngredientsNames(
        _ ingredients: [Ingredient.ExportDTO],
        effects: [Effect],
        via instantiator: RegistryInstantiator
    ) async -> [ConstrainedName: [Effect]] {
        var map: [ConstrainedName: [Effect]] = [:]
        for ingredient in ingredients {
            let effectNames: [String] = ingredient.effects.map { ~$0 }
            map[ingredient.name] = await instantiator.effects(matching: effectNames, from: effects)
        }
        return map
    }
    
    /// Export the data from provided Registry and save it to disk
    ///
    /// - Parameter registry: Registry to export
    func save(
        _ registry: Registry
    ) async throws {
        let registryDto: Registry.ExportDTO = await registry.exportDto
        
        guard exportSeemsValid(registryDto) else {
            throw Errors.invalidState
        }
        
        let registryData: Data = try JSONEncoder().encode(registryDto)
        try registryData.write(to: Self.registryUrl, options: [.atomic, .noFileProtection])
    }
    
    /// Attempt to load a previously saved registry export from disk
    ///
    /// - Returns: Validated Registry export or nil
    private func loadDataFromDisk(
    ) -> Registry.ExportDTO? {
        guard let registryData: Data = try? Data(contentsOf: Self.registryUrl),
              let registryDto: Registry.ExportDTO = try? JSONDecoder().decode(Registry.ExportDTO.self,
                                                                              from: registryData),
              exportSeemsValid(registryDto)
        else {
            return nil
        }
        return registryDto
    }
    
    /// Checks the Registry export match our minimum validation criteria
    /// * names are all unique
    /// * ingredient effects match to effects in the export
    /// * ingredients each have between 0 and 4 effects
    /// * none of the ingredient has the same effect twice
    ///
    /// - Parameter registryDto: Registry export to validate
    /// - Returns: True if everything seems valid
    private func exportSeemsValid(
        _ registryDto: Registry.ExportDTO
    ) -> Bool {
        namesAreAllUnique(registryDto) &&
        ingredientEffectsExists(registryDto) &&
        ingredientsHaveFourOrLessUniqueEffects(registryDto)
    }
    
    /// Confirms that all ingredient and effect names are unique
    ///
    /// - Parameter registryDto: Registry export to validate
    /// - Returns: True if all names are unique
    private func namesAreAllUnique(
        _ registryDto: Registry.ExportDTO
    ) -> Bool {
        let uniqueIngredientNames: Set<String> = Set(registryDto.ingredients.map { ~$0.name })
        let uniqueEffectNames: Set<String> = Set(registryDto.effects.map { ~$0.name })

        let totalNamesExpected: Int = registryDto.effects.count + registryDto.ingredients.count
        let uniqueNames: Set<String> = uniqueEffectNames.union(uniqueIngredientNames)
        
        return uniqueNames.count == totalNamesExpected
    }
    
    /// Confirms that all effect names referenced by the ingredients exist in the export
    ///
    /// - Parameter registryDto: Registry export to validate
    /// - Returns: False if any of the effect referenced is missing from the export
    private func ingredientEffectsExists(
        _ registryDto: Registry.ExportDTO
    ) -> Bool {
        for ingredient in registryDto.ingredients {
            for effectName in ingredient.effects {
                guard registryDto.effects.contains(where: { ~$0.name == ~effectName }) else {
                    return false
                }
            }
        }
        return true
    }
    
    /// Confirms that all ingredients have between 0 and 4 effects, and each of the effect is unique
    /// per ingredient
    ///
    /// - Parameter registryDto: Registry export to validate
    /// - Returns: False if any of the ingredient has more than 4 effects or has a duplicated effects
    private func ingredientsHaveFourOrLessUniqueEffects(
        _ registryDto: Registry.ExportDTO
    ) -> Bool {
        
        for ingredient in registryDto.ingredients {
            guard ingredient.effects.count <= 4 else {
                return false
            }
            
            let uniqueEffects: Set<String> = Set(ingredient.effects.map { ~$0 })
            guard uniqueEffects.count == ingredient.effects.count else {
                return false
            }
        }
        return true
    }
}
