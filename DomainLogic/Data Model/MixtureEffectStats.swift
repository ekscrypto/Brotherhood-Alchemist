//
//  MixtureEffectStats.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2025-02-20.
//  Copyright © 2025 Dave Poirier. All rights reserved.
//

import Foundation

public struct MixtureEffectStats: Codable, Sendable, Hashable {
    /// The computed magnitude (after alchemy power factor and ingredient multiplier)
    public let magnitude: Int
    /// The computed duration in seconds (after alchemy power factor and ingredient multiplier)
    public let duration: Int
    /// The gold value contribution from this effect
    public let goldValue: Int
}
