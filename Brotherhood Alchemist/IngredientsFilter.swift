//
//  IngredientsFilter.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct IngredientsFilter {
    let ingredients: [Ingredient]
    
    init(filter: String, sourceIngredients: [Ingredient]) {
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmedFilter.isEmpty {
            ingredients = sourceIngredients
            return
        }
        
        if trimmedFilter.hasPrefix("=") {
            let expectedName = String(trimmedFilter.dropFirst())
            ingredients = sourceIngredients.filter({ (~$0.name).lowercased() == expectedName })
            return
        }
        
        ingredients = sourceIngredients.filter({ (~$0.name).lowercased().contains(trimmedFilter) })
   }
}
