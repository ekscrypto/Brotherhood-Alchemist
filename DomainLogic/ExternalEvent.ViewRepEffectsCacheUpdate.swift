//
//  ExternalEvent.ViewRepEffectsCacheUpdate.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-04.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension ExternalEvent {
    struct ViewRepEffectsCacheUpdate: AtomicOperation {
        let effects: [ViewRep.Effect]
        let reference: UUID
        
        enum Errors: Error {
            case noLongerRelevant
        }
        
        func mutate(
            appState initialState: AppState,
            viewRepCache initialCache: ViewRepCache
        ) throws -> (AppState, ViewRepCache, [ExternalActivity]) {
            guard case .invalidated(let invalidationReference) = initialCache.effects,
                  invalidationReference == reference
            else {
                throw Errors.noLongerRelevant
            }

            var newCache = initialCache
            newCache.effects = .cached(effects)
            
            return (initialState, newCache, [])
        }
    }
}
