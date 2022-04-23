//
//  Concoctions.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-22.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation
import Combine

class Concoctions {
    
    static var registry: Concoctions = .init()
    
    private var effectsSink: AnyCancellable?
    private var ingredientsSink: AnyCancellable?
    private var effects: [Effect] = []
    private var ingredients: [Ingredient] = []
    @Published var mixing: Bool = true
    
    init(
        effectsRegistry: Effects = .registry,
        ingredientsRegistry: Ingredients = .registry
    ) {
        effectsSink = effectsRegistry.$all.sink(receiveValue: { [weak self] updatedEffects in
            self?.effects = updatedEffects
        })
        ingredientsSink = ingredientsRegistry.$all.sink(receiveValue: { [weak self] updatedIngredients in
            self?.ingredients = updatedIngredients
        })
    }
}
