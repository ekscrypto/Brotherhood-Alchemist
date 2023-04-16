//
//  File.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct MayHaveIngredient: AtomicOperation, Sendable {
        private let ingredient: Ingredient.Id
        
        public enum Errors: Error {
            case unknownIngredient
        }
        
        public init(id: Ingredient.Id) {
            ingredient = id
        }

        func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity]) {
            guard initialState.ingredients.contains(where: { $0.id == ingredient }) else {
                throw Errors.unknownIngredient
            }
            
            var newState = initialState
            newState.mustHaveIngredients.remove(ingredient)
            newState.cantHaveIngredients.remove(ingredient)
            newState.filteredMixtureViewModels = []
            return (newState, [])
        }
    }
}
