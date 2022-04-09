//
//  State.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct ModelState {
    var effects: [Effect]
    var effectsSelection: [Effect.Id: SelectionState]
    var ingredients: [Ingredient]
    var ingredientsSelection: [Ingredient.Id: SelectionState]
}
