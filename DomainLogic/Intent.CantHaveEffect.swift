//
//  Intent.CantHaveEffect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct CantHaveEffect: Sendable {
        let effect: Effect.Id
        
        public enum Errors: Error {
            case unknownEffect
        }
        
        public init(id: Effect.Id) {
            effect = id
        }
    }
}

extension Intent.CantHaveEffect: AtomicOperation {
    func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
        guard initialState.effects.contains(where: { $0.id == effect }) else {
            throw Errors.unknownEffect
        }
        
        var newState = initialState
        newState.mustHaveEffects.remove(effect)
        newState.cantHaveEffects.insert(effect)
        
        var newCache = initialCache
        newCache.filteredMixtures = .invalidated(UUID())

        let activities: [String: ExternalActivity]
        switch newCache.mixtures {
        case .cached(let mixtures):
            let filterActivity = MixtureFilter.filterActivity(from: newState, mixtures: mixtures)
            activities = [MixtureFilter.taskIdentifier: filterActivity]
        case .invalidated(_):
            activities = [:]
        }
        
        return (newState, newCache, activities)
    }
}
