//
//  Intent.MustHaveIngredient.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct MustHaveIngredient: AtomicOperation, Sendable {
        private let ingredient: Ingredient.Id
        
        public enum Errors: Error {
            case unknownIngredient
        }
        
        public init(id: Ingredient.Id) {
            ingredient = id
        }

        func mutate(_ initialState: AppState) throws -> AppState {
            guard initialState.ingredients.contains(where: { $0.id == ingredient }) else {
                throw Errors.unknownIngredient
            }
            
            var newState = initialState
            newState.mustHaveIngredients.insert(ingredient)
            newState.cantHaveIngredients.remove(ingredient)
            return newState
        }
    }
}
