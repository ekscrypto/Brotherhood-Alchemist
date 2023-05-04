//
//  ViewRep.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-24.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct ViewRep: Equatable, Sendable {
    let ingredients: [ViewRep.Ingredient]
    let effects: [ViewRep.Effect]
    
    init(from stateAndCache: (AppState, ViewRepCache), cachingTo stateMachine: StateMachine?) {
        let (appState, viewRepCache) = stateAndCache
        
        switch viewRepCache.ingredients {
        case .cached(let cachedIngredients):
            ingredients = cachedIngredients
            
        case .invalidated(let reference):
            let ingredientsViewRep: [ViewRep.Ingredient] = appState.ingredients
                .map { .init(from: $0, effectsSource: appState.effects) }
                .sorted(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })
            ingredients = ingredientsViewRep
            
            Task {
                try await stateMachine?.ingest(ExternalEvent.ViewRepIngredientsCacheUpdate(
                    ingredients: ingredientsViewRep,
                    reference: reference))
            }
        }
        
        switch viewRepCache.effects {
        case .cached(let cachedEffects):
            effects = cachedEffects
            
        case .invalidated(let reference):
            let effectsViewRep: [ViewRep.Effect] = appState.effects
                .map { .init(from: $0) }
                .sorted(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })
            effects = effectsViewRep
            
            Task {
                try await stateMachine?.ingest(ExternalEvent.ViewRepEffectsCacheUpdate(
                    effects: effectsViewRep,
                    reference: reference))
            }
        }
    }
}
