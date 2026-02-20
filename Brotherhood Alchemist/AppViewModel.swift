//
//  AppViewModel.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2023-05-05.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import SwiftUI
import Combine
import DomainLogic

@MainActor
final class AppViewModel: ObservableObject {
    let stateMachine: StateMachine
    @Published var viewRep: ViewRep?
    private var cancellable: AnyCancellable?

    init() {
        stateMachine = StateMachine()
        cancellable = stateMachine.viewRepPublisher
            .sink { [weak self] in self?.viewRep = $0 }
    }

    func loadData() {
        Task {
            try await stateMachine.ingest(Intent.LoadAllData(
                effects: DomainLogic.Effect.all,
                ingredients: DomainLogic.Ingredient.all))
        }
    }

    func toggleIngredientSelection(id: DomainLogic.Ingredient.Id) {
        let current = selectionState(forIngredient: id)
        Task {
            switch current {
            case .mayHave:
                try await stateMachine.ingest(Intent.MustHaveIngredient(id: id))
            case .mustHave:
                try await stateMachine.ingest(Intent.CantHaveIngredient(id: id))
            case .cantHave:
                try await stateMachine.ingest(Intent.MayHaveIngredient(id: id))
            }
        }
    }

    func toggleEffectSelection(id: DomainLogic.Effect.Id) {
        let current = selectionState(forEffect: id)
        Task {
            switch current {
            case .mayHave:
                try await stateMachine.ingest(Intent.MustHaveEffect(id: id))
            case .mustHave:
                try await stateMachine.ingest(Intent.CantHaveEffect(id: id))
            case .cantHave:
                try await stateMachine.ingest(Intent.MayHaveEffect(id: id))
            }
        }
    }

    func selectionState(forIngredient id: DomainLogic.Ingredient.Id) -> SelectionState {
        guard let viewRep else { return .mayHave }
        if viewRep.mustHaveIngredients.contains(id) { return .mustHave }
        if viewRep.cantHaveIngredients.contains(id) { return .cantHave }
        return .mayHave
    }

    func selectionState(forEffect id: DomainLogic.Effect.Id) -> SelectionState {
        guard let viewRep else { return .mayHave }
        if viewRep.mustHaveEffects.contains(id) { return .mustHave }
        if viewRep.cantHaveEffects.contains(id) { return .cantHave }
        return .mayHave
    }

    func resetAllIngredients(to selection: SelectionState) {
        guard let viewRep else { return }
        Task {
            for ingredient in viewRep.ingredients {
                let current = selectionState(forIngredient: ingredient.id)
                if current == selection { continue }
                switch selection {
                case .mustHave:
                    try await stateMachine.ingest(Intent.MustHaveIngredient(id: ingredient.id))
                case .cantHave:
                    try await stateMachine.ingest(Intent.CantHaveIngredient(id: ingredient.id))
                case .mayHave:
                    try await stateMachine.ingest(Intent.MayHaveIngredient(id: ingredient.id))
                }
            }
        }
    }

    func resetAllEffects(to selection: SelectionState) {
        guard let viewRep else { return }
        Task {
            for effect in viewRep.effects {
                let current = selectionState(forEffect: effect.id)
                if current == selection { continue }
                switch selection {
                case .mustHave:
                    try await stateMachine.ingest(Intent.MustHaveEffect(id: effect.id))
                case .cantHave:
                    try await stateMachine.ingest(Intent.CantHaveEffect(id: effect.id))
                case .mayHave:
                    try await stateMachine.ingest(Intent.MayHaveEffect(id: effect.id))
                }
            }
        }
    }
}
