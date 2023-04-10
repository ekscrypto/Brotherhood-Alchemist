//
//  Registry.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-23.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation
import Combine

class Registry {
    enum Concoctions {
        case brewing
        case identified([Concoction])
    }
    @MainActor @Published fileprivate(set) var effects: [Effect] = []
    @MainActor @Published fileprivate(set) var ingredients: [Ingredient] = []
    @MainActor @Published fileprivate(set) var concoctions: Concoctions = .brewing
    @MainActor @Published fileprivate(set) var matchingConcoctions: Concoctions = .brewing
    
    private var concoctionsFilterBlueprints: [ConcoctionFilterBlueprint] = []
    static let active: Registry = .init()
    
    private let concoctionFinder: ConcoctionFinder = .init()
    private let concoctionFilter: ConcoctionFilter = .init()
    
    fileprivate struct ExportDTO: Codable {
        let effects: [Effect.ExportDTO]
        let ingredients: [Ingredient.ExportDTO]
    }
    
    fileprivate func exportDto() async -> ExportDTO {
        .init(
            effects: await effects.map { $0.exportDto },
            ingredients: await ingredients.map { $0.exportDto })
    }
    
    fileprivate func load(
        effects providedEffects: [Effect],
        ingredients providedIngredients: [Ingredient]
    ) {
        let sortedEffects = providedEffects.sorted(by: { ~$0.name < ~$1.name })
        let sortedIngredients = providedIngredients.sorted(by: { ~$0.name < ~$1.name })
        Task {
            await self.load(
                sortedEffects: sortedEffects,
                sortedIngredients: sortedIngredients)
        }
        identifyPossibleConcoctions()
    }
    
    @MainActor private func load(sortedEffects: [Effect], sortedIngredients: [Ingredient]) {
        effects = sortedEffects
        ingredients = sortedIngredients
        concoctionsFilterBlueprints = []
        concoctions = .brewing
        matchingConcoctions = .brewing
    }
    
    // MARK: - Concoctions
    fileprivate func identifyPossibleConcoctions() {
        Task.detached(priority: .background) { [self] in
            let blueprints = await BlueprintExtractor().ingredients(from: self)
            let concoctionBlueprints = await concoctionFinder.all(from: blueprints)
            await self.materialize(blueprints: concoctionBlueprints)
        }
    }
    
    @MainActor
    private func materialize(blueprints: [ConcoctionBlueprint]) {
        let identifiedConcoctions: [Concoction] = blueprints.compactMap { blueprint in
            let concoctionEffects: [Effect] = blueprint.effects.compactMap { blueprintEffect in
                effects.first(where: { $0.id == blueprintEffect })
            }
            let concoctionIngredients: [Ingredient] = blueprint.ingredients.compactMap { blueprintIngredient in
                ingredients.first(where: { $0.id == blueprintIngredient })
            }
            guard concoctionEffects.count == blueprint.effects.count,
                  concoctionIngredients.count == blueprint.ingredients.count
            else {
                return nil
            }
            return Concoction(
                effects: concoctionEffects.sorted(by: { ~$0.name < ~$1.name }),
                ingredients: concoctionIngredients.sorted(by: { ~$0.name < ~$1.name }),
                estimatedValue: concoctionEffects.reduce(0, { partialResult, effect in
                    partialResult + effect.value.rawValue
                }))
        }
        guard identifiedConcoctions.count == blueprints.count else {
            return
        }
        let filterBlueprints = identifiedConcoctions.map { concoction in
            ConcoctionFilterBlueprint(
                id: concoction.id,
                ingredients: concoction.ingredients.map { $0.id },
                effects: concoction.effects.map { $0.id },
                concoction: concoction)
        }
        concoctionsFilterBlueprints = filterBlueprints
        concoctions = .identified(identifiedConcoctions)
        matchConcoctionsToSelections()
    }
    
    private var matchRevision: Int = 0
    
    @MainActor
    private func matchConcoctionsToSelections() {
        if case .brewing = concoctions { return }
        matchingConcoctions = .brewing
        let thisMatchRevision = matchRevision + 1
        matchRevision = thisMatchRevision
        let ingredientsFilter = ingredients.map { ingredient in
            IngredientFilterBlueprint(id: ingredient.id, selection: ingredient.selection)
        }
        let effectsFilter = effects.map { effect in
            EffectFilterBlueprint(id: effect.id, selection: effect.selection)
        }
        let concoctionBlueprints = concoctionsFilterBlueprints
        Task.detached(priority: .background) { [self] () -> Void in
            let filteredConcoctions = await concoctionFilter.filter(
                concoctionBlueprints,
                byEffects: effectsFilter,
                byIngredients: ingredientsFilter)
            await updateMatchingConcoctions(filteredConcoctions, revision: thisMatchRevision)
        }
    }
    
    @MainActor
    private func updateMatchingConcoctions(_ filteredConcoctions: [Concoction], revision: Int) {
        guard case .identified = concoctions,
              revision == matchRevision
        else {
            return
        }

        matchingConcoctions = .identified(filteredConcoctions)
        print(">>>> Registry now has \(filteredConcoctions.count) identified concoctions")
    }
    
