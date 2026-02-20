//
//  MixtureIdentifier.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-14.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation
import Algorithms

enum MixtureIdentifier {
    
    static let taskIdentifier = "MixtureIdentifier"
    
    static func invalidateMixtures(appState: inout AppState, cache: inout ViewRepCache) {
        appState.mixtures = []
        appState.mixturesDataSourceRevision = appState.mixturesDataSourceRevision + 1
        cache.filteredMixtures = .invalidated(UUID())
        cache.mixtures = .invalidated(UUID())
    }
    
    private static func keyIngredientNames(_ ingredients: [Ingredient]) async -> [Ingredient.Id: String] {
        var ingredientNames: [Ingredient.Id: String] = [:]
        ingredientNames.reserveCapacity(ingredients.count)
        for ingredient in ingredients {
            ingredientNames[ingredient.id] = ingredient.name
        }
        return ingredientNames
    }
    
    private struct EffectInfo {
        let name: String
        let isPositiveOutcome: Bool
    }

    private static func keyEffectInfo(_ effects: [Effect]) async -> [Effect.Id: EffectInfo] {
        var effectInfo: [Effect.Id: EffectInfo] = [:]
        effectInfo.reserveCapacity(effects.count)
        for effect in effects {
            effectInfo[effect.id] = EffectInfo(
                name: effect.name,
                isPositiveOutcome: effect.outcome == .positive)
        }
        return effectInfo
    }
    
    private static func generateViewRep(
        keyedIngredients: [Ingredient.Id: String],
        keyedEffects: [Effect.Id: EffectInfo],
        mixtures: [Mixture]
    ) async -> [ViewRep.Mixture] {
        var viewModels: [ViewRep.Mixture] = []
        viewModels.reserveCapacity(mixtures.count)
        for mixture in mixtures {
            let ingredients = mixture.ingredients
                .compactMap { keyedIngredients[$0] }
                .sorted(by: { $0.localizedCaseInsensitiveCompare($1) == .orderedAscending })
            var effectDetails: [ViewRep.EffectDetail] = []
            effectDetails.reserveCapacity(mixture.effectStats.count)
            for (effectId, stats) in mixture.effectStats {
                guard let info = keyedEffects[effectId] else { continue }
                effectDetails.append(ViewRep.EffectDetail(
                    name: info.name,
                    isPositiveOutcome: info.isPositiveOutcome,
                    magnitude: stats.magnitude,
                    duration: stats.duration,
                    goldValue: stats.goldValue))
            }
            effectDetails.sort(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })
            let effects = effectDetails.map { $0.name }
            let viewModel = ViewRep.Mixture(
                ingredients: ingredients,
                effects: effects,
                effectDetails: effectDetails,
                value: Int(mixture.retailValue.rawValue))
            viewModels.append(viewModel)
        }
        return viewModels
    }
    
    static func identificationActivity(from appState: AppState) -> ExternalActivity {
        { [appState] stateMachine in
            Task { [appState, stateMachine] in
                async let ingredientNames = keyIngredientNames(appState.ingredients)
                async let effectInfo = keyEffectInfo(appState.effects)
                
                let identifiedMixtures = try await identify(from: appState)

                guard !Task.isCancelled else {
                    return
                }

                let viewRep = await generateViewRep(
                    keyedIngredients: ingredientNames,
                    keyedEffects: effectInfo,
                    mixtures: identifiedMixtures)

                guard !Task.isCancelled else {
                    return
                }

                try await stateMachine.ingest(ExternalEvent.MixturesIdentified(
                    mixtures: identifiedMixtures,
                    viewRep: viewRep,
                    mixturesDatasourceRevision: appState.mixturesDataSourceRevision))
            }
        }
    }
    
    enum Errors: Error {
        case outdated
    }

    private static func identify(from appState: AppState) async throws -> [Mixture] {
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
                var identifiedMixtures: [Mixture] = []
                identifiedMixtures.reserveCapacity(expectedMixtures)
                
                do {
                    try identifyTwoIngredientMixtures(
                        effects: contiguousEffects,
                        ingredients: contiguousIngredients,
                        mixtures: &identifiedMixtures)
                    
                    try identifyThreeIngredientMixtures(
                        effects: contiguousEffects,
                        ingredients: contiguousIngredients,
                        mixtures: &identifiedMixtures)
                } catch {
                    return []
                }
                return identifiedMixtures
            } ?? []
        } ?? []
        
        return mixtures
    }
    
    private static func identifyTwoIngredientMixtures(
        effects: UnsafeBufferPointer<Effect>,
        ingredients: UnsafeBufferPointer<Ingredient>,
        mixtures: inout [Mixture]
    ) throws {
        for ingredient1Index in 0 ..< ingredients.count {
            for ingredient2Index in ingredient1Index+1 ..< ingredients.count {
                try Task.checkCancellation()
                let ingredient1 = ingredients[ingredient1Index]
                let ingredient2 = ingredients[ingredient2Index]
                let commonEffects = ingredient1.effects.intersection(ingredient2.effects)
                if commonEffects.isEmpty { continue }
                let ingredientIds: Set<Ingredient.Id> = [ingredient1.id, ingredient2.id]
                let (effectStats, totalGold) = PotionCalculator.computeMixtureStats(
                    sharedEffects: commonEffects,
                    ingredientIds: ingredientIds,
                    effects: effects,
                    ingredients: ingredients)
                let mixture = Mixture(
                    id: .new,
                    ingredients: ingredientIds,
                    effects: commonEffects,
                    retailValue: SeptimValue(rawValue: max(1, min(totalGold, 99_998)))!,
                    effectStats: effectStats)
                mixtures.append(mixture)
            }
        }
    }
    
    private static func identifyThreeIngredientMixtures(
        effects: UnsafeBufferPointer<Effect>,
        ingredients: UnsafeBufferPointer<Ingredient>,
        mixtures: inout [Mixture]
    ) throws {
        for ingredient1Index in 0 ..< ingredients.count {
            for ingredient2Index in ingredient1Index+1 ..< ingredients.count {
                for ingredient3Index in ingredient2Index+1 ..< ingredients.count {
                    try Task.checkCancellation()
                    let ingredient1 = ingredients[ingredient1Index]
                    let ingredient2 = ingredients[ingredient2Index]
                    let ingredient3 = ingredients[ingredient3Index]
                    let commonEffects1And2 = ingredient1.effects.intersection(ingredient2.effects)
                    let commonEffects2And3 = ingredient2.effects.intersection(ingredient3.effects)
                    let commonEffects1And3 = ingredient1.effects.intersection(ingredient3.effects)
                    let commonEffects = commonEffects1And2.union(commonEffects1And3).union(commonEffects2And3)
                    let totalCount = commonEffects.count
                    if commonEffects1And2.count == totalCount { continue } // ingredient 3 is useless
                    if commonEffects1And3.count == totalCount { continue } // ingredient 2 is useless
                    if commonEffects2And3.count == totalCount { continue } // ingredient 1 is useless
                    let ingredientIds: Set<Ingredient.Id> = [ingredient1.id, ingredient2.id, ingredient3.id]
                    let (effectStats, totalGold) = PotionCalculator.computeMixtureStats(
                        sharedEffects: commonEffects,
                        ingredientIds: ingredientIds,
                        effects: effects,
                        ingredients: ingredients)
                    let mixture = Mixture(
                        id: .new,
                        ingredients: ingredientIds,
                        effects: commonEffects,
                        retailValue: SeptimValue(rawValue: max(1, min(totalGold, 99_998)))!,
                        effectStats: effectStats)
                    mixtures.append(mixture)
                }
            }
        }
    }
}
