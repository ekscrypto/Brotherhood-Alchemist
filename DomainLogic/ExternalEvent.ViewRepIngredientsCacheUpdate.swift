//
//  ExternalEvent.ViewRepIngredientsCacheUpdate.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-04.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension ExternalEvent {
    struct ViewRepIngredientsCacheUpdate: AtomicOperation {
        let ingredients: [ViewRep.Ingredient]
        let reference: UUID
        
        enum Errors: Error {
            case noLongerRelevant
        }
        
        func mutate(
            appState initialState: AppState,
            viewRepCache initialCache: ViewRepCache
        ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
            guard case .invalidated(let invalidationReference) = initialCache.ingredients,
                  invalidationReference == reference
            else {
                throw Errors.noLongerRelevant
            }

            var newCache = initialCache
            newCache.ingredients = .cached(ingredients)
            
            return (initialState, newCache, [:])
        }
    }
}
