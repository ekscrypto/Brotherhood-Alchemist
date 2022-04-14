//
//  Effect.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import Foundation

struct Effect: Equatable, Codable, Hashable, Identifiable, ExpressibleByStringLiteral {
    var id: String { ~name }

    static func == (lhs: Effect, rhs: Effect) -> Bool {
        ~lhs.name == ~rhs.name &&
        lhs.value == rhs.value &&
        lhs.isPositive == rhs.isPositive
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(~name)
    }
    
    let name: ConstrainedName
    let value: Value
    let isPositive: Bool
    let selection: SelectionState = .init()
    
    init(name: ConstrainedName, value: Value, isPositive: Bool) {
        self.name = name
        self.value = value
        self.isPositive = isPositive
    }
    
    init(stringLiteral: String) {
        let literalComponents = stringLiteral.components(separatedBy: ":")
        guard literalComponents.count == 3,
              let decodedName = ConstrainedName(rawValue: literalComponents[0]),
              let decodedValue = Value(rawValue: UInt(literalComponents[1]) ?? .max)
        else {
              fatalError()
        }
        
        name = decodedName
        value = decodedValue
        isPositive = literalComponents[2] == "p"
    }
    
    enum CodingKeys: CodingKey {
        case name
        case value
        case isPositive
    }
    
//    func encode(to encoder: Encoder) throws {
//        let container = encoder.container(keyedBy: CodingKeys.self)
//        container.encode(isPositive, forKey: .isPositive)
//        container.encode(name, forKey: .name)
//        container.encode(<#T##value: Bool##Bool#>, forKey: <#T##KeyedEncodingContainer<CodingKeys>.Key#>)
//    }
    
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
