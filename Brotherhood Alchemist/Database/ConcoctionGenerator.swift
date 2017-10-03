//
//  ConcoctionGenerator.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class ConcoctionGenerator: NSObject {

    class func execute() {

        for index1 in 0..<Ingredient.all.count {
            let ingredient1 = Ingredient.all[index1]

            for index2 in 0..<Ingredient.all.count where index2 > index1 {
                let ingredient2 = Ingredient.all[index2]

                let baseCommonEffects = findCommonEffects(set1: ingredient1.effects, set2: ingredient2.effects)

                if baseCommonEffects.count == 0 {
                    continue
                }

                let baseConcoction = Concoction(ingredients: [ingredient1.type, ingredient2.type],
                                                effects: baseCommonEffects,
                                                estimatedValue: estimateTotalValue(baseCommonEffects))
                Concoction.all.append(baseConcoction)

                for index3 in 0..<Ingredient.all.count where index3 > index2 {
                    let ingredient3 = Ingredient.all[index3]

                    let commonWithIngredient1 = findCommonEffects(set1: ingredient3.effects, set2: ingredient1.effects)
                    let commonwithIngredient2 = findCommonEffects(set1: ingredient3.effects, set2: ingredient2.effects)
                    let combinedEffects = uniqueEffects(set1: baseCommonEffects, set2: commonWithIngredient1, set3: commonwithIngredient2)
                    if combinedEffects.count > baseCommonEffects.count {
                        let advancedConcoction = Concoction(ingredients: [ingredient1.type, ingredient2.type, ingredient3.type],
                                                            effects: combinedEffects,
                                                            estimatedValue: estimateTotalValue(combinedEffects))
                        Concoction.all.append(advancedConcoction)
                    }
                }
            }
        }

        Concoction.all = Concoction.all.sorted(by: { (concoction1, concoction2) -> Bool in
            return concoction1.estimatedValue > concoction2.estimatedValue
        })
    }

    private class func findCommonEffects(set1: [Effect.EffectType], set2: [Effect.EffectType]) -> [Effect.EffectType] {
        var commonEffects: [Effect.EffectType] = []
        for effect in set1 {
            if set2.contains(effect) {
                commonEffects.append(effect)
            }
        }
        return commonEffects
    }

    private class func estimateTotalValue(_ effects: [Effect.EffectType] ) -> Int {
        var estimatedValue: Int = 0

        for effectType in effects {
            let effect = Effect.matchingType(effectType)
            estimatedValue += effect?.value ?? 0
        }
        return estimatedValue
    }

    private class func uniqueEffects(set1: [Effect.EffectType], set2: [Effect.EffectType], set3: [Effect.EffectType]) -> [Effect.EffectType] {
        var uniqueEffects: [Effect.EffectType] = set1
        for effect in set2 where uniqueEffects.contains(effect) == false {
            uniqueEffects.append(effect)
        }
        for effect in set3 where uniqueEffects.contains(effect) == false {
            uniqueEffects.append(effect)
        }
        return uniqueEffects
    }
}
