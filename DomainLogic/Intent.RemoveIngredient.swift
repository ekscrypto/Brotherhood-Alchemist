//
//  Intent.RemoveIngredient.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct RemoveIngredient: Sendable {
        let ingredientId: Ingredient.Id
        
        public init(id: Ingredient.Id) {
            ingredientId = id
        }
        
        public enum Errors: Error {
            case unknownIngredient
        }
    }
}

extension Intent.RemoveIngredient: AtomicOperation {
    
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
        guard initialState.ingredients.contains(where: { $0.id == ingredientId }) else {
            throw Errors.unknownIngredient
        }
        
        var newState = initialState
        var newCache = initialCache
        MixtureIdentifier.invalidateMixtures(appState: &newState, cache: &newCache)

        newCache.ingredients = .invalidated(UUID())

        newState.ingredients = initialState.ingredients.filter({ $0.id != ingredientId })
        let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)
        
        return (newState, newCache, [MixtureIdentifier.taskIdentifier: mixtureActivity])
    }
}
