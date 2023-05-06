//
//  Intent.UpdateEffect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct UpdateEffect: Sendable {
        let effect: Effect
        
        public init(_ effect: Effect) {
            self.effect = effect
        }
        
        public enum Errors: Error {
            case unknownEffect
            case nameIsNotUnique
        }
    }
}

extension Intent.UpdateEffect: AtomicOperation {
    
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
        guard initialState.effects.contains(where: { $0.id == effect.id }) else {
            throw Errors.unknownEffect
        }
        
        guard initialState.effects.allSatisfy({
            $0.id == effect.id || $0.name.localizedCaseInsensitiveCompare(effect.name) != .orderedSame
        }) else {
            throw Errors.nameIsNotUnique
        }
        
        let updatedEffects = initialState.effects.map {
            guard $0.id == effect.id else {
                return $0
            }
            return effect
        }
        
        var newState = initialState
        var newCache = initialCache
        MixtureIdentifier.invalidateMixtures(appState: &newState, cache: &newCache)

        newCache.effects = .invalidated(UUID()) // we are updating the effects
        newCache.ingredients = .invalidated(UUID()) // ingredients include the effects name, which may be updated
        
        newState.effects = updatedEffects
        let mixtureActivity = MixtureIdentifier.identificationActivity(from: newState)
        
        return (newState, newCache, [MixtureIdentifier.taskIdentifier: mixtureActivity])
    }
}
