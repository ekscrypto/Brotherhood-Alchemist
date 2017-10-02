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

    class func populateList() {
        var list: [Effect] = []
        list.append(Effect(.cureDisease, name: NSLocalizedString("Cure Disease", comment: ""), isPositive: true))
        list.append(Effect(.damageHealth, name: NSLocalizedString("Damage Health", comment: ""), isPositive: false))
        list.append(Effect(.damageHealthRegen, name: NSLocalizedString("Damage Health Regen", comment: ""), isPositive: false))
        list.append(Effect(.damageMagicka, name: NSLocalizedString("Damage Magicka", comment: ""), isPositive: false))
        list.append(Effect(.damageMagickaRegen, name: NSLocalizedString("Damage Magicka Regen", comment: ""), isPositive: false))
        list.append(Effect(.damageStamina, name: NSLocalizedString("Damage Stamina", comment: ""), isPositive: false))
        list.append(Effect(.damageStaminaRegen, name: NSLocalizedString("Damage Stamina Regen", comment: ""), isPositive: false))
        list.append(Effect(.fear, name: NSLocalizedString("Fear", comment: ""), isPositive: false))
        list.append(Effect(.fortifyAlteration, name: NSLocalizedString("Fortify Alteration", comment: ""), isPositive: true))
        list.append(Effect(.fortifyBarter, name: NSLocalizedString("Fortify Barter", comment: ""), isPositive: true))
        list.append(Effect(.fortifyBlock, name: NSLocalizedString("Fortify Block", comment: ""), isPositive: true))
        list.append(Effect(.fortifyCarryWeight, name: NSLocalizedString("Fortify Carry Weight", comment: ""), isPositive: true))
        list.append(Effect(.fortifyConjuration, name: NSLocalizedString("Fortify Conjuration", comment: ""), isPositive: true))
        list.append(Effect(.fortifyDestruction, name: NSLocalizedString("Fortify Destruction", comment: ""), isPositive: true))
        list.append(Effect(.fortifyEnchanting, name: NSLocalizedString("Fortify Enchanting", comment: ""), isPositive: true))
        list.append(Effect(.fortifyHealth, name: NSLocalizedString("Fortify Health", comment: ""), isPositive: true))
        list.append(Effect(.fortifyHeavyArmor, name: NSLocalizedString("Fortify Heavy Armor", comment: ""), isPositive: true))
        list.append(Effect(.fortifyIllusion, name: NSLocalizedString("Fortify Illusion", comment: ""), isPositive: true))
        list.append(Effect(.fortifyLightArmor, name: NSLocalizedString("Fortify Light Armor", comment: ""), isPositive: true))
        list.append(Effect(.fortifyLockpicking, name: NSLocalizedString("Fortify Lockpicking", comment: ""), isPositive: true))
        list.append(Effect(.fortifyMagicka, name: NSLocalizedString("Fortify Magicka", comment: ""), isPositive: true))
        list.append(Effect(.fortifyMarksman, name: NSLocalizedString("Fortify Marksman", comment: ""), isPositive: true))
        list.append(Effect(.fortifyOneHanded, name: NSLocalizedString("Fortify One-Handed", comment: ""), isPositive: true))
        list.append(Effect(.fortifyPickpocket, name: NSLocalizedString("Fortify Pickpocket", comment: ""), isPositive: true))
        list.append(Effect(.fortifyRestoration, name: NSLocalizedString("Fortify Restoration", comment: ""), isPositive: true))
        list.append(Effect(.fortifySmithing, name: NSLocalizedString("Fortify Smithing", comment: ""), isPositive: true))
        list.append(Effect(.fortifySneak, name: NSLocalizedString("Fortify Sneak", comment: ""), isPositive: true))
        list.append(Effect(.fortifyStamina, name: NSLocalizedString("Fortify Stamina", comment: ""), isPositive: true))
        list.append(Effect(.fortifyTwoHanded, name: NSLocalizedString("Fortify Two-Handed", comment: ""), isPositive: true))
        list.append(Effect(.frenzy, name: NSLocalizedString("Frenzy", comment: ""), isPositive: true))
        list.append(Effect(.invisibility, name: NSLocalizedString("Invisibility", comment: ""), isPositive: true))
        list.append(Effect(.lingeringDamageHealth, name: NSLocalizedString("Lingering Damage Health", comment: ""), isPositive: true))
        list.append(Effect(.lingeringDamageMagicka, name: NSLocalizedString("Lingering Damage Magicka", comment: ""), isPositive: true))
        list.append(Effect(.lingeringDamageStamina, name: NSLocalizedString("Lingering Damage Stamina", comment: ""), isPositive: true))
        list.append(Effect(.paralysis, name: NSLocalizedString("Paralysis", comment: ""), isPositive: true))
        list.append(Effect(.ravageHealth, name: NSLocalizedString("Ravage Health", comment: ""), isPositive: true))
        list.append(Effect(.ravageMagicka, name: NSLocalizedString("Ravage Magicka", comment: ""), isPositive: true))
        list.append(Effect(.ravageStamina, name: NSLocalizedString("Ravage Stamina", comment: ""), isPositive: true))
        list.append(Effect(.regenerateHealth, name: NSLocalizedString("Regenerate Health", comment: ""), isPositive: true))
        list.append(Effect(.regenerateMagicka, name: NSLocalizedString("Regenerate Magicka", comment: ""), isPositive: true))
        list.append(Effect(.regenerateStamina, name: NSLocalizedString("Regenerate Stamina", comment: ""), isPositive: true))
        list.append(Effect(.resistFire, name: NSLocalizedString("Resist Fire", comment: ""), isPositive: true))
        list.append(Effect(.resistFrost, name: NSLocalizedString("Resist Frost", comment: ""), isPositive: true))
        list.append(Effect(.resistMagic, name: NSLocalizedString("Resist Magic", comment: ""), isPositive: true))
        list.append(Effect(.resistPoison, name: NSLocalizedString("Resist Poison", comment: ""), isPositive: true))
        list.append(Effect(.resistShock, name: NSLocalizedString("Resist Shock", comment: ""), isPositive: true))
        list.append(Effect(.restoreHealth, name: NSLocalizedString("Restore Health", comment: ""), isPositive: true))
        list.append(Effect(.restoreMagicka, name: NSLocalizedString("Restore Magicka", comment: ""), isPositive: true))
        list.append(Effect(.restoreStamina, name: NSLocalizedString("Restore Stamina", comment: ""), isPositive: true))
        list.append(Effect(.slow, name: NSLocalizedString("Slow", comment: ""), isPositive: true))
        list.append(Effect(.waterbreathing, name: NSLocalizedString("Waterbreathing", comment: ""), isPositive: true))
        list.append(Effect(.weaknessToFire, name: NSLocalizedString("Weakness To Fire", comment: ""), isPositive: false))
        list.append(Effect(.weaknessToFrost, name: NSLocalizedString("Weakness To Frost", comment: ""), isPositive: false))
        list.append(Effect(.weaknessToMagic, name: NSLocalizedString("Weakness To Magic", comment: ""), isPositive: false))
        list.append(Effect(.weaknessToPoison, name: NSLocalizedString("Weakness To Poison", comment: ""), isPositive: false))
        list.append(Effect(.weaknessToShock, name: NSLocalizedString("Weakness To Shock", comment: ""), isPositive: false))

        self.all = list.sorted(by: { (effect1, effect2) -> Bool in
            return effect1.name.localizedCompare(effect2.name) == .orderedAscending
        })
    }

}
