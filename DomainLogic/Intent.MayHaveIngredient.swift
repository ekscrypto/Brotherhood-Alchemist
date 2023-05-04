//
//  File.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct MayHaveIngredient: Sendable {
        let ingredient: Ingredient.Id
        
        public enum Errors: Error {
            case unknownIngredient
        }
        
        public init(id: Ingredient.Id) {
            ingredient = id
        }
    }
}

extension Intent.MayHaveIngredient: AtomicOperation {
    
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
        guard initialState.ingredients.contains(where: { $0.id == ingredient }) else {
            throw Errors.unknownIngredient
        }
        
        var newState = initialState
        newState.mustHaveIngredients.remove(ingredient)
        newState.cantHaveIngredients.remove(ingredient)
        newState.filteredMixtureViewModels = []
        
        #warning("TODO")
        let newCache = initialCache
        
        return (newState, newCache, [:])
    }
}
