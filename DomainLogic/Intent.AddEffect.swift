//
//  AddEffectIntent.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct AddEffect: Sendable {
        let effect: Effect
        
        public enum Errors: Error {
            case anEffectWithThisIdentifierAlreadyExists
            case duplicatedName
        }

        public init(_ effect: Effect) {
            self.effect = effect
        }
    }
}

extension Intent.AddEffect: AtomicOperation {
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
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
        newState.effects = updatedEffects

        var newCache = initialCache
        newCache.effects = .invalidated(UUID())
        
        return (newState, newCache, [:])
    }
}
