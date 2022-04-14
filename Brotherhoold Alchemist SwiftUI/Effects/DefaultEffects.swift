//
//  DefaultEffects.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

enum DefaultEffects: Effect, CaseIterable {
    case cureDisease = "Cure Disease:21:p"
    case damageHealth = "Damage Health:3:n"
    case damageMagicka = "Damage Magicka:52:n"
    case damageMagickaRegen = "Damage Magicka Regen:265:n"
    case damageStamina = "Damage Stamina:32:n"
    case damageStaminaRegen = "Damage Stamina Regen:159:n"
    case fear = "Fear:120:p"
    case fortifyAlteration = "Fortify Alteration:47:p"
    case fortifyBarter = "Fortify Barter:48:p"
    case fortifyBlock = "Fortify Block:118:p"
    case fortifyCarryWeight = "Fortify Carry Weight:208:p"
    case fortifyConjuration = "Fortify Conjuration:75:p"
    case fortifyDestruction = "Fortify Destruction:151:p"
    case fortifyEnchanting = "Fortify Enchanting:14:p"
    case fortifyHealth = "Fortify Health:82:p"
    case fortifyHeavyArmor = "Fortify Heavy Armor:82:p"
    case fortifyIllusion = "Fortify Illusion:94:p"
    case fortifyLightArmor = "Fortify Light Armor:55:p"
    case fortifyLockpicking = "Fortify Lockpicking:25:p"
    case fortifyMagicka = "Fortify Magicka:71:p"
    case fortifyMarksman = "Fortify Marksman:118:p"
    case fortifyOneHanded = "Fortify One-Handed:118:p"
    case fortifyPickpocket = "Fortify Pickpocket:118:p"
    case fortifyRestoration = "Fortify Restoration:118:p"
    case fortifySmithing = "Fortify Smithing:82:p"
    case fortifySneak = "Fortify Sneak:118:p"
    case fortifyStamina = "Fortify Stamina:71:p"
    case fortifyTwoHanded = "Fortify Two-Handed:118:p"
    case frenzy = "Frenzy:107:n"
    case invisibility = "Invisibility:261:p"
    case lingeringDamageHealth = "Lingering Damage Health:86:n"
    case lingeringDamageMagicka = "Lingering Damage Magicka:71:n"
    case lingeringDamageStamina = "Lingering Damage Stamina:12:n"
    case paralysis = "Paralysis:285:n"
    case ravageHealth = "Ravage Health:6:n"
    case ravageMagicka = "Ravage Magicka:15:n"
    case ravageStamina = "Ravage Stamina:24:n"
    case regenerateHealth = "Regenerate Health:177:p"
    case regenerateMagicka = "Regenerate Magicka:177:p"
    case regenerateStamina = "Regenerate Stamina:177:p"
    case resistFire = "Resist Fire:86:p"
    case resistFrost = "Resist Frost:86:p"
    case resistMagic = "Resist Magic:51:p"
    case resistPoison = "Resist Poison:118:p"
    case resistShock = "Resist Shock:86:p"
    case restoreHealth = "Restore Health:21:p"
    case restoreMagicka = "Restore Magicka:25:p"
    case restoreStamina = "Restore Stamina:25:p"
    case slow = "Slow:247:n"
    case waterbreathing = "Waterbreathing:100:p"
    case weaknessToFire = "Weakness To Fire:48:n"
    case weaknessToFrost = "Weakness To Frost:40:n"
    case weaknessToMagic = "Weakness To Magic:51:n"
    case weaknessToPoison = "Weakness To Poison:51:n"
    case weaknessToShock = "Weakness To Shock:56:n"
    
    static prefix func ~ (_ value: DefaultEffects) -> Effect {
        value.rawValue
    }
}
