//
//  IngredientEffectMultiplier.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2025-02-20.
//  Copyright © 2025 Dave Poirier. All rights reserved.
//

import Foundation

public struct IngredientEffectMultiplier: Codable, Sendable, Hashable {
    /// Scales the base magnitude for this ingredient-effect pair. Default 1.0.
    public let magnitudeMultiplier: Double
    /// Scales the base duration for this ingredient-effect pair. Default 1.0.
    public let durationMultiplier: Double
    /// Scales the gold value for this ingredient-effect pair. Default 1.0.
    public let valueMultiplier: Double

    public static let standard = IngredientEffectMultiplier(
        magnitudeMultiplier: 1.0,
        durationMultiplier: 1.0,
        valueMultiplier: 1.0)
}
