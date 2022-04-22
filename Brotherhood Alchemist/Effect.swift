//
//  Effect.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import Foundation

class Effect: Identifiable, Equatable, ExpressibleByStringLiteral, RawRepresentable, Codable {
    var rawValue: String {
        "\(name.rawValue):\(value.rawValue):\(isPositive ? "p" : "n")"
    }
    
    let id: UUID = .init()
    typealias RawValue = String

    @Published var name: ConstrainedName
    @Published var value: Value
    @Published var isPositive: Bool
    @Published var selection: SelectionState = .mayHave
    @Published var ingredients: [IngredientRef] = []
    
    class IngredientRef {
        weak var ref: Ingredient?
        
        init(_ ingredient: Ingredient) {
            ref = ingredient
        }
    }
    
    init(name providedName: ConstrainedName,
         value providedValue: Value,
         isPositive providedIsPositive: Bool) {
        name = providedName
        value = providedValue
        isPositive = providedIsPositive
    }
    
    func removeIngredientsNilRefs() {
        ingredients.removeAll(where: { $0.ref == nil })
    }
    
    struct LiteralComponents {
        let name: ConstrainedName
        let value: Value
        let isPositive: Bool
    }
    static func decoded(literal stringLiteral: String) -> LiteralComponents? {
        let literalComponents = stringLiteral.components(separatedBy: ":")
        guard literalComponents.count == 3,
              let decodedName = ConstrainedName(rawValue: literalComponents[0]),
              let decodedValue = Value(rawValue: UInt(literalComponents[1]) ?? .max)
        else {
              return nil
        }
        return LiteralComponents(
            name: decodedName,
            value: decodedValue,
            isPositive: literalComponents[2] == "p")
    }
    
    required init?(rawValue providedRawValue: String) {
        guard let literalComponents = Self.decoded(literal: providedRawValue) else {
            return nil
        }

        name = literalComponents.name
        value = literalComponents.value
        isPositive = literalComponents.isPositive
    }
    
    required init(stringLiteral: String) {
        guard let literalComponents = Self.decoded(literal: stringLiteral) else {
            fatalError()
        }
        
        name = literalComponents.name
        value = literalComponents.value
        isPositive = literalComponents.isPositive
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringLiteral = try container.decode(String.self)
        
        guard let literalComponents = Self.decoded(literal: stringLiteral) else {
            fatalError()
        }
        
        name = literalComponents.name
        value = literalComponents.value
        isPositive = literalComponents.isPositive
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
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
