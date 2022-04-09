//
//  EffectsListViewModel.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

class EffectsListViewModel: ObservableObject {
    
    struct State {
        var effects: [Effect] = DefaultEffects.all
        var enabledEffects: Set<Effect.Id> = .init()
        var expandedEffect: Effect.Id?
    }
    
    @Published var state: State = .init()
    @Published var filter: String = "" {
        didSet { /*state = Self.filterEffects(filter, sourcing: DefaultEffects.all, state: state) */}
    }
    
    func effectDetails(_ effect: Effect) -> EffectDetails {
        EffectDetails(
            effect: effect,
            onTapHeader: { [unowned self] in self.onEffectHeaderTap(effect) },
            onTapShowIngredients: {
                print("Requested to show ingredients for effect \(~effect.name)")
            },
            enabled: Binding(
                get: { [unowned self] in self.state.enabledEffects.contains(effect.id) },
                set: { [unowned self] isOn in self.onEffectEnabled(effect, enabled: isOn) }
            ),
            showExpandedInfo: Binding<Bool>(
                get: { [unowned self] in self.state.expandedEffect == effect.id },
                set: { _ in }),
            knownMatchingIngredients: Binding<[Ingredient]?>(
                get: { nil },
                set: { _ in }))
    }
    
    func disableAllEffects() {
//        self.state = Self.disableAllEffects(state: state)
    }
    
    func enableAllEffects() {
//        self.state = Self.enableAllEffects(sourcing: DefaultEffects.all, state: state)
    }
    
    private func onEffectHeaderTap(_ effect: Effect) {
//        self.state = Self.expandOrCollapse(effect, state: state)
    }
    
    private func onEffectEnabled(_ effect: Effect, enabled: Bool) {
//        state = Self.toggle(effect: effect, enabled: enabled, state: state)
    }
}
