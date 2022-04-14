//
//  Ingredient.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

struct Ingredient: Equatable, Hashable, Identifiable {
    var id: String { ~name }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        ~lhs.name == ~rhs.name &&
        lhs.effects == rhs.effects
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(~self.name)
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
    
    let name: ConstrainedName
    let effects: [Effect]
    let selection: SelectionState = .init()
    
    enum Errors: Error {
        case tooManyEffects
        case repeatingEffects
    }
    static let maximumEffects: Int = 4
    
    init?(name: ConstrainedName, effects: [Effect] ) {
        self.name = name
        guard let uniqueEffects = try? Self.uniqueEffectsWithinBounds(effects) else {
            return nil
        }
        self.effects = uniqueEffects
    }
    
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
