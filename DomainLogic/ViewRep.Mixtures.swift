//
//  ViewRep.Mixtures.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-05.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension ViewRep {
    struct Mixtures: Equatable, Sendable {
        let brewing: Bool
        let mixtures: [Mixture]
        
        init(filteredMixtures: ViewRepCache.Cache<[ViewRep.Mixture]>) {
            switch filteredMixtures {
            case .cached(let mixtures):
                self.mixtures = mixtures
                brewing = false
            case .invalidated(_):
                self.mixtures = []
                brewing = true
            }
        }
    }

    public final class Mixture: Identifiable, Equatable, Sendable {
        public static func ==(lhs: Mixture, rhs: Mixture) -> Bool {
            lhs.id == rhs.id &&
            lhs.ingredients == rhs.ingredients &&
            lhs.effects == rhs.effects &&
            lhs.value == rhs.value
        }

        public let id: DomainLogic.Mixture.Id
        public let ingredients: [String]
        public let effects: [String]
        public let value: Int
        
        init(mixture: DomainLogic.Mixture, appState: AppState) {
            id = mixture.id
            ingredients = appState.ingredients
                .filter { mixture.ingredients.contains($0.id) }
                .map { $0.name }
                .sorted()
            effects = appState.effects
                .filter { mixture.effects.contains($0.id) }
                .map { $0.name }
                .sorted()
            value = Int(mixture.retailValue.rawValue)
        }
        
        public static func preview(ingredients: [String], effects: [String], value: Int) -> ViewRep.Mixture {
            .init(ingredients: ingredients, effects: effects, value: value)
        }
        
        init(ingredients: [String], effects: [String], value: Int) {
            self.id = .new
            self.ingredients = ingredients
            self.effects = effects
            self.value = value
        }
    }
}
