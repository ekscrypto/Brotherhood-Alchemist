//
//  Effects.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class Effect: NSObject {
    enum EffectType {
        case cureDisease
        case damageHealth
        case damageHealthRegen
        case damageMagicka
        case damageMagickaRegen
        case damageStamina
        case damageStaminaRegen
        case fear
        case fortifyAlteration
        case fortifyBarter
        case fortifyBlock
        case fortifyCarryWeight
        case fortifyConjuration
        case fortifyDestruction
        case fortifyEnchanting
        case fortifyHealth
        case fortifyHeavyArmor
        case fortifyIllusion
        case fortifyLightArmor
        case fortifyLockpicking
        case fortifyMagicka
        case fortifyMarksman
        case fortifyOneHanded
        case fortifyPickpocket
        case fortifyRestoration
        case fortifySmithing
        case fortifySneak
        case fortifyStamina
        case fortifyTwoHanded
        case frenzy
        case invisibility
        case lingeringDamageHealth
        case lingeringDamageMagicka
        case lingeringDamageStamina
        case paralysis
        case ravageHealth
        case ravageMagicka
        case ravageStamina
        case regenerateHealth
        case regenerateMagicka
        case regenerateStamina
        case resistFire
        case resistFrost
        case resistMagic
        case resistPoison
        case resistShock
        case restoreHealth
        case restoreMagicka
        case restoreStamina
        case slow
        case waterbreathing
        case weaknessToFire
        case weaknessToFrost
        case weaknessToMagic
        case weaknessToPoison
        case weaknessToShock
    }

    let type: EffectType
    let name: String
    let isPositive: Bool

    static var all: [Effect] = []

    init(_ effect: EffectType, name: String, isPositive: Bool) {
        self.type = effect
        self.name = name
        self.isPositive = isPositive
        super.init()
    }
}
