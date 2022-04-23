//
//  Ingredient.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

@MainActor
class Ingredient: Identifiable {
    
    let id: UUID = .init()
    @Published var effects: [Effect]
    @Published var name: ConstrainedName
    @Published var selection: SelectionState = .mayHave
    
    struct ExportDTO: Codable {
        let name: ConstrainedName
        let effects: [ConstrainedName]
    }
    var exportDto: ExportDTO {
        .init(name: name, effects: effects.map { $0.name })
    }

    init(
        name providedName: ConstrainedName,
        effects validatedEffects: [Effect]
    ) {
        name = providedName
        effects = validatedEffects
    }
}

