//
//  Grimoire.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-01-21.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class Grimoire {
    
    typealias ConcoctionValueCalculator = ([Effect.Id], [Effect]) -> UInt
    
    let twoOrThreeIngredients: [Concoction]
    let twoIngredients: [Concoction]
    let threeIngredients: [Concoction]
    
    init(effects: [Effect], ingredients: [Ingredient], valueCalculator: ConcoctionValueCalculator) {
        self.twoIngredients = ConcoctionFinder.anyTwo(from: ingredients, effects: effects, valueCalculator: valueCalculator)
        self.threeIngredients = ConcoctionFinder.anyThree(from: ingredients, effects: effects, valueCalculator: valueCalculator)
        self.twoOrThreeIngredients = self.twoIngredients + self.threeIngredients
    }
}
