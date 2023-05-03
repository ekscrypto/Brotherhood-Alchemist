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
    var mixtureViewModels: [Mixture.ViewModel]
    
    var mixturesSorterSourceRevision: Int64
    var mixturesSortPreference: MixtureSorter.SortPreference
    var sortedMixturesViewModels: [Mixture.ViewModel]

    var mixturesFilterSourceRevision: Int64
    var mustHaveEffects: Set<Effect.Id>
    var cantHaveEffects: Set<Effect.Id>
    var mustHaveIngredients: Set<Ingredient.Id>
    var cantHaveIngredients: Set<Ingredient.Id>
    var filteredMixtureViewModels: [Mixture.ViewModel]

    static var initial: AppState { .init(
        effects: [],
        ingredients: [],
        mixturesDataSourceRevision: 0,
        mixtures: [],
        mixtureViewModels: [],
        mixturesSorterSourceRevision: 0,
        mixturesSortPreference: .fewerIngredientsHighestValue,
        sortedMixturesViewModels: [],
        mixturesFilterSourceRevision: 0,
        mustHaveEffects: [],
        cantHaveEffects: [],
        mustHaveIngredients: [],
        cantHaveIngredients: [],
        filteredMixtureViewModels: [])
    }
}
