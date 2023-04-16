//
//  Mixture.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct Mixture: Codable, Hashable, Equatable, Sendable {
    let ingredients: Set<Ingredient.Id>
    let effects: Set<Effect.Id>
    let value: SeptimValue
    
    struct ViewModel {
        let ingredients: [String]
        let effects: [String]
        let value: Int
        
        init(mixture: Mixture, appState: AppState) {
            ingredients = appState.ingredients
                .filter { mixture.ingredients.contains($0.id) }
                .map { $0.name }
                .sorted()
            effects = appState.effects
                .filter { mixture.effects.contains($0.id) }
                .map { $0.name }
                .sorted()
            value = Int(mixture.value.rawValue)
        }
    }
}


