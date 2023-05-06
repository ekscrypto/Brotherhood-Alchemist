//
//  Mixture.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-13.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct Mixture: Identifiable, Codable, Sendable {
    public let id: Id
    let ingredients: Set<Ingredient.Id>
    let effects: Set<Effect.Id>
    let retailValue: SeptimValue
    
    public struct Id: RawRepresentable, Hashable, Sendable, Codable {
        public let rawValue: Int64
        public init(rawValue: Int64) { self.rawValue = rawValue }
        public static var new: Id { .init(rawValue: .random(in: Int64.min ... Int64.max)) }
    }
}


