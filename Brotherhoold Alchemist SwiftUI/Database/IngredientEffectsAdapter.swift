//
//  IngredientEffectsAdapter.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class IngredientEffectsAdapter {
    class func effects(from ingredient: Ingredient, sourcing allEffects: [Effect]) -> [Effect] {
        return allEffects.filter({ ingredient.effects.contains($0.id) })
    }
}
