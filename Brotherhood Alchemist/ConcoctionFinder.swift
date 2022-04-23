//
//  ConcoctionFinder.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class ConcoctionFinder {
    
    static func anyTwo(
        from ingredients: [Ingredient]
    ) -> [Concoction] {
        
        guard ingredients.count >= 2 else { return [] }

        let dispatchGroup: DispatchGroup = .init()
        let resultLock: NSLock = .init()
        var concoctions: [Concoction] = []
        for firstIngredientIndex in 0..<(ingredients.count - 1) {
            let ingredient1 = ingredients[firstIngredientIndex]
            
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for secondIngredientIndex in (firstIngredientIndex + 1)..<ingredients.count {
                    let ingredient2 = ingredients[secondIngredientIndex]
                    
                    if let concoction = Self.mix(ingredient1, ingredient2) {
                        resultLock.lock()
                        concoctions.append(concoction)
                        resultLock.unlock()
                    }
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.wait()
        return concoctions
    }
    
    static func anyThree(
        from ingredients: [Ingredient]
    ) -> [Concoction] {
        guard ingredients.count >= 3 else { return [] }
        
        let dispatchGroup: DispatchGroup = .init()
        let resultLock: NSLock = .init()
        var concoctions: [Concoction] = []
        
        for firstIngredientIndex in 0..<(ingredients.count - 2) {
            let ingredient1 = ingredients[firstIngredientIndex]
            
            for secondIngredientIndex in (firstIngredientIndex + 1)..<(ingredients.count - 1) {
                let ingredient2 = ingredients[secondIngredientIndex]
                
                dispatchGroup.enter()
                DispatchQueue.global().async {
                    for thirdIngredientIndex in (secondIngredientIndex + 1)..<ingredients.count {
                        let ingredient3 = ingredients[thirdIngredientIndex]
                        
                        if let concoction = Self.mix(ingredient1, ingredient2, ingredient3) {
                            resultLock.lock()
                            concoctions.append(concoction)
                            resultLock.unlock()
                        }
                    }
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.wait()
        return concoctions
    }
    
    static func mix(
        _ ingredient1: Ingredient,
        _ ingredient2: Ingredient
    ) -> Concoction? {
        let effects1: Set<Effect> = .init(ingredient1.effects)
        let effects2: Set<Effect> = .init(ingredient2.effects)

        let commonEffects: Set<Effect> = effects1.intersection(effects2)
        
        if commonEffects.isEmpty {
            return nil
        }
        
        return Concoction(
            effects: commonEffects.sorted(by: { ~$0.name < ~$1.name }),
            ingredients: [ingredient1, ingredient2].sorted(by: { ~$0.name < ~$1.name }),
            estimatedValue: commonEffects.reduce(0, { partialResult, effect in
                partialResult + effect.value.rawValue
            }))
    }
    
    static func mix(
        _ ingredient1: Ingredient,
        _ ingredient2: Ingredient,
        _ ingredient3: Ingredient
    ) -> Concoction? {
        let effects1: Set<Effect> = .init(ingredient1.effects)
        let effects2: Set<Effect> = .init(ingredient2.effects)
        let effects3: Set<Effect> = .init(ingredient3.effects)
        
        let common1And2: Set<Effect> = effects1.intersection(effects2)
        let common1And3: Set<Effect> = effects1.intersection(effects3)

        if common1And2.isEmpty, common1And3.isEmpty {
            // ingredient1 has no common effect with any of the other two ingredients
            // this recipe is thus a 2 ingredients recipe only (at best)
            return nil
        }

        let common2and3: Set<Effect> = effects2.intersection(effects3)
        if common1And2.isEmpty, common2and3.isEmpty {
            // ingredient2 has no common effect with any of the other two ingredients
            // this recipe is a 2 ingredients only recipe (definite)
            return nil
        }

        if common1And3.isEmpty, common2and3.isEmpty {
            // ingredient3 has no common effect with any of the other two ingredients
            // this recipe is a 2 ingredients only recipe (definite)
            return nil
        }
        
        let commonEffects: Set<Effect> = common1And3.union(common1And2).union(common2and3)
        return Concoction(
            effects: commonEffects.sorted(by: { ~$0.name < ~$1.name }),
            ingredients: [ingredient1, ingredient2, ingredient3].sorted(by: { ~$0.name < ~$1.name }),
            estimatedValue: commonEffects.reduce(0, { partialResult, effect in
                partialResult + effect.value.rawValue
            }))
    }

}
