//
//  SeptimValue.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct SeptimValue: RawRepresentable, Codable, Sendable {
    public var rawValue: UInt
    
    public init?(rawValue: UInt) {
        guard rawValue < 99_999, rawValue > 0 else {
            return nil
        }
        self.rawValue = rawValue
    }
}
