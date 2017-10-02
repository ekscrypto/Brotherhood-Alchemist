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
        case fortifyConjuration
        case fortifyIllusion
        case fortifyDestruction
        case fortifySneak
        case weaknessToFire
        case weaknessToFrost
        case weaknessToPoison
        case weaknessToShock
    }

    let type: EffectType
    let name: String
    let isPositive: Bool

    static var all: [EffectType:Effect] = [:]

    init(_ effect: EffectType, name: String, isPositive: Bool) {
        self.type = effect
        self.name = name
        self.isPositive = isPositive
        super.init()
    }

    class func populateList() {
        all[.cureDisease] = Effect(.cureDisease, name: NSLocalizedString("Cure Disease", comment: ""), isPositive: true)
        all[.damageHealth] = Effect(.damageHealth, name: NSLocalizedString("Damage Health", comment: ""), isPositive: false)
        all[.damageHealthRegen] = Effect(.damageHealthRegen, name: NSLocalizedString("Damage Health Regeneration", comment: ""), isPositive: false)
        all[.damageMagicka] = Effect(.damageMagicka, name: NSLocalizedString("Damage Magicka", comment: ""), isPositive: false)
        all[.damageMagickaRegen] = Effect(.damageMagickaRegen, name: NSLocalizedString("Damage Magicka Regeneration", comment: ""), isPositive: false)
        all[.damageStamina] = Effect(.damageStamina, name: NSLocalizedString("Damage Stamina", comment: ""), isPositive: false)
        all[.damageStaminaRegen] = Effect(.damageStaminaRegen, name: NSLocalizedString("Damage Stamina Regeneration", comment: ""), isPositive: false)
    }

}
