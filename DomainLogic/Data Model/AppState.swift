//
//  AppState.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

struct AppState: Codable, Sendable {
    var effects: [Effect]
    var ingredients: [Ingredient]
    var mixtures: [Mixture]
    var mustHaveEffects: Set<Effect.Id>
    var cantHaveEffects: Set<Effect.Id>
    var mustHaveIngredients: Set<Ingredient.Id>
    var cantHaveIngredients: Set<Ingredient.Id>
    
    static var initial: AppState { .init(
        effects: [],
        ingredients: [],
        mixtures: [],
        mustHaveEffects: [],
        cantHaveEffects: [],
        mustHaveIngredients: [],
        cantHaveIngredients: [])
    }
}
