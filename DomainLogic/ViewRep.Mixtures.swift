//
//  ViewRep.Mixtures.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-05.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

extension ViewRep {

    public struct EffectDetail: Equatable, Sendable {
        public let name: String
        public let isPositiveOutcome: Bool
        public let magnitude: Int
        public let duration: Int
        public let goldValue: Int
    }

    public struct Mixtures: Equatable, Sendable {
        public let brewing: Bool
        public let progress: Double
        public let mixtures: [Mixture]

        init(filteredMixtures: ViewRepCache.Cache<[ViewRep.Mixture]>, identificationProgress: Double) {
            switch filteredMixtures {
            case .cached(let mixtures):
                self.mixtures = mixtures
                brewing = false
                progress = 1.0
            case .invalidated(_):
                self.mixtures = []
                brewing = true
                progress = identificationProgress
            }
        }
    }

    public final class Mixture: Identifiable, Equatable, Sendable {
        public static func ==(lhs: Mixture, rhs: Mixture) -> Bool {
            lhs.id == rhs.id &&
            lhs.ingredients == rhs.ingredients &&
            lhs.effects == rhs.effects &&
            lhs.effectDetails == rhs.effectDetails &&
            lhs.value == rhs.value
        }

        public let id: DomainLogic.Mixture.Id
        public let ingredients: [String]
        public let effects: [String]
        public let effectDetails: [EffectDetail]
        public let value: Int

        public static func preview(ingredients: [String], effects: [String], value: Int) -> ViewRep.Mixture {
            .init(ingredients: ingredients, effects: effects, effectDetails: [], value: value)
        }

        init(ingredients: [String], effects: [String], effectDetails: [EffectDetail], value: Int) {
            self.id = .new
            self.ingredients = ingredients
            self.effects = effects
            self.effectDetails = effectDetails
            self.value = value
        }
    }
}
