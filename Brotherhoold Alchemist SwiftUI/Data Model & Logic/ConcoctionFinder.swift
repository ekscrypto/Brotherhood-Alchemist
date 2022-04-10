//
//  ConcoctionFinder.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class ConcoctionFinder {
    
    typealias ValueCalculator = ([Effect.Id], [Effect]) -> UInt

    static func commonEffects(_ ingredient1: Ingredient, _ ingredient2: Ingredient) -> [Effect.Id] {
        ingredient1.effects.filter { ingredient1Effect in
            ingredient2.effects.contains(ingredient1Effect)
        }
    }

    static func anyTwo(
        from ingredients: [Ingredient],
        effects: [Effect],
        valueCalculator: ValueCalculator
    ) -> [Concoction] {
        guard ingredients.count >= 2 else { return [] }

        var concoctions: [Concoction] = []
        for firstIngredientIndex in 0..<(ingredients.count - 1) {
            let ingredient1 = ingredients[firstIngredientIndex]
            for secondIngredientIndex in (firstIngredientIndex + 1)..<ingredients.count {
                let ingredient2 = ingredients[secondIngredientIndex]
                
                if let concoction = Self.mix(ingredient1, ingredient2,
                                             effects: effects,
                                             valueCalculator: valueCalculator) {
                    concoctions.append(concoction)
                }
            }
        }
        return concoctions
    }
    
    static func anyThree(
        from ingredients: [Ingredient],
        effects: [Effect],
        valueCalculator: ValueCalculator
    ) -> [Concoction] {
        guard ingredients.count >= 3 else { return [] }
        
        var concoctions: [Concoction] = []
        for firstIngredientIndex in 0..<(ingredients.count - 2) {
            let ingredient1 = ingredients[firstIngredientIndex]
            
            for secondIngredientIndex in (firstIngredientIndex + 1)..<(ingredients.count - 1) {
                let ingredient2 = ingredients[secondIngredientIndex]
                
                for thirdIngredientIndex in (secondIngredientIndex + 1)..<ingredients.count {
                    let ingredient3 = ingredients[thirdIngredientIndex]

                    if let concoction = Self.mix(ingredient1, ingredient2, ingredient3,
                                                 effects: effects,
                                                 valueCalculator: valueCalculator) {
                        concoctions.append(concoction)
                    }
                }
            }
        }
        return concoctions
    }
    
    static func mix(
        _ ingredient1: Ingredient,
        _ ingredient2: Ingredient,
        effects: [Effect],
        valueCalculator: ValueCalculator
    ) -> Concoction? {
        
        let ingredients1And2CommonEffects: [Effect.Id] = commonEffects(ingredient1, ingredient2)
        let ingredients1And2HaveCommonEffects: Bool = !ingredients1And2CommonEffects.isEmpty
        
        guard ingredients1And2HaveCommonEffects else {
            return nil
        }
        
        return Concoction(
            effects: ingredients1And2CommonEffects.map { effect(from: effects, id: $0) },
            ingredients: [ingredient1, ingredient2],
            estimatedValue: valueCalculator(ingredients1And2CommonEffects, effects))
    }
    
    static func effect(from effects: [Effect], id effectId: Effect.Id) -> Effect {
        for effect in effects where effect.id == effectId {
            return effect
        }
        fatalError()
    }
    
    static func mix(
        _ ingredient1: Ingredient,
        _ ingredient2: Ingredient,
        _ ingredient3: Ingredient,
        effects: [Effect],
        valueCalculator: ValueCalculator
    ) -> Concoction? {
        let ingredients1And2CommonEffects: [Effect.Id] = commonEffects(ingredient1, ingredient2)
        let ingredients1And2HaveCommonEffects: Bool = !ingredients1And2CommonEffects.isEmpty
        
        let ingredients1And3CommonEffects: [Effect.Id] = commonEffects(ingredient1, ingredient3)
        let ingredients1And3HaveCommonEffects: Bool = !ingredients1And3CommonEffects.isEmpty

        guard (ingredients1And2HaveCommonEffects || ingredients1And3HaveCommonEffects) else {
            // ingredient1 has no common effect with any of the other two ingredients
            return nil
        }
        
        let ingredients2And3CommonEffects: [Effect.Id] = commonEffects(ingredient2, ingredient3)
        let ingredients2And3HaveCommonEffects: Bool = !ingredients2And3CommonEffects.isEmpty
        
        guard (ingredients1And2HaveCommonEffects || ingredients2And3HaveCommonEffects) else {
            // ingredient2 has no common effect with any of the other two ingredients
            return nil
        }
        
        guard (ingredients1And3HaveCommonEffects || ingredients2And3HaveCommonEffects) else {
            // ingredient3 has no common effect with any of the other two ingredients
            return nil
        }
        
        let commonEffects: [Effect.Id] = ingredients1And2CommonEffects + ingredients1And3CommonEffects + ingredients2And3CommonEffects
        return Concoction(
            effects: commonEffects.map({ effect(from: effects, id: $0) }),
            ingredients: [ingredient1, ingredient2, ingredient3],
            estimatedValue: valueCalculator(commonEffects, effects))
    }

}
