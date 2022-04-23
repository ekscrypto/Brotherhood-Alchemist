//
//  ConstrainedName.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-01-19.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct ConstrainedName: Codable, Equatable, RawRepresentable, ExpressibleByStringLiteral, Hashable {
    typealias StringLiteralType = String
    
    typealias RawValue = String
    let rawValue: String

    enum Errors: Error {
        case outOFBounds
        case invalidCharacters
    }
    static let minimumLength: Int = 1
    static let maximumLength: Int = 48

    init(from decoder: Decoder) throws {
        let string = try decoder
            .singleValueContainer()
            .decode(String.self)
        self.rawValue = try Self.evaluated(string)
    }
    
    init(stringLiteral: String) {
        guard let value = try? Self.evaluated(stringLiteral) else {
            fatalError()
        }
        rawValue = value
    }

    init?(rawValue providedRawValue: String) {
        guard let value = try? Self.evaluated(providedRawValue) else {
            return nil
        }
        rawValue = value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
    
    @discardableResult
    static func evaluated(_ name: String) throws -> String {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard (Self.minimumLength...Self.maximumLength).contains(trimmed.count) else {
            throw Errors.outOFBounds
        }
        let allowedCharacters: CharacterSet = .alphanumerics
            .union(CharacterSet(charactersIn: "-'"))
            .union(.whitespaces)
            .subtracting(CharacterSet(charactersIn: "\t"))
            .inverted
        guard trimmed.components(separatedBy: allowedCharacters).count == 1 else {
            throw Errors.invalidCharacters
        }
        return trimmed
    }
    
    static prefix func ~(_ name: ConstrainedName) -> String {
        name.rawValue
    }
}
