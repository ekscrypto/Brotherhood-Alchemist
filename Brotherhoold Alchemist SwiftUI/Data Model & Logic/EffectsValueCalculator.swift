//
//  EffectsValueCalculator.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class EffectsValueCalculator {
    
    static func value(effectId: Effect.Id, sourcing effets: [Effect]) -> UInt {
        guard let effect = effets.first(where: { $0.id == effectId }) else {
            return 0
        }
        return effect.value.rawValue
    }
    
    static func value(effectIds: [Effect.Id], sourcing effects: [Effect]) -> UInt {
        effectIds.reduce(0) { partialResult, effectId in
            partialResult + value(effectId: effectId, sourcing: effects)
        }
    }

}
