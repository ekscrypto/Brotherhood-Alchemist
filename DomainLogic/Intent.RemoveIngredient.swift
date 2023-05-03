//
//  Intent.RemoveIngredient.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct RemoveIngredient: AtomicOperation, Sendable {
        let ingredientId: Ingredient.Id
        
        public init(id: Ingredient.Id) {
            ingredientId = id
        }
        
        public enum Errors: Error {
            case unknownIngredient
        }
        
        public func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity]) {
            guard initialState.ingredients.contains(where: { $0.id == ingredientId }) else {
                throw Errors.unknownIngredient
            }
            
            var newState = initialState
            newState.ingredients = initialState.ingredients.filter({ $0.id != ingredientId })
            MixtureIdentifier.invalidateMixtures(in: &newState)
            let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)
            return (newState, [mixtureActivity])
        }
    }
}
