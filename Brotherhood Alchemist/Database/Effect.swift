//
//  Effect.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import Foundation

struct Effect: Equatable, Codable {
    let name: Name
    let value: Value
    let isPositive: Bool
    
    struct Value: Codable, Equatable {
        let value: UInt
        static let maximumValue: UInt = 50_000
        
        enum Errors: Error {
            case outOfBounds
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let uint = try container.decode(UInt.self)
            guard (1...Self.maximumValue).contains(uint) else {
                throw Errors.outOfBounds
            }
            self.value = uint
        }
        
        init(uint: UInt) throws {
            guard (1...Self.maximumValue).contains(uint) else {
                throw Errors.outOfBounds
            }
            self.value = uint
        }
    }
    
    struct Name: Codable, Equatable {
        let value: String
        static let maximumLength: Int = 48
        
        enum Errors: Error {
            case outOFBounds
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
                .trimmingCharacters(in: .whitespacesAndNewlines)
            guard (1...Name.maximumLength).contains(string.count) else {
                throw Errors.outOFBounds
            }
            self.value = string
        }
        
        init(string: String) throws {
            let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
            guard (1...Name.maximumLength).contains(trimmed.count) else {
                throw Errors.outOFBounds
            }
            self.value = trimmed
        }
    }
}
