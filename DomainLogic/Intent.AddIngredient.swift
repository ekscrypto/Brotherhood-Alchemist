//
//  AddIngredientIntent.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct AddIngredient: AtomicOperation, Sendable {
        let ingredient: Ingredient
        
        public init(_ ingredient: Ingredient) {
            self.ingredient = ingredient
        }
        
        public enum Errors: Error {
            case anEffectWithThisIdentifierAlreadyExists
            case duplicatedName
            case tooManyEffects
            case oneOrMoreEffectsAreUnknown
            case allEffectsMustBeUnique
        }
        
        func mutate(_ initialState: AppState) throws -> AppState {
            guard !initialState.ingredients.contains(where: { $0.id == ingredient.id }) else {
                throw Errors.anEffectWithThisIdentifierAlreadyExists
            }
            
            guard !initialState.ingredients.contains(where: {
                $0.name.localizedCaseInsensitiveCompare(ingredient.name) == .orderedSame
            }) else {
                throw Errors.duplicatedName
            }
            
            guard ingredient.effects.count <= 4 else {
                throw Errors.tooManyEffects
            }
            
            guard Set(ingredient.effects).count == ingredient.effects.count else {
                throw Errors.allEffectsMustBeUnique
            }
            
            guard ingredient.effects.allSatisfy({ ingredientEffectId in
                initialState.effects.contains(where: { $0.id == ingredientEffectId })
            }) else {
                throw Errors.oneOrMoreEffectsAreUnknown
            }
            
            var newState = initialState
            var updatedIngredients = initialState.ingredients
            updatedIngredients.append(ingredient)
            updatedIngredients.sortByName()
            newState.ingredients = updatedIngredients
            return newState
        }
    }
}
