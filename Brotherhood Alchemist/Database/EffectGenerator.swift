//
//  EffectGenerator.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class EffectGenerator: NSObject {
    class func execute() {
        var list: [Effect] = []
        list.append(Effect(.cureDisease, name: NSLocalizedString("Cure Disease", comment: ""), value: 21, isPositive: true))
        list.append(Effect(.damageHealth, name: NSLocalizedString("Damage Health", comment: ""), value: 3, isPositive: false))
        list.append(Effect(.damageMagicka, name: NSLocalizedString("Damage Magicka", comment: ""), value: 52, isPositive: false))
        list.append(Effect(.damageMagickaRegen, name: NSLocalizedString("Damage Magicka Regen", comment: ""), value:265, isPositive: false))
        list.append(Effect(.damageStamina, name: NSLocalizedString("Damage Stamina", comment: ""), value: 32, isPositive: false))
        list.append(Effect(.damageStaminaRegen, name: NSLocalizedString("Damage Stamina Regen", comment: ""), value: 159, isPositive: false))
        list.append(Effect(.fear, name: NSLocalizedString("Fear", comment: ""), value: 120, isPositive: false))
        list.append(Effect(.fortifyAlteration, name: NSLocalizedString("Fortify Alteration", comment: ""), value: 47, isPositive: true))
        list.append(Effect(.fortifyBarter, name: NSLocalizedString("Fortify Barter", comment: ""), value: 48, isPositive: true))
        list.append(Effect(.fortifyBlock, name: NSLocalizedString("Fortify Block", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.fortifyCarryWeight, name: NSLocalizedString("Fortify Carry Weight", comment: ""), value: 208, isPositive: true))
        list.append(Effect(.fortifyConjuration, name: NSLocalizedString("Fortify Conjuration", comment: ""), value: 75, isPositive: true))
        list.append(Effect(.fortifyDestruction, name: NSLocalizedString("Fortify Destruction", comment: ""), value: 151, isPositive: true))
        list.append(Effect(.fortifyEnchanting, name: NSLocalizedString("Fortify Enchanting", comment: ""), value: 14, isPositive: true))
        list.append(Effect(.fortifyHealth, name: NSLocalizedString("Fortify Health", comment: ""), value: 82, isPositive: true))
        list.append(Effect(.fortifyHeavyArmor, name: NSLocalizedString("Fortify Heavy Armor", comment: ""), value: 82, isPositive: true))
        list.append(Effect(.fortifyIllusion, name: NSLocalizedString("Fortify Illusion", comment: ""), value: 94, isPositive: true))
        list.append(Effect(.fortifyLightArmor, name: NSLocalizedString("Fortify Light Armor", comment: ""), value: 55, isPositive: true))
        list.append(Effect(.fortifyLockpicking, name: NSLocalizedString("Fortify Lockpicking", comment: ""), value: 25, isPositive: true))
        list.append(Effect(.fortifyMagicka, name: NSLocalizedString("Fortify Magicka", comment: ""), value: 71, isPositive: true))
        list.append(Effect(.fortifyMarksman, name: NSLocalizedString("Fortify Marksman", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.fortifyOneHanded, name: NSLocalizedString("Fortify One-Handed", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.fortifyPickpocket, name: NSLocalizedString("Fortify Pickpocket", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.fortifyRestoration, name: NSLocalizedString("Fortify Restoration", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.fortifySmithing, name: NSLocalizedString("Fortify Smithing", comment: ""), value: 82, isPositive: true))
        list.append(Effect(.fortifySneak, name: NSLocalizedString("Fortify Sneak", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.fortifyStamina, name: NSLocalizedString("Fortify Stamina", comment: ""), value: 71, isPositive: true))
        list.append(Effect(.fortifyTwoHanded, name: NSLocalizedString("Fortify Two-Handed", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.frenzy, name: NSLocalizedString("Frenzy", comment: ""), value: 107, isPositive: false))
        list.append(Effect(.invisibility, name: NSLocalizedString("Invisibility", comment: ""), value: 261, isPositive: true))
        list.append(Effect(.lingeringDamageHealth, name: NSLocalizedString("Lingering Damage Health", comment: ""), value: 86, isPositive: false))
        list.append(Effect(.lingeringDamageMagicka, name: NSLocalizedString("Lingering Damage Magicka", comment: ""), value: 71, isPositive: false))
        list.append(Effect(.lingeringDamageStamina, name: NSLocalizedString("Lingering Damage Stamina", comment: ""), value: 12, isPositive: false))
        list.append(Effect(.paralysis, name: NSLocalizedString("Paralysis", comment: ""), value: 285, isPositive: false))
        list.append(Effect(.ravageHealth, name: NSLocalizedString("Ravage Health", comment: ""), value: 6, isPositive: false))
        list.append(Effect(.ravageMagicka, name: NSLocalizedString("Ravage Magicka", comment: ""), value: 15, isPositive: false))
        list.append(Effect(.ravageStamina, name: NSLocalizedString("Ravage Stamina", comment: ""), value: 24, isPositive: false))
        list.append(Effect(.regenerateHealth, name: NSLocalizedString("Regenerate Health", comment: ""), value: 177, isPositive: true))
        list.append(Effect(.regenerateMagicka, name: NSLocalizedString("Regenerate Magicka", comment: ""), value: 177, isPositive: true))
        list.append(Effect(.regenerateStamina, name: NSLocalizedString("Regenerate Stamina", comment: ""), value: 177, isPositive: true))
        list.append(Effect(.resistFire, name: NSLocalizedString("Resist Fire", comment: ""), value: 86, isPositive: true))
        list.append(Effect(.resistFrost, name: NSLocalizedString("Resist Frost", comment: ""), value: 86, isPositive: true))
        list.append(Effect(.resistMagic, name: NSLocalizedString("Resist Magic", comment: ""), value: 51, isPositive: true))
        list.append(Effect(.resistPoison, name: NSLocalizedString("Resist Poison", comment: ""), value: 118, isPositive: true))
        list.append(Effect(.resistShock, name: NSLocalizedString("Resist Shock", comment: ""), value: 86, isPositive: true))
        list.append(Effect(.restoreHealth, name: NSLocalizedString("Restore Health", comment: ""), value: 21, isPositive: true))
        list.append(Effect(.restoreMagicka, name: NSLocalizedString("Restore Magicka", comment: ""), value: 25, isPositive: true))
        list.append(Effect(.restoreStamina, name: NSLocalizedString("Restore Stamina", comment: ""), value: 25, isPositive: true))
        list.append(Effect(.slow, name: NSLocalizedString("Slow", comment: ""), value: 247, isPositive: false))
        list.append(Effect(.waterbreathing, name: NSLocalizedString("Waterbreathing", comment: ""), value: 100, isPositive: true))
        list.append(Effect(.weaknessToFire, name: NSLocalizedString("Weakness To Fire", comment: ""), value: 48, isPositive: false))
        list.append(Effect(.weaknessToFrost, name: NSLocalizedString("Weakness To Frost", comment: ""), value: 40, isPositive: false))
        list.append(Effect(.weaknessToMagic, name: NSLocalizedString("Weakness To Magic", comment: ""), value: 51, isPositive: false))
        list.append(Effect(.weaknessToPoison, name: NSLocalizedString("Weakness To Poison", comment: ""), value: 51, isPositive: false))
        list.append(Effect(.weaknessToShock, name: NSLocalizedString("Weakness To Shock", comment: ""), value: 56, isPositive: false))

        Effect.all = list.sorted(by: { (effect1, effect2) -> Bool in
            return effect1.name.localizedCompare(effect2.name) == .orderedAscending
        })
        EffectTracker.markAllActive()
    }

}