    // MARK: - Effects
    
    func effects(filteredBy filter: String) async -> [Effect] {
        let allEffects = await effects
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmedFilter.isEmpty {
            return allEffects
        }
        
        if trimmedFilter.hasPrefix("=") {
            let expectedName = String(trimmedFilter.dropFirst())
            return allEffects.filter({ (~$0.name).lowercased() == expectedName })
        }
        
        return allEffects.filter({ (~$0.name).lowercased().contains(trimmedFilter) })
    }
    
    @MainActor
    func resetEffects(to selection: SelectionState) {
        effects.forEach { $0.selection = selection }
        matchConcoctionsToSelections()
    }
    
    @MainActor
    func select(effect: Effect, as selection: SelectionState) {
        effect.selection = selection
        matchConcoctionsToSelections()
    }
    
    // MARK: - Ingredients
    @MainActor
    func ingredients(filteredBy filter: String) -> [Ingredient] {
        let allIngredients = ingredients
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmedFilter.isEmpty {
            return allIngredients
        }
        
        if trimmedFilter.hasPrefix("=") {
            let expectedName = String(trimmedFilter.dropFirst())
            return allIngredients.filter({ (~$0.name).lowercased() == expectedName })
        }
        
        return allIngredients.filter({ (~$0.name).lowercased().contains(trimmedFilter) })
    }
    
    @MainActor
    func resetIngredients(to selection: SelectionState) {
        ingredients.forEach { $0.selection = selection }
        matchConcoctionsToSelections()
    }
    
    @MainActor
    func select(ingredient: Ingredient, as selection: SelectionState) {
        ingredient.selection = selection
        matchConcoctionsToSelections()
    }
}

class Effect: Identifiable, ObservableObject {
    static func == (lhs: Effect, rhs: Effect) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: UUID = .init()
    @Published private(set) var name: ConstrainedName
    @Published var value: EffectValue
    @Published var isPositive: Bool
    @Published fileprivate(set) var selection: SelectionState = .mayHave
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

class Ingredient: Identifiable, ObservableObject {
    
    let id: UUID = .init()
    @Published fileprivate(set) var effects: [Effect]
    @Published fileprivate(set) var name: ConstrainedName
    @Published fileprivate(set) var selection: SelectionState = .mayHave
    
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
    ) async throws -> Ingredient {
        let allIngredients = await registry.ingredients
        let allEffects = await registry.effects
        let existingIngredientsNames: Set<String> = Set(allIngredients.map { (~$0.name).lowercased() })
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
            allEffects.contains(where: { $0.id == desiredEffect.id })
        }) else {
            throw Errors.unknownEffect
        }
        
        let sortedEffects: [Effect] = effects.sorted(by: { ~$0.name < ~$1.name })
        
        let ingredient: Ingredient = .init(name: name, effects: sortedEffects)
        effects.forEach { effect in
            effect.ingredients.append(ingredient)
            effect.ingredients.sort(by: { ~$0.name < ~$1.name })
        }
        Task {
            await self.append(ingredient:ingredient, toRegistry: registry)
        }
        return ingredient
    }
    
    @MainActor
    private func append(ingredient: Ingredient, toRegistry registry: Registry) {
        registry.ingredients.append(ingredient)
        registry.ingredients.sort(by: { ~$0.name < ~$1.name })
        registry.identifyPossibleConcoctions()
    }
}

class RemoveIngredientCoordinator {
    @MainActor
    func remove(_ ingredient: Ingredient, from registry: Registry) {
        registry.ingredients.removeAll(where: { $0.id == ingredient.id })
        let allEffects: [Effect] = registry.effects
        for effect in allEffects {
            effect.ingredients.removeAll(where: { $0.id == ingredient.id })
        }
        registry.identifyPossibleConcoctions()
    }
}

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
            effect.ingredients = mappedIngredients.sorted(by: { ~$0.name < ~$1.name })
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

        let instantiator = RegistryInstantiator()
        let effects: [Effect] = instantiator.instantiateEffects(registryDto.effects)
        
        let mappedEffectsToIngredient: [ConstrainedName: [Effect]] = await mapEffectsToIngredientsNames(
            registryDto.ingredients,
            effects: effects,
            via: instantiator)
        let ingredients: [Ingredient] = instantiator.instantiateIngredients(mappedEffectsToIngredient)
        instantiator.associateIngredientsToEffects(ingredients: ingredients, effects: effects)
        registry.load(
            effects: effects,
            ingredients: ingredients)
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
            map[ingredient.name] = instantiator.effects(matching: effectNames, from: effects)
        }
        return map
    }
    
    /// Export the data from provided Registry and save it to disk
    ///
    /// - Parameter registry: Registry to export
    func save(
        _ registry: Registry
    ) async throws {
        let registryDto: Registry.ExportDTO = await registry.exportDto()
        
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
