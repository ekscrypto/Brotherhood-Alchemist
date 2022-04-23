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

    @Published private(set) var name: ConstrainedName
    @Published private(set) var value: Value
    @Published private(set) var isPositive: Bool
    @Published private(set) var selection: SelectionState = .mayHave
    @Published private(set) var ingredients: [Ingredient] = []
    
    struct DTO: Codable, ExpressibleByStringLiteral {
        let name: ConstrainedName
        let value: Value
        let isPositive: Bool
        
        init(
            name providedName: ConstrainedName,
            value providedValue: Value,
            isPositive providedIsPositive: Bool
        ) {
            name = providedName
            value = providedValue
            isPositive = providedIsPositive
        }
        
        init(stringLiteral: StringLiteralType) {
            let components = stringLiteral.components(separatedBy: ":")
            guard components.count == 3,
                  let providedName: ConstrainedName = .init(rawValue: components[0]),
                  let rawValue: UInt = .init(components[1]),
                  let providedValue = Value(rawValue: rawValue),
                  ["p","n"].contains(components[2])
            else {
                fatalError()
            }
            name = providedName
            value = providedValue
            isPositive = components[2] == "p"
        }
    }

    var dto: DTO {
        .init(name: name, value: value, isPositive: isPositive)
    }
    
    init(dto: DTO) {
        name = dto.name
        value = dto.value
        isPositive = dto.isPositive
    }
        
    struct Value: Codable, Equatable, RawRepresentable, ExpressibleByIntegerLiteral {
        typealias RawValue = UInt
        let rawValue: UInt
        
        enum Errors: Error {
            case outOfBounds
        }
        
        static let minimim: UInt = 1
        static let maximum: UInt = 50_000
        
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
            guard Self.minimim <= value, value <= Self.maximum else {
                throw Errors.outOfBounds
            }
            return value
        }
    }
}
