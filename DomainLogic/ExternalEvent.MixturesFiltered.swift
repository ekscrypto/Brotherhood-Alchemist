//
//  ExternalEvent.MixturesFiltered.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-04.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension ExternalEvent {
    struct MixturesFiltered: AtomicOperation {
        let mixtures: [ViewRep.Mixture]
        let mixturesDatasourceRevision: Int64
        
        enum Errors: Error {
            case outdatedData
        }

        func mutate(
            appState initialState: AppState,
            viewRepCache initialCache: ViewRepCache
        ) throws -> (AppState, ViewRepCache, [String : ExternalActivity]) {
            
            guard initialState.mixturesFilterSourceRevision == mixturesDatasourceRevision else {
                throw Errors.outdatedData
            }

            var newCache = initialCache
            newCache.filteredMixtures = .cached(mixtures)
            
            return (initialState, newCache, [:])
        }
    }
}
