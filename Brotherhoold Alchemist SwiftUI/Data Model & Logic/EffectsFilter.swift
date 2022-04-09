//
//  IngredientEffectsAdapter.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

extension Array where Element == Effect {
    func filter(byName filter: String) -> [Effect] {
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedFilter.isEmpty {
            return self
        }
        return self.filter({ (~$0.name).contains(trimmedFilter) })
    }

    func of(ingredient: Ingredient) -> [Effect] {
        self.filter({ ingredient.effects.contains($0.id) })
    }
}

