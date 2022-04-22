//
//  IngredientEffectsAdapter.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct EffectsFilter {
    let effects: [Effect]
    
    init(filter: String, sourceEffects: [Effect]) {
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmedFilter.isEmpty {
            effects = sourceEffects
            return
        }
        
        if trimmedFilter.hasPrefix("=") {
            let expectedName = String(trimmedFilter.dropFirst())
            effects = sourceEffects.filter({ (~$0.name).lowercased() == expectedName })
            return
        }
        
        effects = sourceEffects.filter({ (~$0.name).lowercased().contains(trimmedFilter) })
   }
}
