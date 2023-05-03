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
    
    init(from appState: AppState) {
        ingredients = appState.ingredients.map {
            .init(from: $0, effectsSource: appState.effects)
        }
        effects = appState.effects.map {
            .init(from: $0)
        }
    }
}
