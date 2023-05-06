//
//  ExternalEvent.MixturesIdentified.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-16.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension ExternalEvent {
    struct MixturesIdentified: AtomicOperation, Sendable {
        let mixtures: [Mixture]
        let viewRep: [ViewRep.Mixture]
        let mixturesDatasourceRevision: Int64
        
        enum Errors: Error {
            case outdatedData
        }

        func mutate(
            appState initialState: AppState,
            viewRepCache initialCache: ViewRepCache
        ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
            guard initialState.mixturesDataSourceRevision == mixturesDatasourceRevision else {
                throw Errors.outdatedData
            }
            
            var newState = initialState
            newState.mixtures = mixtures
            
            var newCache = initialCache
            newCache.mixtures = .cached(viewRep)
            
            guard case .invalidated(_) = newCache.filteredMixtures else {
                fatalError()
            }
            
            let filterActivity = MixtureFilter.filterActivity(from: newState, mixtures: viewRep)
            
            return (newState, newCache, [MixtureFilter.taskIdentifier: filterActivity])
        }
    }
}
