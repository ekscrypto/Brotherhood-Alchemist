//
//  Intent.RemoveEffect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct RemoveEffect: Sendable {
        let effectId: Effect.Id
        
        public init(id: Effect.Id) {
            effectId = id
        }
        
        public enum Errors: Error {
            case unknownEffect
            case effectIsInUse
        }
    }
}

extension Intent.RemoveEffect: AtomicOperation {
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [ExternalActivity]) {
        guard initialState.effects.contains(where: { $0.id == effectId }) else {
            throw Errors.unknownEffect
        }
        
        guard initialState.ingredients.allSatisfy({ !$0.effects.contains(effectId) }) else {
            throw Errors.effectIsInUse
        }
        
        var newState = initialState
        newState.effects = initialState.effects.filter({ $0.id != effectId })
        
        var newCache = initialCache
        newCache.effects = .invalidated(UUID())
        
        return (newState, newCache, [])
    }
}
