//
//  ExternalEvent.MixtureIdentificationProgress.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2026-02-20.
//  Copyright © 2026 Dave Poirier. All rights reserved.
//

import Foundation

extension ExternalEvent {
    struct MixtureIdentificationProgress: AtomicOperation, Sendable {
        let progress: Double
        let mixturesDataSourceRevision: Int64

        enum Errors: Error {
            case outdatedData
        }

        public func mutate(
            appState initialState: AppState,
            viewRepCache initialCache: ViewRepCache
        ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
            guard initialState.mixturesDataSourceRevision == mixturesDataSourceRevision else {
                throw Errors.outdatedData
            }
            var newState = initialState
            newState.mixtureIdentificationProgress = progress
            return (newState, initialCache, [:])
        }
    }
}
