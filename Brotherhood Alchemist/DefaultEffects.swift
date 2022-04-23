//
//  DefaultEffects.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct DefaultEffects {
    static let cureDisease: Effect.DTO = "Cure Disease:21:p"
    static let damageHealth: Effect.DTO = "Damage Health:3:n"
    static let damageMagicka: Effect.DTO = "Damage Magicka:52:n"
    static let damageMagickaRegen: Effect.DTO = "Damage Magicka Regen:265:n"
    static let damageStamina: Effect.DTO = "Damage Stamina:32:n"
    static let damageStaminaRegen: Effect.DTO = "Damage Stamina Regen:159:n"
    static let fear: Effect.DTO = "Fear:120:p"
    static let fortifyAlteration: Effect.DTO = "Fortify Alteration:47:p"
    static let fortifyBarter: Effect.DTO = "Fortify Barter:48:p"
    static let fortifyBlock: Effect.DTO = "Fortify Block:118:p"
    static let fortifyCarryWeight: Effect.DTO = "Fortify Carry Weight:208:p"
    static let fortifyConjuration: Effect.DTO = "Fortify Conjuration:75:p"
    static let fortifyDestruction: Effect.DTO = "Fortify Destruction:151:p"
    static let fortifyEnchanting: Effect.DTO = "Fortify Enchanting:14:p"
    static let fortifyHealth: Effect.DTO = "Fortify Health:82:p"
    static let fortifyHeavyArmor: Effect.DTO = "Fortify Heavy Armor:82:p"
    static let fortifyIllusion: Effect.DTO = "Fortify Illusion:94:p"
    static let fortifyLightArmor: Effect.DTO = "Fortify Light Armor:55:p"
    static let fortifyLockpicking: Effect.DTO = "Fortify Lockpicking:25:p"
    static let fortifyMagicka: Effect.DTO = "Fortify Magicka:71:p"
    static let fortifyMarksman: Effect.DTO = "Fortify Marksman:118:p"
    static let fortifyOneHanded: Effect.DTO = "Fortify One-Handed:118:p"
    static let fortifyPickpocket: Effect.DTO = "Fortify Pickpocket:118:p"
    static let fortifyRestoration: Effect.DTO = "Fortify Restoration:118:p"
    static let fortifySmithing: Effect.DTO = "Fortify Smithing:82:p"
    static let fortifySneak: Effect.DTO = "Fortify Sneak:118:p"
    static let fortifyStamina: Effect.DTO = "Fortify Stamina:71:p"
    static let fortifyTwoHanded: Effect.DTO = "Fortify Two-Handed:118:p"
    static let frenzy: Effect.DTO = "Frenzy:107:n"
    static let invisibility: Effect.DTO = "Invisibility:261:p"
    static let lingeringDamageHealth: Effect.DTO = "Lingering Damage Health:86:n"
    static let lingeringDamageMagicka: Effect.DTO = "Lingering Damage Magicka:71:n"
    static let lingeringDamageStamina: Effect.DTO = "Lingering Damage Stamina:12:n"
    static let paralysis: Effect.DTO = "Paralysis:285:n"
    static let ravageHealth: Effect.DTO = "Ravage Health:6:n"
    static let ravageMagicka: Effect.DTO = "Ravage Magicka:15:n"
    static let ravageStamina: Effect.DTO = "Ravage Stamina:24:n"
    static let regenerateHealth: Effect.DTO = "Regenerate Health:177:p"
    static let regenerateMagicka: Effect.DTO = "Regenerate Magicka:177:p"
    static let regenerateStamina: Effect.DTO = "Regenerate Stamina:177:p"
    static let resistFire: Effect.DTO = "Resist Fire:86:p"
    static let resistFrost: Effect.DTO = "Resist Frost:86:p"
    static let resistMagic: Effect.DTO = "Resist Magic:51:p"
    static let resistPoison: Effect.DTO = "Resist Poison:118:p"
    static let resistShock: Effect.DTO = "Resist Shock:86:p"
    static let restoreHealth: Effect.DTO = "Restore Health:21:p"
    static let restoreMagicka: Effect.DTO = "Restore Magicka:25:p"
    static let restoreStamina: Effect.DTO = "Restore Stamina:25:p"
    static let slow: Effect.DTO = "Slow:247:n"
    static let waterbreathing: Effect.DTO = "Waterbreathing:100:p"
    static let weaknessToFire: Effect.DTO = "Weakness To Fire:48:n"
    static let weaknessToFrost: Effect.DTO = "Weakness To Frost:40:n"
    static let weaknessToMagic: Effect.DTO = "Weakness To Magic:51:n"
    static let weaknessToPoison: Effect.DTO = "Weakness To Poison:51:n"
    static let weaknessToShock: Effect.DTO = "Weakness To Shock:56:n"
    
    static let all: [Effect.DTO] = [
        DefaultEffects.cureDisease,
        DefaultEffects.damageHealth,
        DefaultEffects.damageMagicka,
        DefaultEffects.damageMagickaRegen,
        DefaultEffects.damageStamina,
        DefaultEffects.damageStaminaRegen,
        DefaultEffects.fear,
        DefaultEffects.fortifyAlteration,
        DefaultEffects.fortifyBarter,
        DefaultEffects.fortifyBlock,
        DefaultEffects.fortifyCarryWeight,
        DefaultEffects.fortifyConjuration,
        DefaultEffects.fortifyDestruction,
        DefaultEffects.fortifyEnchanting,
        DefaultEffects.fortifyHealth,
        DefaultEffects.fortifyHeavyArmor,
        DefaultEffects.fortifyIllusion,
        DefaultEffects.fortifyLightArmor,
        DefaultEffects.fortifyLockpicking,
        DefaultEffects.fortifyMagicka,
        DefaultEffects.fortifyMarksman,
        DefaultEffects.fortifyOneHanded,
        DefaultEffects.fortifyPickpocket,
        DefaultEffects.fortifyRestoration,
        DefaultEffects.fortifySmithing,
        DefaultEffects.fortifySneak,
        DefaultEffects.fortifyStamina,
        DefaultEffects.fortifyTwoHanded,
        DefaultEffects.frenzy,
        DefaultEffects.invisibility,
        DefaultEffects.lingeringDamageHealth,
        DefaultEffects.lingeringDamageMagicka,
        DefaultEffects.lingeringDamageStamina,
        DefaultEffects.paralysis,
        DefaultEffects.ravageHealth,
        DefaultEffects.ravageMagicka,
        DefaultEffects.ravageStamina,
        DefaultEffects.regenerateHealth,
        DefaultEffects.regenerateMagicka,
        DefaultEffects.regenerateStamina,
        DefaultEffects.resistFire,
        DefaultEffects.resistFrost,
        DefaultEffects.resistMagic,
        DefaultEffects.resistPoison,
        DefaultEffects.resistShock,
        DefaultEffects.restoreHealth,
        DefaultEffects.restoreMagicka,
        DefaultEffects.restoreStamina,
        DefaultEffects.slow,
        DefaultEffects.waterbreathing,
        DefaultEffects.weaknessToFire,
        DefaultEffects.weaknessToFrost,
        DefaultEffects.weaknessToMagic,
        DefaultEffects.weaknessToPoison,
        DefaultEffects.weaknessToShock
    ]
}
