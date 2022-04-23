//
//  EffectValue.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-23.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct EffectValue: Codable, Equatable, RawRepresentable, ExpressibleByIntegerLiteral {
    typealias RawValue = UInt
    let rawValue: UInt
    
    enum Errors: Error {
        case outOfBounds
    }
    
    static let minimim: UInt = 1
    static let maximum: UInt = 50_000
    
    init(integerLiteral: UInt) {
        guard let value = try? Self.evaluated(integerLiteral) else {
            fatalError()
        }
        self.rawValue = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(UInt.self)
        self.rawValue = try Self.evaluated(value)
    }
    
    init?(rawValue: UInt) {
        guard let value = try? Self.evaluated(rawValue) else {
            return nil
        }
        self.rawValue = value
    }
    
    @discardableResult
    static func evaluated(_ value: UInt) throws -> UInt {
        guard Self.minimim <= value, value <= Self.maximum else {
            throw Errors.outOfBounds
        }
        return value
    }
}
