//
//  Mixture.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct Mixture: Identifiable, Codable, Sendable {
    public let id: Id
    let ingredients: Set<Ingredient.Id>
    let effects: Set<Effect.Id>
    let retailValue: SeptimValue
    
    public struct Id: RawRepresentable, Hashable, Sendable, Codable {
        public let rawValue: Int64
        public init(rawValue: Int64) { self.rawValue = rawValue }
        public static var new: Id { .init(rawValue: .random(in: Int64.min ... Int64.max)) }
    }

    public final class ViewModel: Identifiable, Codable, Sendable {
        public let id: Mixture.Id
        public let ingredients: [String]
        public let effects: [String]
        public let value: Int
        
        init(mixture: Mixture, appState: AppState) {
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
        
        public static func preview(ingredients: [String], effects: [String], value: Int) -> ViewModel {
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


