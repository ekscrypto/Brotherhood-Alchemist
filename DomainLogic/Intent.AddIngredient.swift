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
        }
        
        public func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity]) {
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
            MixtureIdentifier.invalidateMixtures(in: &newState)
            let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)
            return (newState, [mixtureActivity])
        }
    }
}
