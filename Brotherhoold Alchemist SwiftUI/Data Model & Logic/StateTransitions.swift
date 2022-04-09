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

    static func filter(_ filter: String, sourcing allEffects: [Effect], state: ModelState) -> ModelState {
        var newState = state
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedFilter.isEmpty {
            newState.effects = allEffects
        } else {
            newState.effects = allEffects.filter({ (~$0.name).contains(filter) })
        }
        return newState
    }

    static func filter(_ filter: String, sourcing allIngredients: [Ingredient], state: ModelState) -> ModelState {
        var newState = state
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedFilter.isEmpty {
            newState.ingredients = allIngredients
        } else {
            newState.ingredients = allIngredients.filter({ (~$0.name).contains(filter) })
        }
        return newState
    }

    static func resetEffects(to selectionState: SelectionState, sourcing allEffects: [Effect], state: ModelState) -> ModelState {
        var newState = state
        allEffects.forEach { effect in
            newState.effectsSelection[effect.id] = selectionState
        }
        return newState
    }
    
    static func resetIngredients(to selectionState: SelectionState, sourcing allIngredients: [Ingredient], state: ModelState) -> ModelState {
        var newState = state
        allIngredients.forEach { ingredient in
            newState.ingredientsSelection[ingredient.id] = selectionState
        }
        return newState
    }
    
    static func select(_ selectionState: SelectionState, for effectId: Effect.Id, state: ModelState) -> ModelState {
        var newState = state
        newState.effectsSelection[effectId] = selectionState
        return newState
    }

    static func select(_ selectionState: SelectionState, for ingredientId: Ingredient.Id, state: ModelState) -> ModelState {
        var newState = state
        newState.ingredientsSelection[ingredientId] = selectionState
        return newState
    }
}
