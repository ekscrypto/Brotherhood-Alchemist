//
//  Intent.MayHaveEffect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct MayHaveEffect: AtomicOperation, Sendable {
        private let effect: Effect.Id
        
        public enum Errors: Error {
            case unknownEffect
        }
        
        public init(id: Effect.Id) {
            effect = id
        }

        public func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity]) {
            guard initialState.effects.contains(where: { $0.id == effect }) else {
                throw Errors.unknownEffect
            }
            
            var newState = initialState
            newState.mustHaveEffects.remove(effect)
            newState.cantHaveEffects.remove(effect)
            newState.filteredMixtureViewModels = []
            return (newState, [])
        }
    }
}
