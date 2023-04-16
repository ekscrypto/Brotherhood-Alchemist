//
//  MixtureIdentifier.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-14.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

actor MixtureIdentifier {
    
    private var ongoingIdentification: Task<Set<Mixture>, Never>?
    
    static let singleton = MixtureIdentifier()
    
    func identify(from appState: AppState) -> Task<Set<Mixture>, Never> {
        ongoingIdentification?.cancel()
        let identificationTask = Task<Set<Mixture>, Never>(priority: .utility) {
            let effects = appState.effects.filter({ !appState.cantHaveEffects.contains($0.id) })
            let ingredients = appState.ingredients.filter({ !appState.cantHaveIngredients.contains($0.id) })
            //            let baseIngredients = ingredients.filter({ appState.mustHaveIngredients.contains($0.id) })
            // when must have is empty... baseIngredients is empty and mixtures is... empty
            // if must have is more than 3 ingredients, it should produce 0 results, yet mixtures are generated
            // logic is wrong here.  Needs revision.
            
            let mixtures: Set<Mixture> = await withTaskGroup(of: Set<Mixture>.self) { group in
                for baseIngredient in ingredients {
                    guard group.addTaskUnlessCancelled(operation: {
                        var groupMixtures: Set<Mixture> = []
                        for secondIngredient in ingredients where secondIngredient.id != baseIngredient.id {
                            let commonBaseAndSecond = baseIngredient.effects
                                .intersection(secondIngredient.effects)
                                .subtracting(appState.cantHaveEffects)
                            
                            if !commonBaseAndSecond.isEmpty {
                                let value = effects
                                    .filter({ commonBaseAndSecond.contains($0.id) })
                                    .map { $0.baseValue.rawValue }
                                    .reduce(0, { $0 + $1 })
                                let mixture = Mixture(
                                    ingredients: [baseIngredient.id, secondIngredient.id],
                                    effects: commonBaseAndSecond,
                                    value: SeptimValue(rawValue: value)!)
                                groupMixtures.insert(mixture)
                            }
                            
                            for thirdIngredient in ingredients where thirdIngredient.id != baseIngredient.id && thirdIngredient.id != secondIngredient.id {
                                let commonBaseAndThird = baseIngredient.effects
                                    .intersection(thirdIngredient.effects)
                                    .subtracting(appState.cantHaveEffects)
                                let commonSecondAndThird = secondIngredient.effects
                                    .intersection(thirdIngredient.effects)
                                    .subtracting(appState.cantHaveEffects)
                                let complexMixtureEffectIds = commonBaseAndSecond
                                    .union(commonBaseAndThird)
                                    .union(commonSecondAndThird)
                                guard !complexMixtureEffectIds.isEmpty,
                                      complexMixtureEffectIds != commonBaseAndSecond, // third ingredient is useless
                                      complexMixtureEffectIds != commonSecondAndThird, // base ingredient is useless
                                      complexMixtureEffectIds != commonBaseAndThird // second ingredient is useless
                                else { continue }
                                
                                let matchingEffects = effects
                                    .filter({ complexMixtureEffectIds.contains($0.id) })
                                let complexMixtureValue = matchingEffects
                                    .map { $0.baseValue.rawValue }
                                    .reduce(0, { $0 + $1 })
                                let complexMixture = Mixture(
                                    ingredients: [baseIngredient.id, secondIngredient.id, thirdIngredient.id],
                                    effects: complexMixtureEffectIds,
                                    value: SeptimValue(rawValue: complexMixtureValue)!)
                                groupMixtures.insert(complexMixture)
                            }
                        }
                        return groupMixtures
                    }) else {
                        break
                    }
                }
                
                var mixtures: Set<Mixture> = []
                for await groupMixtures in group {
                    mixtures.formUnion(groupMixtures)
                }
                return mixtures
            }
            print("Found \(mixtures.count) mixtures")
            return mixtures
        }
        ongoingIdentification = identificationTask
        return identificationTask
    }
}
