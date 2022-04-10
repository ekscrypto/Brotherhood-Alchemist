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
    
    static func updateSelectedConcoctions(
        _ state: ModelState,
        isCancelled: () -> Bool
    ) -> ModelState {
        var newState = state
        
        var mustHaveIngredients: [Ingredient.Id] = []
        var cantHaveIngredients: [Ingredient.Id] = []
        
        for keyValuePair in state.ingredientsSelection {
            switch keyValuePair.value {
            case .cantHave:
                cantHaveIngredients.append(keyValuePair.key)
            case .mayHave:
                continue
            case .mustHave:
                mustHaveIngredients.append(keyValuePair.key)
            }
        }
        
        if isCancelled() { return state }
        
        var mustHaveEffects: [Effect.Id] = []
        var cantHaveEffects: [Effect.Id] = []
        
        for keyValuePair in state.effectsSelection {
            switch keyValuePair.value {
            case .cantHave:
                cantHaveEffects.append(keyValuePair.key)
            case .mayHave:
                continue
            case .mustHave:
                mustHaveEffects.append(keyValuePair.key)
            }
        }
        
        if isCancelled() { return state }
        
        var matchingConcoctions: [Concoction] = []
        for concoction in state.concoctions {
            if isCancelled() { return state }
            
            guard mustHaveIngredients.allSatisfy({ ingredientId in concoction.ingredients.contains(where: { $0.id == ingredientId }) }),
                  mustHaveEffects.allSatisfy({ effectId in concoction.effects.contains(where: { $0.id == effectId}) }),
                  cantHaveIngredients.allSatisfy({ ingredientId in concoction.ingredients.contains(where: { $0.id == ingredientId}) == false }),
                  cantHaveEffects.allSatisfy({ effectId in concoction.effects.contains(where: { $0.id == effectId}) == false })
            else {
                continue
            }
            matchingConcoctions.append(concoction)
        }
        newState.selectedConcoctions = matchingConcoctions
        return newState
    }
}
