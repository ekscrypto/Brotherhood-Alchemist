//
//  Intent.UpdateEffect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct UpdateEffect: AtomicOperation, Sendable {
        let effect: Effect
        
        public init(_ effect: Effect) {
            self.effect = effect
        }
        
        public enum Errors: Error {
            case unknownEffect
            case nameIsNotUnique
        }
        
        public func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity]) {
            guard initialState.effects.contains(where: { $0.id == effect.id }) else {
                throw Errors.unknownEffect
            }
            
            guard initialState.effects.allSatisfy({
                $0.id == effect.id || $0.name.localizedCaseInsensitiveCompare(effect.name) != .orderedSame
            }) else {
                throw Errors.nameIsNotUnique
            }
            
            var updatedEffects = initialState.effects.map {
                guard $0.id == effect.id else {
                    return $0
                }
                return effect
            }
            updatedEffects.sortByName()
            
            var newState = initialState
            newState.effects = updatedEffects
            MixtureIdentifier.invalidateMixtures(in: &newState)
            let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)
            return (newState, [mixtureActivity])
        }
    }
}
