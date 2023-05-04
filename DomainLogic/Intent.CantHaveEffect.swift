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
    ) throws -> (AppState, ViewRepCache, [ExternalActivity]) {
        guard initialState.effects.contains(where: { $0.id == effect }) else {
            throw Errors.unknownEffect
        }
        
        var newState = initialState
        newState.mustHaveEffects.remove(effect)
        newState.cantHaveEffects.insert(effect)
        newState.filteredMixtureViewModels = []
        
        #warning("TODO")
        let newCache = initialCache
        
        return (newState, newCache, [])
    }
}
