//
//  DefaultEffects.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct DefaultEffects {
    static let cureDisease: Effect.ExportDTO = .init(
        name: "Cure Disease",
        value: 21,
        isPositive: true)
    static let damageHealth: Effect.ExportDTO = .init(
        name: "Damage Health",
        value: 3,
        isPositive: false)
    static let damageMagicka: Effect.ExportDTO = .init(
        name: "Damage Magicka",
        value: 52,
        isPositive: false)
    static let damageMagickaRegen: Effect.ExportDTO = .init(
        name: "Damage Magicka Regen",
        value: 265,
        isPositive: false)
    static let damageStamina: Effect.ExportDTO = .init(
        name: "Damage Stamina",
        value: 32,
        isPositive: false)
    static let damageStaminaRegen: Effect.ExportDTO = .init(
        name: "Damage Stamina Regen",
        value: 159,
        isPositive: false)
    static let fear: Effect.ExportDTO = .init(
        name: "Fear",
        value: 120,
        isPositive: false)
    static let fortifyAlteration: Effect.ExportDTO = .init(
        name: "Fortify Alteration",
        value: 47,
        isPositive: true)
    static let fortifyBarter: Effect.ExportDTO = .init(
        name: "Fortify Barter",
        value: 48,
        isPositive: true)
    static let fortifyBlock: Effect.ExportDTO = .init(
        name: "Fortify Block",
        value: 118,
        isPositive: true)
    static let fortifyCarryWeight: Effect.ExportDTO = .init(
        name: "Fortify Carry Weight",
        value: 208,
        isPositive: true)
    static let fortifyConjuration: Effect.ExportDTO = .init(
        name: "Fortify Conjuration",
        value: 75,
        isPositive: true)
    static let fortifyDestruction: Effect.ExportDTO = .init(
        name: "Fortify Destruction",
        value: 151,
        isPositive: true)
    static let fortifyEnchanting: Effect.ExportDTO = .init(
        name: "Fortify Enchanting",
        value: 14,
        isPositive: true)
    static let fortifyHealth: Effect.ExportDTO = .init(
        name: "Fortify Health",
        value: 82,
        isPositive: true)
    static let fortifyHeavyArmor: Effect.ExportDTO = .init(
        name: "Fortify Heavy Armor",
        value: 82,
        isPositive: true)
    static let fortifyIllusion: Effect.ExportDTO = .init(
        name: "Fortify Illusion",
        value: 94,
        isPositive: true)
    static let fortifyLightArmor: Effect.ExportDTO = .init(
        name: "Fortify Light Armor",
        value: 55,
        isPositive: true)
    static let fortifyLockpicking: Effect.ExportDTO = .init(
        name: "Fortify Lockpicking",
        value: 25,
        isPositive: true)
    static let fortifyMagicka: Effect.ExportDTO = .init(
        name: "Fortify Magicka",
        value: 71,
        isPositive: true)
    static let fortifyMarksman: Effect.ExportDTO = .init(
        name: "Fortify Marksman",
        value: 118,
        isPositive: true)
    static let fortifyOneHanded: Effect.ExportDTO = .init(
        name: "Fortify One-Handed",
        value: 118,
        isPositive: true)
    static let fortifyPickpocket: Effect.ExportDTO = .init(
        name: "Fortify Pickpocket",
        value: 118,
        isPositive: true)
    static let fortifyRestoration: Effect.ExportDTO = .init(
        name: "Fortify Restoration",
        value: 118,
        isPositive: true)
    static let fortifySmithing: Effect.ExportDTO = .init(
        name: "Fortify Smithing",
        value: 82,
        isPositive: true)
    static let fortifySneak: Effect.ExportDTO = .init(
        name: "Fortify Sneak",
        value: 118,
        isPositive: true)
    static let fortifyStamina: Effect.ExportDTO = .init(
        name: "Fortify Stamina",
        value: 71,
        isPositive: true)
    static let fortifyTwoHanded: Effect.ExportDTO = .init(
        name: "Fortify Two-Handed",
        value: 118,
        isPositive: true)
    static let frenzy: Effect.ExportDTO = .init(
        name: "Frenzy",
        value: 107,
        isPositive: false)
    static let invisibility: Effect.ExportDTO = .init(
        name: "Invisibility",
        value: 261,
        isPositive: true)
    static let lingeringDamageHealth: Effect.ExportDTO = .init(
        name: "Lingering Damage Health",
        value: 86,
        isPositive: false)
    static let lingeringDamageMagicka: Effect.ExportDTO = .init(
        name: "Lingering Damage Magicka",
        value: 71,
        isPositive: false)
    static let lingeringDamageStamina: Effect.ExportDTO = .init(
        name: "Lingering Damage Stamina",
        value: 12,
        isPositive: false)
    static let paralysis: Effect.ExportDTO = .init(
        name: "Paralysis",
        value: 285,
        isPositive: false)
    static let ravageHealth: Effect.ExportDTO = .init(
        name: "Ravage Health",
        value: 6,
        isPositive: false)
    static let ravageMagicka: Effect.ExportDTO = .init(
        name: "Ravage Magicka",
        value: 15,
        isPositive: false)
    static let ravageStamina: Effect.ExportDTO = .init(
        name: "Ravage Stamina",
        value: 24,
        isPositive: false)
    static let regenerateHealth: Effect.ExportDTO = .init(
        name: "Regenerate Health",
        value: 177,
        isPositive: true)
    static let regenerateMagicka: Effect.ExportDTO = .init(
        name: "Regenerate Magicka",
        value: 177,
        isPositive: true)
    static let regenerateStamina: Effect.ExportDTO = .init(
        name: "Regenerate Stamina",
        value: 177,
        isPositive: true)
    static let resistFire: Effect.ExportDTO = .init(
        name: "Resist Fire",
        value: 86,
        isPositive: true)
    static let resistFrost: Effect.ExportDTO = .init(
        name: "Resist Frost",
        value: 86,
        isPositive: true)
    static let resistMagic: Effect.ExportDTO = .init(
        name: "Resist Magic",
        value: 51,
        isPositive: true)
    static let resistPoison: Effect.ExportDTO = .init(
        name: "Resist Poison",
        value: 118,
        isPositive: true)
    static let resistShock: Effect.ExportDTO = .init(
        name: "Resist Shock",
        value: 86,
        isPositive: true)
    static let restoreHealth: Effect.ExportDTO = .init(
        name: "Restore Health",
        value: 21,
        isPositive: true)
    static let restoreMagicka: Effect.ExportDTO = .init(
        name: "Restore Magicka",
        value: 25,
        isPositive: true)
    static let restoreStamina: Effect.ExportDTO = .init(
        name: "Restore Stamina",
        value: 25,
        isPositive: true)
    static let slow: Effect.ExportDTO = .init(
        name: "Slow",
        value: 247,
        isPositive: false)
    static let waterbreathing: Effect.ExportDTO = .init(
        name: "Waterbreathing",
        value: 100,
        isPositive: true)
    static let weaknessToFire: Effect.ExportDTO = .init(
        name: "Weakness To Fire",
        value: 48,
        isPositive: false)
    static let weaknessToFrost: Effect.ExportDTO = .init(
        name: "Weakness To Frost",
        value: 40,
        isPositive: false)
    static let weaknessToMagic: Effect.ExportDTO = .init(
        name: "Weakness To Magic",
        value: 51,
        isPositive: false)
    static let weaknessToPoison: Effect.ExportDTO = .init(
        name: "Weakness To Poison",
        value: 51,
        isPositive: false)
    static let weaknessToShock: Effect.ExportDTO = .init(
        name: "Weakness To Shock",
        value: 56,
        isPositive: false)
    
    static let all: [Effect.ExportDTO] = [
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
