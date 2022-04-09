//
//  Ingredient.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

struct Ingredient: Equatable, Codable, Identifiable {
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
    
    struct Id: Codable, Equatable, RawRepresentable, Hashable, ExpressibleByIntegerLiteral {
        init(integerLiteral value: UInt) {
            self.rawValue = value
        }
        
        init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        typealias IntegerLiteralType = UInt
        
        let rawValue: UInt
    }
    
    let id: Id
    let name: ConstrainedName
    let effects: [Effect.Id]
    var isAvailable: Bool = true
    
    enum Errors: Error {
        case tooManyEffects
        case repeatingEffects
    }
    static let maximumEffects: Int = 4
    
    init?(id: Id, name: ConstrainedName, effects: [Effect.Id] ) {
        self.id = id
        self.name = name
        guard let uniqueEffects = try? Self.uniqueEffectsWithinBounds(effects) else {
            return nil
        }
        self.effects = uniqueEffects
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Self.CodingKeys)
        self.id = try container.decode(Id.self, forKey: .id)
        self.name = try container.decode(ConstrainedName.self, forKey: .name)
        let decodedEffects = try container.decode([Effect.Id].self, forKey: .effects)
        self.effects = try Self.uniqueEffectsWithinBounds(decodedEffects)
        self.isAvailable = try container.decode(Bool.self, forKey: .isAvailable)
    }
    
    @discardableResult
    static func uniqueEffectsWithinBounds(_ effects: [Effect.Id]) throws -> [Effect.Id] {
        guard effects.count <= Self.maximumEffects else {
            throw Errors.tooManyEffects
        }
        guard Set(effects).count == effects.count else {
            throw Errors.repeatingEffects
        }
        return effects
    }
}
