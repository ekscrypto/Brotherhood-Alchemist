////
////  FindConcoctions.swift
////  Brotherhoold Alchemist SwiftUI
////
////  Created by Dave Poirier on 2022-04-09.
////  Copyright © 2022 Dave Poirier. All rights reserved.
////
//
//import Foundation
//
//class FindConcoctions: Operation {
//    
//    let ingredients: [Ingredient]
//    let effects: [Effect]
//    let onCompletion: ([Concoction]) -> Void
//
//    init(ingredient providedIngredients: [Ingredient],
//         effects providedEffects: [Effect],
//         onCompletion providedCompletion: @escaping ([Concoction]) -> Void
//    ) {
//        ingredients = providedIngredients
//        effects = providedEffects
//        onCompletion = providedCompletion
//    }
//    
//    override func main() {
//        let twoIngredients = ConcoctionFinder.anyTwo(
//            from: DefaultIngredients.all,
//            effects: DefaultEffects.allCases.map { ~$0 },
//            valueCalculator: { EffectsValueCalculator.value(effectIds: $0, sourcing: $1) })
//        let threeIngredients = ConcoctionFinder.anyThree(
//            from: DefaultIngredients.all,
//            effects: DefaultEffects.all,
//            valueCalculator: { EffectsValueCalculator.value(effectIds: $0, sourcing: $1) })
//        let concoctions = twoIngredients + threeIngredients
//        DispatchQueue.main.async {
//            self.onCompletion(concoctions)
//        }
//    }
//}
