//
//  Ingredient.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class Ingredient: Equatable, Hashable, Identifiable {
    let id: UUID = .init()
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
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
    
    @Published private(set) var effects: [Effect]
    @Published private(set) var name: ConstrainedName
    @Published var selection: SelectionState = .mayHave

    enum Errors: Error {
        case tooManyEffects
        case repeatingEffects
    }
    static let maximumEffects: Int = 4
    
//    enum CodingKeys: CodingKey {
//        case effects
//        case name
//        case selection
//    }
    
    init?(name: ConstrainedName, effects: [Effect] ) {
        self.name = name
        guard let uniqueEffects = try? Self.uniqueEffectsWithinBounds(effects) else {
            return nil
        }
        self.effects = uniqueEffects
    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(ConstrainedName.self, forKey: .name)
//        effects = try container.decode([Effect].self, forKey: .effects)
//    }
    
    @discardableResult
    static func uniqueEffectsWithinBounds(_ effects: [Effect]) throws -> [Effect] {
        guard effects.count <= Self.maximumEffects else {
            throw Errors.tooManyEffects
        }
        guard Set(effects).count == effects.count else {
            throw Errors.repeatingEffects
        }
        return effects
    }
}
