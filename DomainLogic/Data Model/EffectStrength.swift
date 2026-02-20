//
//  EffectStrength.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2025-02-20.
//  Copyright © 2025 Dave Poirier. All rights reserved.
//

import Foundation

public enum PowerTarget: Codable, Sendable {
    case magnitude
    case duration
}

public struct EffectStrength: Codable, Sendable, Hashable {
    /// Base cost of this effect for gold value calculation (UESP "Base_Cost")
    public let baseCost: Double
    /// Standard magnitude for this effect (UESP "Base_Mag")
    public let baseMagnitude: Int
    /// Standard duration for this effect in seconds (UESP "Base_Dur")
    public let baseDuration: Int
    /// Whether the alchemy power factor scales magnitude or duration
    public let powerTarget: PowerTarget
}
