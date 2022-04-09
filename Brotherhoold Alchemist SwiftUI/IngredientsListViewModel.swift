//
//  IngredientsListViewModel.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

class IngredientsListViewModel: ObservableObject {
    
    struct State {
        var ingredients: [Ingredient] = DefaultIngredients.all
        var selectionStates: [Ingredient.Id: SelectionState] = [:]
    }
    
    @Published var state: State = .init()
    @Published var filter: String = "" {
        didSet { state = Self.filterIngredients(filter, sourcing: DefaultIngredients.all, state: state) }
    }
    
    func selection(for ingredient: Ingredient) -> Binding<SelectionState> {
        print("> Binding for \(~ingredient.name)")
        return Binding(get: { [unowned self] in
            self.state.selectionStates[ingredient.id] ?? .mayHave
        }, set: { [unowned self] selection in
            self.state = Self.select(selection, for: ingredient.id, state: state)
        })
    }
    
    func effects(for ingredient: Ingredient) -> [Effect] {
        IngredientEffectsAdapter.effects(from: ingredient, sourcing: DefaultEffects.all)
    }
    
    func resetAll(to selectionState: SelectionState) {
        state = Self.resetAll(to: selectionState, sourcing: DefaultIngredients.all, state: state)
    }
    
    func select(_ selectionState: SelectionState, for ingredientId: Ingredient.Id) {
        state = Self.select(selectionState, for: ingredientId, state: state)
    }    

    
    // MARK: - State Manipulators
    static private func filterIngredients(_ filter: String, sourcing allIngredients: [Ingredient], state: State) -> State {
        var newState = state
        let trimmedFilter = filter.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedFilter.isEmpty {
            newState.ingredients = allIngredients
        } else {
            newState.ingredients = allIngredients.filter({ (~$0.name).contains(filter) })
        }
        return newState
    }
    
    static private func resetAll(to selectionState: SelectionState, sourcing allIngredients: [Ingredient], state: State) -> State {
        var newState = state
        allIngredients.forEach { ingredient in
            newState.selectionStates[ingredient.id] = selectionState
        }
        return newState
    }
    
    static private func select(_ selectionState: SelectionState, for ingredientId: Ingredient.Id, state: State) -> State {
        var newState = state
        newState.selectionStates[ingredientId] = selectionState
        return newState
    }
}
