//
//  PotionCalculator.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2025-02-20.
//  Copyright © 2025 Dave Poirier. All rights reserved.
//

import Foundation

enum PotionCalculator {

    /// Fixed power factor at 100 Alchemy, no perks, no Fortify Alchemy
    /// = fAlchemyIngredientInitMult * (1 + (fAlchemySkillFactor - 1) * skill/100)
    /// = 4.0 * (1 + (1.5 - 1) * 100/100) = 4.0 * 1.5 = 6.0
    static let powerFactor: Double = 6.0

    /// Compute magnitude, duration, and gold value for one effect in a mixture.
    /// The "strongest" ingredient (highest gold contribution) determines the stats.
    static func computeEffectStats(
        effectStrength: EffectStrength,
        ingredientMultipliers: [IngredientEffectMultiplier]
    ) -> MixtureEffectStats {

        var bestMagnitude = 0
        var bestDuration = 0
        var bestGold = 0

        for multiplier in ingredientMultipliers {
            let baseMag = Double(effectStrength.baseMagnitude) * multiplier.magnitudeMultiplier
            let baseDur = Double(effectStrength.baseDuration) * multiplier.durationMultiplier

            let magnitude: Int
            let duration: Int

            switch effectStrength.powerTarget {
            case .magnitude:
                magnitude = Int((baseMag * powerFactor).rounded())
                duration = Int(baseDur.rounded())
            case .duration:
                magnitude = Int(baseMag.rounded())
                duration = Int((baseDur * powerFactor).rounded())
            }

            let magnitudeFactor = magnitude > 0 ? Double(magnitude) : 1.0
            let durationFactor = duration > 0 ? Double(duration) / 10.0 : 1.0
            let goldValue = Int(floor(effectStrength.baseCost * pow(magnitudeFactor * durationFactor, 1.1) * multiplier.valueMultiplier))

            if goldValue > bestGold {
                bestGold = goldValue
                bestMagnitude = magnitude
                bestDuration = duration
            }
        }

        return MixtureEffectStats(
            magnitude: bestMagnitude,
            duration: bestDuration,
            goldValue: bestGold)
    }

    /// Compute per-effect stats and total gold for an entire mixture.
    static func computeMixtureStats(
        sharedEffects: Set<Effect.Id>,
        ingredientIds: Set<Ingredient.Id>,
        effects: UnsafeBufferPointer<Effect>,
        ingredients: UnsafeBufferPointer<Ingredient>
    ) -> (effectStats: [Effect.Id: MixtureEffectStats], totalGold: UInt) {

        var stats: [Effect.Id: MixtureEffectStats] = [:]
        stats.reserveCapacity(sharedEffects.count)
        var totalGold: UInt = 0

        for effectId in sharedEffects {
            guard let effect = effects.first(where: { $0.id == effectId }) else { continue }

            var multipliers: [IngredientEffectMultiplier] = []
            for i in 0 ..< ingredients.count {
                let ingredient = ingredients[i]
                guard ingredientIds.contains(ingredient.id) else { continue }
                if let mult = ingredient.effectMultipliers[effectId] {
                    multipliers.append(mult)
                }
            }

            let effectStat = computeEffectStats(
                effectStrength: effect.strength,
                ingredientMultipliers: multipliers)
            stats[effectId] = effectStat
            totalGold += UInt(effectStat.goldValue)
        }

        return (stats, totalGold)
    }
}
