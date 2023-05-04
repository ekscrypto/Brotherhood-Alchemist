//
//  Intent.CantHaveIngredient.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    final class CantHaveIngredient: Sendable {
        let ingredient: Ingredient.Id
        
        public enum Errors: Error {
            case unknownIngredient
        }
        
        public init(id: Ingredient.Id) {
            ingredient = id
        }
    }
}

extension Intent.CantHaveIngredient: AtomicOperation {
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [ExternalActivity]) {
        guard initialState.ingredients.contains(where: { $0.id == ingredient }) else {
            throw Errors.unknownIngredient
        }
        
        var newState = initialState
        newState.cantHaveIngredients.insert(ingredient)
        newState.mustHaveIngredients.remove(ingredient)
        newState.filteredMixtureViewModels = []
        
        #warning("TODO")
        let newCache = initialCache

        return (newState, newCache, [])
    }
}

