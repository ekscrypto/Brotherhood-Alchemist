//
//  Concoction.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class Concoction: NSObject {
    let effects: [Effect.EffectType]
    let ingredients: [Ingredient.IngredientType]
    let estimatedValue: Int

    static var all: [Concoction] = []

    init(ingredients: [Ingredient.IngredientType], effects: [Effect.EffectType], estimatedValue: Int ) {
//        print("Creating concoction with ingredients: \(ingredients) effects \(effects) estimated value: \(estimatedValue)")
        self.effects = effects
        self.ingredients = ingredients
        self.estimatedValue = estimatedValue
        super.init()
    }
}
