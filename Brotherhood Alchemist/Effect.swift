//
//  Effect.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import Foundation

@MainActor
class Effect: Identifiable {
    
    let id: UUID = .init()
    @Published var name: ConstrainedName
    @Published var value: EffectValue
    @Published var isPositive: Bool
    @Published var selection: SelectionState = .mayHave
    @Published var ingredients: [Ingredient] = []
    
    struct ExportDTO: Codable {
        let name: ConstrainedName
        let value: EffectValue
        let isPositive: Bool
    }

    var exportDto: ExportDTO {
        .init(name: name, value: value, isPositive: isPositive)
    }
    
    init(
        name providedName: ConstrainedName,
        value providedValue: EffectValue,
        isPositive providedIsPositive: Bool
    ) {
        name = providedName
        value = providedValue
        isPositive = providedIsPositive
    }
}
