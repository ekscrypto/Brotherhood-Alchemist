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
    
    func effects(for ingredient: Ingredient) -> [Effect] {
        state.effects.of(ingredient: ingredient)
    }
    
    func ingredients(for effect: Effect) -> [Ingredient] {
        state.ingredients.with(effect: effect)
    }
    
    func resetEffects(to selectionState: SelectionState) {
        state = StateTransitions.resetEffects(to: selectionState, state: state)
    }

    func resetIngredients(to selectionState: SelectionState) {
        state = StateTransitions.resetIngredients(to: selectionState, state: state)
    }
    
    func selection(for effect: Effect) -> Binding<SelectionState> {
        return Binding(get: { [unowned self] in
            self.state.effectsSelection[effect.id] ?? .mayHave
        }, set: { [unowned self] selection in
            self.state = StateTransitions.select(selection, for: effect.id, state: state)
        })
    }
    
    func selection(for ingredient: Ingredient) -> Binding<SelectionState> {
        return Binding(get: { [unowned self] in
            self.state.ingredientsSelection[ingredient.id] ?? .mayHave
        }, set: { [unowned self] selection in
            self.state = StateTransitions.select(selection, for: ingredient.id, state: state)
        })
    }
    
}
