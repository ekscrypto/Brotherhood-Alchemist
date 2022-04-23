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
    let accessLock: NSLock = .init()
    @Published private(set) var effects: [Effect]
    @Published private(set) var name: ConstrainedName
    @Published private(set) var selection: SelectionState = .mayHave
    
    struct DTO: Codable {
        let name: ConstrainedName
        let effects: [ConstrainedName]
    }
    
    enum Errors: Error {
        case tooManyEffects
        case repeatingEffects
    }
    static let maximumEffects: Int = 4
    
    enum CodingKeys: CodingKey {
        case effects
        case name
    }
    
    var dto: DTO {
        .init(name: name, effects: effects.map { $0.name })
    }
        
    init?(dto: DTO, effects validatedEffects: [Effect]) {
        name = dto.name
        effects = validatedEffects
    }
}
