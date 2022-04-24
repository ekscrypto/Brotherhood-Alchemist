//
//  ConcoctionFinder.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct ConcoctionBlueprint {
    let effects: Set<UUID>
    let ingredients: Set<UUID>
}

struct IngredientBlueprint {
    let id: UUID
    let effects: Set<UUID>
}

@MainActor
class BlueprintExtractor {
    func ingredients(from registry: Registry) -> [IngredientBlueprint] {
        registry.ingredients.map { ingredient in
            IngredientBlueprint(
                id: ingredient.id,
                effects: Set(ingredient.effects.map { $0.id }))
        }
    }
}

actor ConcoctionFinder {
    
    actor IdentifiedConcoctions {
        private(set) var all: [ConcoctionBlueprint] = []
        
        func append(_ blueprint: ConcoctionBlueprint) {
            all.append(blueprint)
        }
    }
    
    func all(from ingredients: [IngredientBlueprint]) async -> [ConcoctionBlueprint] {
        async let concoctions2 = anyTwo(from: ingredients)
        async let concoctions3 = anyThree(from: ingredients)
        return await concoctions2 + concoctions3
    }
    
    func anyTwo(
        from ingredients: [IngredientBlueprint]
    ) async -> [ConcoctionBlueprint] {
        
        guard ingredients.count >= 2 else { return [] }

        let concoctions: IdentifiedConcoctions = .init()
        var pendingTasks: [Task<Void, Never>] = []
        for firstIngredientIndex in 0..<(ingredients.count - 1) {
            let ingredient1 = ingredients[firstIngredientIndex]
            
            let asyncTask = Task { () -> Void in
                for secondIngredientIndex in (firstIngredientIndex + 1)..<ingredients.count {
                    let ingredient2 = ingredients[secondIngredientIndex]
                    
                    if let concoction = Self.mix(ingredient1, ingredient2) {
                        await concoctions.append(concoction)
                    }
                }
            }
            pendingTasks.append(asyncTask)
        }
        for task in pendingTasks {
            _ = await task.result
        }
        return await concoctions.all
    }
    
    func anyThree(
        from ingredients: [IngredientBlueprint]
    ) async -> [ConcoctionBlueprint] {
        guard ingredients.count >= 3 else { return [] }
        
        let concoctions: IdentifiedConcoctions = .init()
        var pendingTasks: [Task<Void,Never>] = []
        
        for firstIngredientIndex in 0..<(ingredients.count - 2) {
            let ingredient1 = ingredients[firstIngredientIndex]
            
            for secondIngredientIndex in (firstIngredientIndex + 1)..<(ingredients.count - 1) {
                let ingredient2 = ingredients[secondIngredientIndex]
                
                let asyncTask = Task { () -> Void in
                    for thirdIngredientIndex in (secondIngredientIndex + 1)..<ingredients.count {
                        let ingredient3 = ingredients[thirdIngredientIndex]
                        
                        if let concoction = Self.mix(ingredient1, ingredient2, ingredient3) {
                            await concoctions.append(concoction)
                        }
                    }
                }
                pendingTasks.append(asyncTask)
            }
        }
        for task in pendingTasks {
            _ = await task.result
        }
        return await concoctions.all
    }
    
    static func mix(
        _ ingredient1: IngredientBlueprint,
        _ ingredient2: IngredientBlueprint
    ) -> ConcoctionBlueprint? {
        let effects1: Set<UUID> = ingredient1.effects
        let effects2: Set<UUID> = ingredient2.effects

        let commonEffects: Set<UUID> = effects1.intersection(effects2)
        
        if commonEffects.isEmpty {
            return nil
        }
        return ConcoctionBlueprint(
            effects: commonEffects,
            ingredients: Set([ingredient1.id, ingredient2.id]))
    }
    
    static func mix(
        _ ingredient1: IngredientBlueprint,
        _ ingredient2: IngredientBlueprint,
        _ ingredient3: IngredientBlueprint
    ) -> ConcoctionBlueprint? {
        let effects1: Set<UUID> = ingredient1.effects
        let effects2: Set<UUID> = ingredient2.effects
        let effects3: Set<UUID> = ingredient3.effects
        
        let common1And2: Set<UUID> = effects1.intersection(effects2)
        let common1And3: Set<UUID> = effects1.intersection(effects3)

        if common1And2.isEmpty, common1And3.isEmpty {
            // ingredient1 has no common effect with any of the other two ingredients
            // this recipe is thus a 2 ingredients recipe only (at best)
            return nil
        }

        let common2and3: Set<UUID> = effects2.intersection(effects3)
        if common1And2.isEmpty, common2and3.isEmpty {
            // ingredient2 has no common effect with any of the other two ingredients
            // this recipe is a 2 ingredients only recipe (definite)
            return nil
        }

        if common1And3.isEmpty, common2and3.isEmpty {
            // ingredient3 has no common effect with any of the other two ingredients
            // this recipe is a 2 ingredients only recipe (definite)
            return nil
        }
        
        let commonEffects: Set<UUID> = common1And3.union(common1And2).union(common2and3)
        return ConcoctionBlueprint(
            effects: commonEffects,
            ingredients: Set([ingredient1.id, ingredient2.id, ingredient3.id]))
    }

}
