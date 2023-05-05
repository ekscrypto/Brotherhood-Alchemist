//
//  ExternalEvent.MixturesSorted.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-04.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension ExternalEvent {
    struct MixturesSorted: AtomicOperation {
        let mixturesViewModels: [Mixture.ViewModel]
        let mixturesDatasourceRevision: Int64
        
        enum Errors: Error {
            case outdatedData
        }

        func mutate(
            appState initialState: AppState,
            viewRepCache initialCache: ViewRepCache
        ) throws -> (AppState, ViewRepCache, [String : ExternalActivity]) {
            
            guard initialState.mixturesSorterSourceRevision == mixturesDatasourceRevision else {
                throw Errors.outdatedData
            }
            
            var newState = initialState
            newState.sortedMixturesViewModels = mixturesViewModels
            
            return (newState, initialCache, [:])
        }
    }
}
