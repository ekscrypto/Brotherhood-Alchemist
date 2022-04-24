//
//  ConcoctionFilter.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-23.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation
import SwiftUI

struct IngredientFilterBlueprint {
    let id: UUID
    let selection: SelectionState
}

struct EffectFilterBlueprint {
    let id: UUID
    let selection: SelectionState
}

struct ConcoctionFilterBlueprint {
    let id: UUID
    let ingredients: [UUID]
    let effects: [UUID]
    let concoction: Concoction
}

actor ConcoctionFilter {
    
//    actor ResultBuilder {
//        private(set) var match: [Concoction] = []
//
//        func append(_ concoctions: [Concoction]) {
//            match.append(contentsOf: concoctions)
//        }
//    }
    
    func filter(
        _ concoctions: [ConcoctionFilterBlueprint],
        byEffects effectFilters: [EffectFilterBlueprint],
        byIngredients ingredientFilters: [IngredientFilterBlueprint]
    ) async -> [Concoction] {
        let cantHaveEffects: [UUID] = effectFilters.filter({ $0.selection == .cantHave }).map { $0.id }
        let mustHaveEffects: [UUID] = effectFilters.filter({ $0.selection == .mustHave }).map { $0.id }
        let cantHaveIngredients: [UUID] = ingredientFilters.filter({ $0.selection == .cantHave }).map { $0.id }
        let mustHaveIngredients: [UUID] = ingredientFilters.filter({ $0.selection == .mustHave }).map { $0.id }
        
        return concoctions
            .filter { concoction in
                concoction.effects.allSatisfy({ false == cantHaveEffects.contains($0) }) &&
                mustHaveEffects.allSatisfy({ concoction.effects.contains($0) }) &&
                concoction.ingredients.allSatisfy({ false == cantHaveIngredients.contains($0) }) &&
                mustHaveIngredients.allSatisfy({ concoction.ingredients.contains($0) })
            }
            .map { $0.concoction }
////        }
//
//        var pendingTasks: [Task<Void, Never>] = []
//        var index = 0
//        let stride: Int = 2500
//        let resultBuilder: ResultBuilder = .init()
//        while index < concoctions.count {
//            let end = min(concoctions.count, index + stride)
//            let slice = concoctions[index..<end]
//            let task = Task { () -> Void in
//                let concoctions = filter(
//                    slice,
//                    mustHaveEffects: mustHaveEffects,
//                    cantHaveEffects: cantHaveEffects,
//                    mustHaveIngredients: mustHaveIngredients,
//                    cantHaveIngredients: cantHaveIngredients)
//                await resultBuilder.append(concoctions)
//            }
//            pendingTasks.append(task)
//            index += stride
//        }
//        for task in pendingTasks {
//            _ = await task.result
//        }
//        return await resultBuilder.match
    }
    
//    private func filter(
//        _ concoctions: ArraySlice<ConcoctionFilterBlueprint>,
//        mustHaveEffects: [UUID],
//        cantHaveEffects: [UUID],
//        mustHaveIngredients: [UUID],
//        cantHaveIngredients: [UUID]
//    ) -> [Concoction] {
//        concoctions
//            .filter { concoction in
//                concoction.effects.allSatisfy({ false == cantHaveEffects.contains($0) }) &&
//                mustHaveEffects.allSatisfy({ concoction.effects.contains($0) }) &&
//                concoction.ingredients.allSatisfy({ false == cantHaveIngredients.contains($0) }) &&
//                mustHaveIngredients.allSatisfy({ concoction.ingredients.contains($0) })
//            }
//            .map { $0.concoction }
//    }
}
