//
//  ConstrainedName.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-01-19.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct ConstrainedName: Codable, Equatable, RawRepresentable {
    typealias RawValue = String
    let rawValue: String

    enum Errors: Error {
        case outOFBounds
    }
    static let minimumLength: Int = 1
    static let maximumLength: Int = 48

    init(from decoder: Decoder) throws {
        let string = try decoder
            .singleValueContainer()
            .decode(String.self)
        self.rawValue = try Self.evaluated(string)
    }
    
    init?(rawValue: String) {
        guard let value = try? Self.evaluated(rawValue) else {
            return nil
        }
        self.rawValue = value
    }
    
    @discardableResult
    static func evaluated(_ name: String) throws -> String {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard (Self.minimumLength...Self.maximumLength).contains(trimmed.count) else {
            throw Errors.outOFBounds
        }
        return trimmed
    }
}
