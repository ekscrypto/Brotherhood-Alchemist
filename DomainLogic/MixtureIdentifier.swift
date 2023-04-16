//
//  MixtureIdentifier.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-14.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation
import Algorithms

actor MixtureIdentifier {
    
    private var ongoingIdentification: Task<Set<Mixture>, Never>?
    
    static let singleton = MixtureIdentifier()
    
    func identify(from appState: AppState) -> Task<Set<Mixture>, Never> {
        ongoingIdentification?.cancel()
        let identificationTask = Task<Set<Mixture>, Never>(priority: .utility) {
            let effects = appState.effects
            let ingredients = appState.ingredients
            
            let mixtures: [Mixture] = effects.withContiguousStorageIfAvailable { contiguousEffects in
                ingredients.withContiguousStorageIfAvailable { contiguousIngredients in
                    // Based on results from known mixtures in previous production builds...
                    // For two ingredients, there's a mixture for every 2.44 permutation
                    // For three ingredients, there's a mixture for every 3.395 permutation
                    // Since there are quite a few more 3-ingredient permutations than 2-ingredients
                    // we can ignore 2-ingredient permutations here -- at worse a re-alloc will occur
                    let countAdjustedForRatio = Float(ingredients.count) / 3.35
                    let expectedMixtures = Int(countAdjustedForRatio * countAdjustedForRatio * countAdjustedForRatio)
                    var mixtures: [Mixture] = []
                    mixtures.reserveCapacity(expectedMixtures)
                    
                    identifyTwoIngredientMixtures(
                        effects: contiguousEffects,
                        ingredients: contiguousIngredients,
                        mixtures: &mixtures)
                    
                    identifyThreeIngredientMixtures(
                        effects: contiguousEffects,
                        ingredients: contiguousIngredients,
                        mixtures: &mixtures)
                    
                    return mixtures
                } ?? []
            } ?? []
            
            return Set(mixtures)
        }
        
        ongoingIdentification = identificationTask
        return identificationTask
    }
    
    private func identifyTwoIngredientMixtures(
        effects: UnsafeBufferPointer<Effect>,
        ingredients: UnsafeBufferPointer<Ingredient>,
        mixtures: inout [Mixture]
    ) {
        for ingredient1Index in 0 ..< ingredients.count {
            for ingredient2Index in ingredient1Index+1 ..< ingredients.count {
                let ingredient1 = ingredients[ingredient1Index]
                let ingredient2 = ingredients[ingredient2Index]
                let commonEffects = ingredient1.effects.intersection(ingredient2.effects)
                if commonEffects.isEmpty { continue }
                let value = effects
                    .filter({ commonEffects.contains($0.id) })
                    .map { $0.baseValue.rawValue }
                    .reduce(0, { $0 + $1 })
                let mixture = Mixture(
                    ingredients: [ingredient1.id, ingredient2.id],
                    effects: commonEffects,
                    value: SeptimValue(rawValue: value)!)
                mixtures.append(mixture)
            }
        }
    }
    
    private func identifyThreeIngredientMixtures(
        effects: UnsafeBufferPointer<Effect>,
        ingredients: UnsafeBufferPointer<Ingredient>,
        mixtures: inout [Mixture]
    ) {
        for ingredient1Index in 0 ..< ingredients.count {
            for ingredient2Index in ingredient1Index+1 ..< ingredients.count {
                for ingredient3Index in ingredient2Index+1 ..< ingredients.count {
                    let ingredient1 = ingredients[ingredient1Index]
                    let ingredient2 = ingredients[ingredient2Index]
                    let ingredient3 = ingredients[ingredient3Index]
                    let commonEffects1And2 = ingredient1.effects.intersection(ingredient2.effects)
                    let commonEffects2And3 = ingredient2.effects.intersection(ingredient3.effects)
                    let commonEffects1And3 = ingredient1.effects.intersection(ingredient3.effects)
                    let commonEffects = commonEffects1And2.union(commonEffects1And3).union(commonEffects2And3)
                    let totalCount = commonEffects.count
                    if commonEffects1And2.count == totalCount { continue } // 3 is useless
                    if commonEffects1And3.count == totalCount { continue } // 2 is useless
                    if commonEffects2And3.count == totalCount { continue } // 1 is useless
                    let value = effects
                        .filter({ commonEffects.contains($0.id) })
                        .map { $0.baseValue.rawValue }
                        .reduce(0, { $0 + $1 })
                    let mixture = Mixture(
                        ingredients: [ingredient1.id, ingredient2.id, ingredient3.id],
                        effects: commonEffects,
                        value: SeptimValue(rawValue: value)!)
                    mixtures.append(mixture)
                }
            }
        }
    }
}
