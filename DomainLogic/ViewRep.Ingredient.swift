//
//  ViewRep.Ingredient.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-24.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation
import Combine

public extension ViewRep {
    struct Ingredient: Identifiable, Equatable, Sendable {
        public static func ==(lhs: Ingredient, rhs: Ingredient) -> Bool {
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.effects == rhs.effects
        }

        public let id: DomainLogic.Ingredient.Id
        public let name: String
        public let effects: [Effect]
        public let selection: SelectionStatePublisher

        public struct Effect: Identifiable, Equatable, Sendable {
            public let id: DomainLogic.Effect.Id
            public let name: String
            public let isPositiveOutcome: Bool
            
            init(from effect: DomainLogic.Effect) {
                id = effect.id
                name = effect.name
                isPositiveOutcome = effect.outcome == .positive
            }
            
            init(
                id: DomainLogic.Effect.Id,
                name: String,
                isPositiveOutcome: Bool
            ) {
                self.id = id
                self.name = name
                self.isPositiveOutcome = isPositiveOutcome
            }
        }
        
        init(
            from ingredient: DomainLogic.Ingredient,
            effectsSource: [DomainLogic.Effect]
        ) {
            id = ingredient.id
            name = ingredient.name
            effects = effectsSource
                .filter { ingredient.effects.contains($0.id) }
                .map { .init(from: $0) }
                .sorted(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })
            selection = SelectionStatePublisherCache.viewRepPublisher(for: ingredient.id)
        }
        
        init(
            id: DomainLogic.Ingredient.Id,
            name: String,
            effects: [Effect]
        ) {
            self.id = id
            self.name = name
            self.effects = effects
            selection = SelectionStatePublisherCache.viewRepPublisher(for: id)
        }
    }
}
