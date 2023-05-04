//
//  AddIngredientIntent.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct AddIngredient: Sendable {
        let ingredient: Ingredient
        
        public enum Errors: Error {
            case anEffectWithThisIdentifierAlreadyExists
            case duplicatedName
            case tooManyEffects
            case oneOrMoreEffectsAreUnknown
        }
        
        public init(_ ingredient: Ingredient) {
            self.ingredient = ingredient
        }
    }
}

extension Intent.AddIngredient: AtomicOperation {
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [ExternalActivity]) {
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
        newState.ingredients = updatedIngredients
        
        MixtureIdentifier.invalidateMixtures(in: &newState)
        let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)

        var newCache = initialCache
        newCache.ingredients = .invalidated(UUID())
        
        return (newState, newCache, [mixtureActivity])
    }
}
