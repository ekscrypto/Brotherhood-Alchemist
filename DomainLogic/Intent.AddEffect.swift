//
//  AddEffectIntent.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension Intent {
    public struct AddEffect: AtomicOperation, Sendable {
        let effect: Effect
        
        public init(_ effect: Effect) {
            self.effect = effect
        }
        
        public enum Errors: Error {
            case anEffectWithThisIdentifierAlreadyExists
            case duplicatedName
        }
        
        public func mutate(_ initialState: AppState) throws -> (AppState, [ExternalActivity]) {
            guard !initialState.effects.contains(where: { $0.id == effect.id }) else {
                throw Errors.anEffectWithThisIdentifierAlreadyExists
            }
            
            guard !initialState.effects.contains(where: {
                $0.name.localizedCaseInsensitiveCompare(effect.name) == .orderedSame
            }) else {
                throw Errors.duplicatedName
            }
            
            var newState = initialState
            var updatedEffects = initialState.effects
            updatedEffects.append(effect)
            updatedEffects.sortByName()
            newState.effects = updatedEffects
            return (newState, [])
        }
    }
}
