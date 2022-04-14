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
}

