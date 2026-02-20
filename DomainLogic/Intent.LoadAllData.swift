//
//  Intent.LoadAllData.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-05.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct LoadAllData: Sendable {
        let effects: [Effect]
        let ingredients: [Ingredient]

        public enum Errors: Error {
            case duplicateEffectId
            case duplicateIngredientId
            case ingredientReferencesUnknownEffect
        }

        public init(effects: [Effect], ingredients: [Ingredient]) {
            self.effects = effects
            self.ingredients = ingredients
        }
    }
}

extension Intent.LoadAllData: AtomicOperation {
    public func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {

        let effectIds = Set(effects.map { $0.id })
        guard effectIds.count == effects.count else {
            throw Errors.duplicateEffectId
        }

        let ingredientIds = Set(ingredients.map { $0.id })
        guard ingredientIds.count == ingredients.count else {
            throw Errors.duplicateIngredientId
        }

        for ingredient in ingredients {
            guard ingredient.effects.allSatisfy({ effectIds.contains($0) }) else {
                throw Errors.ingredientReferencesUnknownEffect
            }
        }

        var newState = initialState
        newState.effects = effects
        newState.ingredients = ingredients

        var newCache = initialCache
        MixtureIdentifier.invalidateMixtures(appState: &newState, cache: &newCache)
        newCache.effects = .invalidated(UUID())
        newCache.ingredients = .invalidated(UUID())

        let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)

        return (newState, newCache, [MixtureIdentifier.taskIdentifier: mixtureActivity])
    }
}
