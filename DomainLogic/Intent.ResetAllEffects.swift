//
//  Intent.ResetAllEffects.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2026-02-20.
//  Copyright © 2026 Dave Poirier. All rights reserved.
//

import Foundation

public extension Intent {
    struct ResetAllEffects: Sendable {
        let selection: SelectionState

        public init(to selection: SelectionState) {
            self.selection = selection
        }
    }
}

extension Intent.ResetAllEffects: AtomicOperation {
    public func mutate(
        appState initialState: AppState,
        viewRepCache initialCache: ViewRepCache
    ) throws -> (AppState, ViewRepCache, [String: ExternalActivity]) {
        var newState = initialState
        let allEffectIds = Set(initialState.effects.map { $0.id })

        switch selection {
        case .mustHave:
            newState.mustHaveEffects = allEffectIds
            newState.cantHaveEffects = []
        case .cantHave:
            newState.mustHaveEffects = []
            newState.cantHaveEffects = allEffectIds
        case .mayHave:
            newState.mustHaveEffects = []
            newState.cantHaveEffects = []
        }

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
