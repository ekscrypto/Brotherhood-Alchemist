//
//  Intent.RemoveEffect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct RemoveEffect: AtomicOperation, Sendable {
        let effectId: Effect.Id
        
        public init(id: Effect.Id) {
            effectId = id
        }
        
        public enum Errors: Error {
            case unknownEffect
            case effectIsInUse
        }
        
        public func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity]) {
            guard initialState.effects.contains(where: { $0.id == effectId }) else {
                throw Errors.unknownEffect
            }
            
            guard initialState.ingredients.allSatisfy({ !$0.effects.contains(effectId) }) else {
                throw Errors.effectIsInUse
            }
            
            var newState = initialState
            newState.effects = initialState.effects.filter({ $0.id != effectId })
            return (newState, [])
        }
    }
}
