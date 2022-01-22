//
//  ConcoctionFilters.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class ConcoctionEffectsFilter {
    enum Rule {
        case only
        case allOf
        case anyOf
    }
    
    static func filter(_ concoctions: [Concoction], on filterEffects: [Effect.Id], rule: Rule) -> [Concoction] {
        let filterCode: (Concoction) -> Bool
        switch rule {
        case .only:
            filterCode = { concoction in
                concoction.effects.allSatisfy({ filterEffects.contains($0) })
            }
        case .allOf:
            filterCode = { concotion in
                filterEffects.allSatisfy({ concotion.effects.contains($0) })
            }
        case .anyOf:
            filterCode = { concoction in
                filterEffects.first(where: { concoction.effects.contains($0)}) != nil
            }
        }
        return concoctions.filter { filterCode($0) }
    }
}

class ConcoctionIngredientsFilter {
    enum Rule {
        case only
        case allOf
        case anyOf
    }

    static func filter(_ concoctions: [Concoction], on filterIngredients: [Ingredient.Id], rule: Rule) -> [Concoction] {
        let filterCode: (Concoction) -> Bool
        switch rule {
        case .only:
            filterCode = { concoction in
                concoction.ingredients.allSatisfy({ filterIngredients.contains($0) })
            }
        case .allOf:
            filterCode = { concotion in
                filterIngredients.allSatisfy({ concotion.ingredients.contains($0) })
            }
        case .anyOf:
            filterCode = { concoction in
                filterIngredients.first(where: { concoction.ingredients.contains($0)}) != nil
            }
        }
        return concoctions.filter { filterCode($0) }
    }
}
