//
//  MixtureFilter.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-04.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

final actor MixtureFilter {
    
    static let taskIdentifier = "MixtureFilter"

    enum MixingMode: Codable, Sendable {
        case septimExtorsion
        case inflictingPain
        case exploration
    }
    
    private enum Errors: Error {
        case keyNotFound
    }

    private static func keyIngredientNames(_ ingredients: [Ingredient]) async -> [Ingredient.Id: String] {
        var ingredientNames: [Ingredient.Id: String] = [:]
        ingredientNames.reserveCapacity(ingredients.count)
        for ingredient in ingredients {
            ingredientNames[ingredient.id] = ingredient.name
        }
        return ingredientNames
    }
    
    private static func keyEffectNames(_ effects: [Effect]) async -> [Effect.Id: String] {
        var effectNames: [Effect.Id: String] = [:]
        effectNames.reserveCapacity(effects.count)
        for effect in effects {
            effectNames[effect.id] = effect.name
        }
        return effectNames
    }
    
    private static func namedSet<T>(sourcing input: Set<T>, from dict: [T: String]) async throws -> Set<String> {
        var output: Set<String> = []
        for key in input {
            guard let value = dict[key] else {
                throw Errors.keyNotFound
            }
            output.insert(value)
        }
        return output
    }
    
    private static func effectsWithOutcome(_ effects: [Effect], outcome: Outcome) async -> Set<String> {
        Set(effects.filter({ $0.outcome == outcome}).map({$0.name}))
    }
    
    static func filterActivity(from appState: AppState, mixtures: [ViewRep.Mixture]) -> ExternalActivity {
        { [appState, mixtures] stateMachine in
            Task { [appState, mixtures, stateMachine] in
                
                async let keyedIngredients = keyIngredientNames(appState.ingredients)
                async let keyedEffects = keyEffectNames(appState.effects)
                async let asyncPositiveEffects = effectsWithOutcome(appState.effects, outcome: .positive)
                async let asyncNegativeEffects = effectsWithOutcome(appState.effects, outcome: .negative)
                
                let allowPositiveEffects: Bool
                let allowNegativeEffects: Bool
                
                switch appState.mixingMode {
                case .septimExtorsion:
                    allowNegativeEffects = true
                    allowPositiveEffects = true
                    break
                case .exploration:
                    allowNegativeEffects = false
                    allowPositiveEffects = true
                    break
                case .inflictingPain:
                    allowNegativeEffects = true
                    allowPositiveEffects = false
                    break
                }
                
                guard !Task.isCancelled else {
                    return
                }
                
                let (cantHaveEffects, mustHaveEffects, cantHaveIngredients, mustHaveIngredients) = try await (
                    namedSet(sourcing: appState.cantHaveEffects, from: keyedEffects),
                    namedSet(sourcing: appState.mustHaveEffects, from: keyedEffects),
                    namedSet(sourcing: appState.cantHaveIngredients, from: keyedIngredients),
                    namedSet(sourcing: appState.mustHaveIngredients, from: keyedIngredients)
                    )

                guard !Task.isCancelled else {
                    return
                }

                var filteredMixtures = mixtures
                
                if !cantHaveEffects.isEmpty {
                    filteredMixtures = filteredMixtures
                        .filter { mixture in
                            mixture.effects.allSatisfy({ !cantHaveEffects.contains($0) })
                        }
                }
                
                let negativeEffects = await asyncNegativeEffects
                let positiveEffects = await asyncPositiveEffects
                
                if !allowNegativeEffects {
                    filteredMixtures = filteredMixtures
                        .filter { mixture in
                            mixture.effects.allSatisfy({ !negativeEffects.contains($0) })
                        }
                }
                
                if !allowPositiveEffects {
                    filteredMixtures = filteredMixtures
                        .filter { mixture in
                            mixture.effects.allSatisfy({ !positiveEffects.contains($0) })
                        }
                }
                
                if !mustHaveEffects.isEmpty {
                    filteredMixtures = filteredMixtures
                        .filter { mixture in
                            !Set(mixture.effects).intersection(mustHaveEffects).isEmpty
                        }
                }
                
                if !cantHaveIngredients.isEmpty {
                    filteredMixtures = filteredMixtures
                        .filter { mixture in
                            mixture.ingredients.allSatisfy({ !cantHaveIngredients.contains($0) })
                        }
                }
                
                if !mustHaveIngredients.isEmpty {
                    filteredMixtures = filteredMixtures
                        .filter { mixture in
                            !Set(mixture.ingredients).intersection(mustHaveIngredients).isEmpty
                        }
                }

                try await stateMachine.ingest(ExternalEvent.MixturesFiltered(
                    mixtures: filteredMixtures,
                    mixturesDatasourceRevision: appState.mixturesFilterSourceRevision))
            }
        }
    }
    

}
