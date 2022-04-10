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
        concoctions: [],
        effects: DefaultEffects.all,
        effectsSelection: [:],
        ingredients: DefaultIngredients.all,
        ingredientsSelection: [:],
        selectedConcoctions: [],
        updatingConcoctions: true
    )
    
    init() {
        findAllConcoctions()
    }
    
    private func findAllConcoctions() {
        transientOperation?.cancel()
        let findOperation = FindConcoctions(
            ingredient: state.ingredients,
            effects: state.effects) { [weak self] allConcoctions in
                self?.updateStateWithAllConcoctions(allConcoctions)
            }
        operationQueue.addOperation(findOperation)
    }
    
    private func updateStateWithAllConcoctions(_ allConcoctions: [Concoction]) {
        var transientState = state
        transientState.concoctions = allConcoctions
        updateConcoctions(from: transientState)
    }
    
    private var transientOperation: Operation?
    private let operationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.name = "ViewModel concoctions finder"
        return queue
    }()
    
    static func findAllConcoctions() -> [Concoction] {
        let twoIngredients = ConcoctionFinder.anyTwo(
            from: DefaultIngredients.all,
            effects: DefaultEffects.all,
            valueCalculator: { EffectsValueCalculator.value(effectIds: $0, sourcing: $1) })
        let threeIngredients = ConcoctionFinder.anyThree(
            from: DefaultIngredients.all,
            effects: DefaultEffects.all,
            valueCalculator: { EffectsValueCalculator.value(effectIds: $0, sourcing: $1) })
        return twoIngredients + threeIngredients
    }
    
    func effects(for concoction: Concoction) -> [Effect: SelectionState] {
        var concoctionEffects: [Effect: SelectionState] = [:]
        for effect in state.effects.filter(byId: concoction.effects) {
            concoctionEffects[effect] = state.effectsSelection[effect.id] ?? .mayHave
        }
        return concoctionEffects
    }
    
    func effects(for ingredient: Ingredient) -> [Effect] {
        state.effects.of(ingredient: ingredient)
    }
    
    func ingredients(for concoction: Concoction) -> [Ingredient: SelectionState] {
        var concoctionIngredients: [Ingredient: SelectionState] = [:]
        for ingredient in state.ingredients.filter(byId: concoction.ingredients) {
            concoctionIngredients[ingredient] = state.ingredientsSelection[ingredient.id] ?? .mayHave
        }
        return concoctionIngredients
    }
    
    func ingredients(for effect: Effect) -> [Ingredient] {
        state.ingredients.with(effect: effect)
    }
    
    func resetEffects(to selectionState: SelectionState) {
        let transientState = StateTransitions.resetEffects(to: selectionState, state: state)
        updateConcoctions(from: transientState)
    }

    func resetIngredients(to selectionState: SelectionState) {
        let transientState = StateTransitions.resetIngredients(to: selectionState, state: state)
        updateConcoctions(from: transientState)
    }
    
    func selection(for effect: Effect) -> Binding<SelectionState> {
        return Binding(get: { [unowned self] in
            self.state.effectsSelection[effect.id] ?? .mayHave
        }, set: { [unowned self] selection in
            let transientState = StateTransitions.select(selection, for: effect.id, state: state)
            self.updateConcoctions(from: transientState)
        })
    }
    
    func selection(for ingredient: Ingredient) -> Binding<SelectionState> {
        return Binding(get: { [unowned self] in
            self.state.ingredientsSelection[ingredient.id] ?? .mayHave
        }, set: { [unowned self] selection in
            let transientState = StateTransitions.select(selection, for: ingredient.id, state: state)
            self.updateConcoctions(from: transientState)
        })
    }
    
    func updateConcoctions(from transientState: ModelState) {
        var busyState = transientState
        busyState.updatingConcoctions = true
        busyState.selectedConcoctions = []
        state = busyState
        transientOperation?.cancel()
        let operation = UpdateConcoctions(transientState: transientState, onCompletion: { [weak self] newState in
            var completedState = newState
            completedState.updatingConcoctions = false
            self?.state = completedState
            self?.transientOperation = nil
        })
        transientOperation = operation
        operationQueue.addOperation(operation)
    }
}
