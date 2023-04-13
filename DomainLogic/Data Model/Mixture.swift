//
//  Mixture.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct Mixture: Codable, Sendable {
    let ingredients: [Ingredient.Id]
    let effects: [Effect.Id]
    let value: SeptimValue
}
