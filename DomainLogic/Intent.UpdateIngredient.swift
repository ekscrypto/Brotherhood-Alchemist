//
//  Intent.UpdateIngredient.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-11.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct UpdateIngredient: Sendable {
        let ingredient: Ingredient
        
        public init(_ ingredient: Ingredient) {
            self.ingredient = ingredient
        }
        
        public enum Errors: Error {
            case unknownIngredient
            case nameIsNotUnique
            case tooManyEffects
            case unknownEffect
        }
    }
}

extension Intent.UpdateIngredient: AtomicOperation {
    
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
        guard initialState.ingredients.contains(where: { $0.id == ingredient.id }) else {
            throw Errors.unknownIngredient
        }
        
        guard initialState.ingredients.allSatisfy({
            $0.id == ingredient.id || $0.name.localizedCaseInsensitiveCompare(ingredient.name) != .orderedSame
        }) else {
            throw Errors.nameIsNotUnique
        }
        
        guard ingredient.effects.count <= 4 else {
            throw Errors.tooManyEffects
        }
        
        guard ingredient.effects.allSatisfy({ ingredientEffectId in
            initialState.effects.contains(where: { $0.id == ingredientEffectId })
        }) else {
            throw Errors.unknownEffect
        }
        
        let updatedIngredients = initialState.ingredients.map {
            guard $0.id == ingredient.id else {
                return $0
            }
            return ingredient
        }
        
        var newState = initialState
        var newCache = initialCache
        MixtureIdentifier.invalidateMixtures(appState: &newState, cache: &newCache)
        
        newCache.ingredients = .invalidated(UUID())

        newState.ingredients = updatedIngredients
        let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)
        
        
        return (newState, newCache, [MixtureIdentifier.taskIdentifier: mixtureActivity])
    }
}
