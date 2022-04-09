//
//  DefaultEffects.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

enum DefaultEffectId: Effect.Id {
    case cureDisease
    case damageHealth
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
    
    static func values(_ values: [DefaultEffectId]) -> [Effect.Id] {
        values.map { $0.rawValue }
    }
}

enum DefaultEffects {
    static let all: [Effect] = [
        Effect(id: DefaultEffectId.cureDisease.rawValue,
               name: ConstrainedName(rawValue: "Cure Disease")!,
               value: Effect.Value(rawValue: 21)!,
               isPositive: true),
        Effect(id: DefaultEffectId.damageHealth.rawValue,
               name: ConstrainedName(rawValue: "Damage Health")!,
               value: Effect.Value(rawValue: 3)!,
               isPositive: false),
        Effect(id: DefaultEffectId.damageMagicka.rawValue,
               name: ConstrainedName(rawValue: "Damage Magicka")!,
               value: Effect.Value(rawValue: 52)!,
               isPositive: false),
        Effect(id: DefaultEffectId.damageMagickaRegen.rawValue,
               name: ConstrainedName(rawValue: "Damage Magicka Regen")!,
               value: Effect.Value(rawValue: 265)!,
               isPositive: false),
        Effect(id: DefaultEffectId.damageStamina.rawValue,
               name: ConstrainedName(rawValue: "Damage Stamina")!,
               value: Effect.Value(rawValue: 32)!,
               isPositive: false),
        Effect(id: DefaultEffectId.damageStaminaRegen.rawValue,
               name: ConstrainedName(rawValue: "Damage Stamina Regen")!,
               value: Effect.Value(rawValue: 159)!,
               isPositive: false),
        Effect(id: DefaultEffectId.fear.rawValue,
               name: ConstrainedName(rawValue: "Fear")!,
               value: Effect.Value(rawValue: 120)!,
               isPositive: false),
        Effect(id: DefaultEffectId.fortifyAlteration.rawValue,
               name: ConstrainedName(rawValue: "Fortify Alteration")!,
               value: Effect.Value(rawValue: 47)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyBarter.rawValue,
               name: ConstrainedName(rawValue: "Fortify Barter")!,
               value: Effect.Value(rawValue: 48)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyBlock.rawValue,
               name: ConstrainedName(rawValue: "Fortify Block")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyCarryWeight.rawValue,
               name: ConstrainedName(rawValue: "Fortify Carry Weight")!,
               value: Effect.Value(rawValue: 208)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyConjuration.rawValue,
               name: ConstrainedName(rawValue: "Fortify Conjuration")!,
               value: Effect.Value(rawValue: 75)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyDestruction.rawValue,
               name: ConstrainedName(rawValue: "Fortify Destruction")!,
               value: Effect.Value(rawValue: 151)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyEnchanting.rawValue,
               name: ConstrainedName(rawValue: "Fortify Enchanting")!,
               value: Effect.Value(rawValue: 14)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyHealth.rawValue,
               name: ConstrainedName(rawValue: "Fortify Health")!,
               value: Effect.Value(rawValue: 82)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyHeavyArmor.rawValue,
               name: ConstrainedName(rawValue: "Fortify Heavy Armor")!,
               value: Effect.Value(rawValue: 82)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyIllusion.rawValue,
               name: ConstrainedName(rawValue: "Fortify Illusion")!,
               value: Effect.Value(rawValue: 94)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyLightArmor.rawValue,
               name: ConstrainedName(rawValue: "Fortify Light Armor")!,
               value: Effect.Value(rawValue: 55)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyLockpicking.rawValue,
               name: ConstrainedName(rawValue: "Fortify Lockpicking")!,
               value: Effect.Value(rawValue: 25)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyMagicka.rawValue,
               name: ConstrainedName(rawValue: "Fortify Magicka")!,
               value: Effect.Value(rawValue: 71)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyMarksman.rawValue,
               name: ConstrainedName(rawValue: "Fortify Marksman")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyOneHanded.rawValue,
               name: ConstrainedName(rawValue: "Fortify One-Handed")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyPickpocket.rawValue,
               name: ConstrainedName(rawValue: "Fortify Pickpocket")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyRestoration.rawValue,
               name: ConstrainedName(rawValue: "Fortify Restoration")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifySmithing.rawValue,
               name: ConstrainedName(rawValue: "Fortify Smithing")!,
               value: Effect.Value(rawValue: 82)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifySneak.rawValue,
               name: ConstrainedName(rawValue: "Fortify Sneak")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyStamina.rawValue,
               name: ConstrainedName(rawValue: "Fortify Stamina")!,
               value: Effect.Value(rawValue: 71)!,
               isPositive: true),
        Effect(id: DefaultEffectId.fortifyTwoHanded.rawValue,
               name: ConstrainedName(rawValue: "Fortify Two-Handed")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.frenzy.rawValue,
               name: ConstrainedName(rawValue: "Frenzy")!,
               value: Effect.Value(rawValue: 107)!,
               isPositive: false),
        Effect(id: DefaultEffectId.invisibility.rawValue,
               name: ConstrainedName(rawValue: "Invisibility")!,
               value: Effect.Value(rawValue: 261)!,
               isPositive: true),
        Effect(id: DefaultEffectId.lingeringDamageHealth.rawValue,
               name: ConstrainedName(rawValue: "Lingering Damage Health")!,
               value: Effect.Value(rawValue: 86)!,
               isPositive: false),
        Effect(id: DefaultEffectId.lingeringDamageMagicka.rawValue,
               name: ConstrainedName(rawValue: "Lingering Damage Magicka")!,
               value: Effect.Value(rawValue: 71)!,
               isPositive: false),
        Effect(id: DefaultEffectId.lingeringDamageStamina.rawValue,
               name: ConstrainedName(rawValue: "Lingering Damage Stamina")!,
               value: Effect.Value(rawValue: 12)!,
               isPositive: false),
        Effect(id: DefaultEffectId.paralysis.rawValue,
               name: ConstrainedName(rawValue: "Paralysis")!,
               value: Effect.Value(rawValue: 285)!,
               isPositive: false),
        Effect(id: DefaultEffectId.ravageHealth.rawValue,
               name: ConstrainedName(rawValue: "Ravage Health")!,
               value: Effect.Value(rawValue: 6)!,
               isPositive: false),
        Effect(id: DefaultEffectId.ravageMagicka.rawValue,
               name: ConstrainedName(rawValue: "Ravage Magicka")!,
               value: Effect.Value(rawValue: 15)!,
               isPositive: false),
        Effect(id: DefaultEffectId.ravageStamina.rawValue,
               name: ConstrainedName(rawValue: "Ravage Stamina")!,
               value: Effect.Value(rawValue: 24)!,
               isPositive: false),
        Effect(id: DefaultEffectId.regenerateHealth.rawValue,
               name: ConstrainedName(rawValue: "Regenerate Health")!,
               value: Effect.Value(rawValue: 177)!,
               isPositive: true),
        Effect(id: DefaultEffectId.regenerateMagicka.rawValue,
               name: ConstrainedName(rawValue: "Regenerate Magicka")!,
               value: Effect.Value(rawValue: 177)!,
               isPositive: true),
        Effect(id: DefaultEffectId.regenerateStamina.rawValue,
               name: ConstrainedName(rawValue: "Regenerate Stamina")!,
               value: Effect.Value(rawValue: 177)!,
               isPositive: true),
        Effect(id: DefaultEffectId.resistFire.rawValue,
               name: ConstrainedName(rawValue: "Resist Fire")!,
               value: Effect.Value(rawValue: 86)!,
               isPositive: true),
        Effect(id: DefaultEffectId.resistFrost.rawValue,
               name: ConstrainedName(rawValue: "Resist Frost")!,
               value: Effect.Value(rawValue: 86)!,
               isPositive: true),
        Effect(id: DefaultEffectId.resistMagic.rawValue,
               name: ConstrainedName(rawValue: "Resist Magic")!,
               value: Effect.Value(rawValue: 51)!,
               isPositive: true),
        Effect(id: DefaultEffectId.resistPoison.rawValue,
               name: ConstrainedName(rawValue: "Resist Poison")!,
               value: Effect.Value(rawValue: 118)!,
               isPositive: true),
        Effect(id: DefaultEffectId.resistShock.rawValue,
               name: ConstrainedName(rawValue: "Resist Shock")!,
               value: Effect.Value(rawValue: 86)!,
               isPositive: true),
        Effect(id: DefaultEffectId.restoreHealth.rawValue,
               name: ConstrainedName(rawValue: "Restore Health")!,
               value: Effect.Value(rawValue: 21)!,
               isPositive: true),
        Effect(id: DefaultEffectId.restoreMagicka.rawValue,
               name: ConstrainedName(rawValue: "Restore Magicka")!,
               value: Effect.Value(rawValue: 25)!,
               isPositive: true),
        Effect(id: DefaultEffectId.restoreStamina.rawValue,
               name: ConstrainedName(rawValue: "Restore Stamina")!,
               value: Effect.Value(rawValue: 25)!,
               isPositive: true),
        Effect(id: DefaultEffectId.slow.rawValue,
               name: ConstrainedName(rawValue: "Slow")!,
               value: Effect.Value(rawValue: 247)!,
               isPositive: false),
        Effect(id: DefaultEffectId.waterbreathing.rawValue,
               name: ConstrainedName(rawValue: "Waterbreathing")!,
               value: Effect.Value(rawValue: 100)!,
               isPositive: true),
        Effect(id: DefaultEffectId.weaknessToFire.rawValue,
               name: ConstrainedName(rawValue: "Weakness To Fire")!,
               value: Effect.Value(rawValue: 48)!,
               isPositive: false),
        Effect(id: DefaultEffectId.weaknessToFrost.rawValue,
               name: ConstrainedName(rawValue: "Weakness To Frost")!,
               value: Effect.Value(rawValue: 40)!,
               isPositive: false),
        Effect(id: DefaultEffectId.weaknessToMagic.rawValue,
               name: ConstrainedName(rawValue: "Weakness To Magic")!,
               value: Effect.Value(rawValue: 51)!,
               isPositive: false),
        Effect(id: DefaultEffectId.weaknessToPoison.rawValue,
               name: ConstrainedName(rawValue: "Weakness To Poison")!,
               value: Effect.Value(rawValue: 51)!,
               isPositive: false),
        Effect(id: DefaultEffectId.weaknessToShock.rawValue,
               name: ConstrainedName(rawValue: "Weakness To Shock")!,
               value: Effect.Value(rawValue: 56)!,
               isPositive: false)
        ]
}
