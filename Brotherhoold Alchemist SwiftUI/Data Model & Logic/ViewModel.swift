//
//  ViewModel.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var state: ModelState = .init(
        effects: DefaultEffects.all,
        effectsSelection: [:],
        ingredients: DefaultIngredients.all,
        ingredientsSelection: [:])
    
    func selection(for ingredient: Ingredient) -> Binding<SelectionState> {
        return Binding(get: { [unowned self] in
            self.state.ingredientsSelection[ingredient.id] ?? .mayHave
        }, set: { [unowned self] selection in
            self.state = StateTransitions.select(selection, for: ingredient.id, state: state)
        })
    }
    
    func effects(for ingredient: Ingredient) -> [Effect] {
        IngredientEffectsAdapter.effects(from: ingredient, sourcing: state.effects)
    }
    
    func resetIngredients(to selectionState: SelectionState) {
        state = StateTransitions.resetIngredients(to: selectionState, state: state)
    }
    
    func select(_ selectionState: SelectionState, for ingredientId: Ingredient.Id) {
        state = StateTransitions.select(selectionState, for: ingredientId, state: state)
    }
}
