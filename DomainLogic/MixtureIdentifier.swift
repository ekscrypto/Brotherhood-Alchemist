//
//  MixtureIdentifier.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-14.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation
import Algorithms

final actor MixtureIdentifier {
    
    private var ongoingIdentificationRevision: Int64 = .min
    private var ongoingIdentification: Task<[Mixture], Error>?
    
    static func invalidateMixtures(in appState: inout AppState) {
        appState.mixtures = []
        appState.mixtureViewModels = []
        appState.filteredMixtureViewModels = []
        appState.mixturesDataSourceRevision = appState.mixturesDataSourceRevision + 1
    }
    
    static func identificationActivity(from appState: AppState) -> ExternalActivity {
        { [appState] stateMachine in
            Task.detached { [appState, stateMachine] in
                let identificationTask = try await stateMachine.singletons.mixtureIdentifier.identify(from: appState)
                guard case .success(let identifiedMixtures) = await identificationTask.result else {
                    return
                }
                var ingredientNames: [Ingredient.Id: String] = [:]
                for ingredient in appState.ingredients {
                    ingredientNames[ingredient.id] = ingredient.name
                }
                var effectNames: [Effect.Id: String] = [:]
                for effect in appState.effects {
                    effectNames[effect.id] = effect.name
                }
                var viewModels: [Mixture.ViewModel] = []
                viewModels.reserveCapacity(identifiedMixtures.count)
                for mixture in identifiedMixtures {
                    let ingredients = mixture.ingredients
                        .compactMap { ingredientNames[$0] }
                        .sorted(by: { $0.localizedCaseInsensitiveCompare($1) == .orderedAscending })
                    let effects = mixture.effects
                        .compactMap { effectNames[$0] }
                        .sorted(by: { $0.localizedCaseInsensitiveCompare($1) == .orderedAscending })
                    let viewModel = Mixture.ViewModel(
                        ingredients: ingredients,
                        effects: effects,
                        value: Int(mixture.retailValue.rawValue))
                    viewModels.append(viewModel)
                }
                try await stateMachine.ingest(ExternalEvent.MixturesIdentified(
                    mixtures: identifiedMixtures,
                    mixturesViewModels: viewModels,
                    mixturesDatasourceRevision: appState.mixturesDataSourceRevision))
            }
        }
    }
    
    enum Errors: Error {
        case outdated
    }

    func identify(from appState: AppState) throws -> Task<[Mixture], Error> {
        guard appState.mixturesDataSourceRevision > ongoingIdentificationRevision else {
            throw Errors.outdated
        }
        
        ongoingIdentification?.cancel()
        ongoingIdentificationRevision = appState.mixturesDataSourceRevision
        let identificationTask = Task<[Mixture], Error>(priority: .utility) {
            try Task.checkCancellation()
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
        
        ongoingIdentification = identificationTask
        return identificationTask
    }
    
    private func identifyTwoIngredientMixtures(
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
                let value = effects
                    .filter({ commonEffects.contains($0.id) })
                    .map { $0.baseValue.rawValue }
                    .reduce(0, { $0 + $1 })
                let mixture = Mixture(
                    id: .new,
                    ingredients: [ingredient1.id, ingredient2.id],
                    effects: commonEffects,
                    retailValue: SeptimValue(rawValue: value)!)
                mixtures.append(mixture)
            }
        }
    }
    
    private func identifyThreeIngredientMixtures(
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
                    if commonEffects1And2.count == totalCount { continue } // 3 is useless
                    if commonEffects1And3.count == totalCount { continue } // 2 is useless
                    if commonEffects2And3.count == totalCount { continue } // 1 is useless
                    let value = effects
                        .filter({ commonEffects.contains($0.id) })
                        .map { $0.baseValue.rawValue }
                        .reduce(0, { $0 + $1 })
                    let mixture = Mixture(
                        id: .new,
                        ingredients: [ingredient1.id, ingredient2.id, ingredient3.id],
                        effects: commonEffects,
                        retailValue: SeptimValue(rawValue: value)!)
                    mixtures.append(mixture)
                }
            }
        }
    }
}
