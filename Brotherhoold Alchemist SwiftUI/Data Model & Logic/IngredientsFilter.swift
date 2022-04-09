//
//  IngredientsFilter.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

extension Array where Element == Ingredient {
    func filter(byName filter: String) -> [Ingredient] {
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedFilter.isEmpty {
            return self
        }
        return self.filter({ (~$0.name).contains(trimmedFilter) })
    }
}
