//
//  Ingredients.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-22.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

@MainActor
final class Ingredients {
    @Published private(set) var all: [Ingredient] = []
    
    static let active: Ingredients = .init()
    
    fileprivate func finishLoading(with loadedIngredients: [Ingredient]) {
        all = loadedIngredients
    }
    
    func remove(ingredient: Ingredient) {
        all.removeAll(where: { $0.id == ingredient.id })
    }
    
    enum Errors: Error {
        case nameAlreadyExists
    }
    
    func add(ingredient: Ingredient) throws {
        let ingredientName: String = ~ingredient.name
        guard all.allSatisfy({ ~$0.name != ingredientName }) else {
            throw Errors.nameAlreadyExists
        }
        all.append(ingredient)
        all.sort(by: { ~$0.name < ~$1.name })
    }
}

@MainActor
class IngredientsSnapshot {
    
    func capture(registry ingredients: Ingredients) -> [Ingredient.DTO] {
        ingredients.all.map { $0.dto }
    }
    
    struct IngredientEffectsMap {
        let dto: Ingredient.DTO
        let effects: [Effect]
    }
    
    func instantiate(ingredients: [IngredientEffectsMap]) -> [Ingredient] {
        ingredients.compactMap { Ingredient(dto: $0.dto, effects: $0.effects) }
    }
    
    enum Errors: Error {
        case unknownEffect
    }
    
    func map(dto: Ingredient.DTO, sourcing effects: [Effect]) throws -> IngredientEffectsMap {
        var mappedEffects: [Effect] = []
        for effectName in dto.effects {
            guard let effect = effects.first(where: { $0.name == effectName }) else {
                throw Errors.unknownEffect
            }
            mappedEffects.append(effect)
        }
        return .init(dto: dto, effects: mappedEffects)
    }
}

final class StoredIngredients {
    static func load(into registry: Ingredients, sourcingEffects: Effects) async {
        
        let ingredientsToLoad: [Ingredient.DTO]
        if let ingredientsFromDisk = try? await Self.loadRegistryFromDisk(from: Self.registryUrl) {
            ingredientsToLoad = ingredientsFromDisk
        } else {
            ingredientsToLoad = DefaultIngredients.all
        }

        do {
            let snapshotMaps: [IngredientsSnapshot.IngredientEffectsMap] = try await Self.createSnapshotMap(
                from: ingredientsToLoad,
                sourcingEffects: <#T##Effects#>)
        }
        await registry.finishLoading(with: ingredientsToLoad)
    }
    
    static var registryUrl: URL {
        do {
            let documentDirectory: URL = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true)
            return documentDirectory.appendingPathComponent("Ingredients.registry")
        } catch {
            fatalError("Unable to acquire .documentDirectory URL: \(error)")
        }
    }
    
    private static func loadRegistryFromDisk(from registryUrl: URL) async throws -> [Ingredient.DTO] {
        do {
            let registryData: Data = try Data(contentsOf: registryUrl)
            let ingredientsDto: [Ingredient.DTO] = try JSONDecoder().decode([Ingredient.DTO].self, from: registryData)
            try UniqueIngredientsValidator.validate(using: ingredientsDto)
            return ingredientsDto
        } catch {
            print("Unable to load Ingredients registry: \(error)")
            throw error
        }
    }
    
    private static func createSnapshotMap(
        from ingredientsDto: [Ingredient.DTO],
        sourcingEffects effectsRegistry: Effects
    ) async throws -> [IngredientsSnapshot.IngredientEffectsMap] {
        let allEffects: [Effect] = await effectsRegistry.all
        var maps: [IngredientsSnapshot.IngredientEffectsMap] = []
        let snapshot: IngredientsSnapshot = await .init()
        for dto in ingredientsDto {
            let dtoMap: IngredientsSnapshot.IngredientEffectsMap = try await snapshot.map(
                dto: dto,
                sourcing: allEffects)
            maps.append(dtoMap)
        }
        return maps
    }
}

final class UniqueIngredientsValidator {
    enum Errors: Error {
        case duplicatedName
    }
    
    static func validate(using dto: [Ingredient.DTO]) throws {
        let uniqueNames: Set<String> = Set(dto.map { ~$0.name })
        if uniqueNames.count < dto.count {
            throw Errors.duplicatedName
        }
    }
}
