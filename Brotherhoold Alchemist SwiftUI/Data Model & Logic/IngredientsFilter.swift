//
//  IngredientsFilter.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

extension Array where Element == Ingredient {
    
    func filter(byId ingredientIds: [Ingredient.Id]) -> [Ingredient] {
        self.filter({ ingredientIds.contains($0.id) })
    }
    
    func filter(byName filter: String) -> [Ingredient] {
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmedFilter.isEmpty {
            return self
        }
        if trimmedFilter.hasPrefix("=") {
            let expectedName = String(trimmedFilter.dropFirst())
            return self.filter({ (~$0.name).lowercased() == expectedName })
        }
        return self.filter({ (~$0.name).lowercased().contains(trimmedFilter) })
    }
    
    func with(effect: Effect) -> [Ingredient] {
        self.filter({ $0.effects.contains(effect.id) })
    }
}
