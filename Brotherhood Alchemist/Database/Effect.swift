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

    static var all: [Effect] = []

    init(_ effect: EffectType, name: String, isPositive: Bool) {
        self.type = effect
        self.name = name
        self.isPositive = isPositive
        super.init()
    }

    class func populateList() {
        var list: [Effect] = []
        list.append(Effect(.cureDisease, name: NSLocalizedString("Cure Disease", comment: ""), isPositive: true))
        list.append(Effect(.damageHealth, name: NSLocalizedString("Damage Health", comment: ""), isPositive: false))
        list.append(Effect(.damageHealthRegen, name: NSLocalizedString("Damage Health Regen", comment: ""), isPositive: false))
        list.append(Effect(.damageMagicka, name: NSLocalizedString("Damage Magicka", comment: ""), isPositive: false))
        list.append(Effect(.damageMagickaRegen, name: NSLocalizedString("Damage Magicka Regen", comment: ""), isPositive: false))
        list.append(Effect(.damageStamina, name: NSLocalizedString("Damage Stamina", comment: ""), isPositive: false))
        list.append(Effect(.damageStaminaRegen, name: NSLocalizedString("Damage Stamina Regen", comment: ""), isPositive: false))

        self.all = list.sorted(by: { (effect1, effect2) -> Bool in
            return effect1.name.localizedCompare(effect2.name) == .orderedAscending
        })
    }

}
