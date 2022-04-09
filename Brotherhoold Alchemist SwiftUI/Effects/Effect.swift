//
//  Effect.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import Foundation

struct Effect: Equatable, Codable, Hashable, Identifiable, FilterItem {
    static func == (lhs: Effect, rhs: Effect) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    let id: Id
    let name: ConstrainedName
    let value: Value
    let isPositive: Bool
    
    init(id: Id, name: ConstrainedName, value: Value, isPositive: Bool) {
        self.id = id
        self.name = name
        self.value = value
        self.isPositive = isPositive
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
    
    struct Value: Codable, Equatable, RawRepresentable, ExpressibleByIntegerLiteral {
        typealias RawValue = UInt
        let rawValue: UInt
        
        enum Errors: Error {
            case outOfBounds
        }
        
        static let maximumValue: UInt = 50_000
        
        init(integerLiteral: UInt) {
            guard let value = try? Value.evaluated(integerLiteral) else {
                fatalError()
            }
            self.rawValue = value
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(UInt.self)
            self.rawValue = try Value.evaluated(value)
        }
        
        init?(rawValue: UInt) {
            guard let value = try? Value.evaluated(rawValue) else {
                return nil
            }
            self.rawValue = value
        }
        
        @discardableResult
        static func evaluated(_ value: UInt) throws -> UInt {
            guard (1...Self.maximumValue).contains(value) else {
                throw Errors.outOfBounds
            }
            return value
        }
    }
}
