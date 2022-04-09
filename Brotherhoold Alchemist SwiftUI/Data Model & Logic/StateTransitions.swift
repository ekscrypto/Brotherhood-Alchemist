//
//  StateTransitions.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

protocol FilterItem {
    var name: ConstrainedName { get }
}

class StateTransitions {

    static func resetEffects(to selectionState: SelectionState, state: ModelState) -> ModelState {
        var newState = state
        state.effects.forEach { effect in
            newState.effectsSelection[effect.id] = selectionState
        }
        return newState
    }
    
    static func resetIngredients(
        to selectionState: SelectionState,
        state: ModelState
    ) -> ModelState {
        var newState = state
        state.ingredients.forEach { ingredient in
            newState.ingredientsSelection[ingredient.id] = selectionState
        }
        return newState
    }
    
    static func select(
        _ selectionState: SelectionState,
        for effectId: Effect.Id,
        state: ModelState
    ) -> ModelState {
        guard state.effects.contains(where: { $0.id == effectId }) else {
            return state
        }
        var newState = state
        newState.effectsSelection[effectId] = selectionState
        return newState
    }

    static func select(
        _ selectionState: SelectionState,
        for ingredientId: Ingredient.Id,
        state: ModelState
    ) -> ModelState {
        guard state.ingredients.contains(where: { $0.id == ingredientId}) else {
            return state
        }
        var newState = state
        newState.ingredientsSelection[ingredientId] = selectionState
        return newState
    }
}
