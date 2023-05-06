//
//  AppState.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct AppState: Codable, Sendable {
    var effects: [Effect]
    var ingredients: [Ingredient]
    
    var mixturesDataSourceRevision: Int64
    var mixtures: [Mixture]
    
    var mixturesFilterSourceRevision: Int64
    var mixingMode: MixtureFilter.MixingMode
    var mustHaveEffects: Set<Effect.Id>
    var cantHaveEffects: Set<Effect.Id>
    var mustHaveIngredients: Set<Ingredient.Id>
    var cantHaveIngredients: Set<Ingredient.Id>

    static var initial: AppState { .init(
        effects: [],
        ingredients: [],
        mixturesDataSourceRevision: 0,
        mixtures: [],
        mixturesFilterSourceRevision: 0,
        mixingMode: .septimExtorsion,
        mustHaveEffects: [],
        cantHaveEffects: [],
        mustHaveIngredients: [],
        cantHaveIngredients: [])
    }
}
