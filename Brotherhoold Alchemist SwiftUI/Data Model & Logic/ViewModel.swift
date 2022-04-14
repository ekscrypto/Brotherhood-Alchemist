//
//  ViewModel.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import Combine

class ViewModel {
    @Published var concoctions: [Concoction] = []
    @Published var effects: [Effect] = DefaultEffects.allCases.map { ~$0 }
    @Published var ingredients: [Ingredient] = DefaultIngredients.all
    @Published var updatingConctions: Bool = true
    @Published var seekedIngredient: Ingredient?
    @Published var seekedEffect: Effect?
}
