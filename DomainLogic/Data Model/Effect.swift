//
//  Effect.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct Effect: Codable, Sendable, Identifiable {
    
    public struct Id: RawRepresentable, Hashable, Codable, Sendable {
        public let rawValue: Int64
        public init(rawValue: Int64) { self.rawValue = rawValue }
        public static var new: Id { .init(rawValue: .random(in: Int64.min ... Int64.max)) }
    }
    
    public let id: Id
    public var name: String
    public var baseValue: SeptimValue
    public var outcome: Outcome
    
    static let cureDisease = Effect(
        id: .init(rawValue: 0x284DED98),
        name: "Cure Disease", baseValue: SeptimValue(rawValue: 21)!, outcome: .positive)
    static let damageHealth = Effect(
        id: .init(rawValue: 0xD79E3982),
        name: "Damage Health", baseValue: SeptimValue(rawValue: 3)!, outcome: .negative)
    static let damageMagicka = Effect(
        id: .init(rawValue: 0x6FC85850),
        name: "Damage Magicka", baseValue: SeptimValue(rawValue: 52)!, outcome: .negative)
    static let damageMagickaRegen = Effect(
        id: .init(rawValue: 0x997EEEB3),
        name: "Damage Magicka Regen", baseValue: SeptimValue(rawValue: 265)!, outcome: .negative)
    static let damageStamina = Effect(
        id: .init(rawValue: 0xF983B22C),
        name: "Damage Stamina", baseValue: SeptimValue(rawValue: 32)!, outcome: .negative)
    static let damageStaminaRegen = Effect(
        id: .init(rawValue: 0xCCF05917),
        name: "Damage Stamina Regen", baseValue: SeptimValue(rawValue: 159)!, outcome: .negative)
    static let fear = Effect(
        id: .init(rawValue: 0x7847F782),
        name: "Fear", baseValue: SeptimValue(rawValue: 120)!, outcome: .negative)
    static let fortifyAlteration = Effect(
        id: .init(rawValue: 0x5E4B61EB),
        name: "Fortify Alteration", baseValue: SeptimValue(rawValue: 47)!, outcome: .positive)
    static let fortifyBarter = Effect(
        id: .init(rawValue: 0x79721271),
        name: "Fortify Barter", baseValue: SeptimValue(rawValue: 48)!, outcome: .positive)
    static let fortifyBlock = Effect(
        id: .init(rawValue: 0x8B37BAD9),
        name: "Fortify Block", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyCarryWeight = Effect(
        id: .init(rawValue: 0xCA86EE26),
        name: "Fortify Carry Weight", baseValue: SeptimValue(rawValue: 208)!, outcome: .positive)
    static let fortifyConjuration = Effect(
        id: .init(rawValue: 0x2C978CCE),
        name: "Fortify Conjuration", baseValue: SeptimValue(rawValue: 75)!, outcome: .positive)
    static let fortifyDestruction = Effect(
        id: .init(rawValue: 0xFF9976A7),
        name: "Fortify Destruction", baseValue: SeptimValue(rawValue: 151)!, outcome: .positive)
    static let fortifyEnchanting = Effect(
        id: .init(rawValue: 0xC694B5C0),
        name: "Fortify Enchanting", baseValue: SeptimValue(rawValue: 14)!, outcome: .positive)
    static let fortifyHealth = Effect(
        id: .init(rawValue: 0x8449AF51),
        name: "Fortify Health", baseValue: SeptimValue(rawValue: 82)!, outcome: .positive)
    static let fortifyHeavyArmor = Effect(
        id: .init(rawValue: 0x8FE7FEC0),
        name: "Fortify Heavy Armor", baseValue: SeptimValue(rawValue: 82)!, outcome: .positive)
    static let fortifyIllusion = Effect(
        id: .init(rawValue: 0xAAA89581),
        name: "Fortify Illusion", baseValue: SeptimValue(rawValue: 94)!, outcome: .positive)
    static let fortifyLightArmor = Effect(
        id: .init(rawValue: 0x3E5AC329),
        name: "Fortify Light Armor", baseValue: SeptimValue(rawValue: 55)!, outcome: .positive)
    static let fortifyLockpicking = Effect(
        id: .init(rawValue: 0xF61A64C5),
        name: "Fortify Lockpicking", baseValue: SeptimValue(rawValue: 25)!, outcome: .positive)
    static let fortifyMagicka = Effect(
        id: .init(rawValue: 0xC92103DE),
        name: "Fortify Magicka", baseValue: SeptimValue(rawValue: 71)!, outcome: .positive)
    static let fortifyMarksman = Effect(
        id: .init(rawValue: 0x0921DE3A),
        name: "Fortify Marksman", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyOneHanded = Effect(
        id: .init(rawValue: 0x61C8F1F4),
        name: "Fortify One-Handed", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyPickpocket = Effect(
        id: .init(rawValue: 0xE80CB743),
        name: "Fortify Pickpocket", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyRestoration = Effect(
        id: .init(rawValue: 0x5A4D3350),
        name: "Fortify Restoration", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifySmithing = Effect(
        id: .init(rawValue: 0x7A9B300A),
        name: "Fortify Smithing", baseValue: SeptimValue(rawValue: 82)!, outcome: .positive)
    static let fortifySneak = Effect(
        id: .init(rawValue: 0xECE31A24),
        name: "Fortify Sneak", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyStamina = Effect(
        id: .init(rawValue: 0xF7C41409),
        name: "Fortify Stamina", baseValue: SeptimValue(rawValue: 71)!, outcome: .positive)
    static let fortifyTwoHanded = Effect(
        id: .init(rawValue: 0xE03CE2F4),
        name: "Fortify Two-Handed", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let frenzy = Effect(
        id: .init(rawValue: 0x9D4291E6),
        name: "Frenzy", baseValue: SeptimValue(rawValue: 107)!, outcome: .negative)
    static let invisibility = Effect(
        id: .init(rawValue: 0x3FF88419),
        name: "Invisibility", baseValue: SeptimValue(rawValue: 261)!, outcome: .positive)
    static let lingeringDamageHealth = Effect(
        id: .init(rawValue: 0x193A802C),
        name: "Lingering Damage Health", baseValue: SeptimValue(rawValue: 86)!, outcome: .negative)
    static let lingeringDamageMagicka = Effect(
        id: .init(rawValue: 0x938745D1),
        name: "Lingering Damage Magicka", baseValue: SeptimValue(rawValue: 71)!, outcome: .negative)
    static let lingeringDamageStamina = Effect(
        id: .init(rawValue: 0x00551596),
        name: "Lingering Damage Stamina", baseValue: SeptimValue(rawValue: 12)!, outcome: .negative)
    static let paralysis = Effect(
        id: .init(rawValue: 0xAB48F564),
        name: "Paralysis", baseValue: SeptimValue(rawValue: 285)!, outcome: .negative)
    static let ravageHealth = Effect(
        id: .init(rawValue: 0x750089C5),
        name: "Ravage Health", baseValue: SeptimValue(rawValue: 6)!, outcome: .negative)
    static let ravageMagicka = Effect(
        id: .init(rawValue: 0xE791EEC1),
        name: "Ravage Magicka", baseValue: SeptimValue(rawValue: 15)!, outcome: .negative)
    static let ravageStamina = Effect(
        id: .init(rawValue: 0xF5144C01),
        name: "Ravage Stamina", baseValue: SeptimValue(rawValue: 24)!, outcome: .negative)
    static let regenerateHealth = Effect(
        id: .init(rawValue: 0x6C8220F1),
        name: "Regenerate Health", baseValue: SeptimValue(rawValue: 177)!, outcome: .positive)
    static let regenerateMagicka = Effect(
        id: .init(rawValue: 0xD46526BC),
        name: "Regenerate Magicka", baseValue: SeptimValue(rawValue: 177)!, outcome: .positive)
    static let regenerateStamina = Effect(
        id: .init(rawValue: 0x820C25E3),
        name: "Regenerate Stamina", baseValue: SeptimValue(rawValue: 177)!, outcome: .positive)
    static let resistFire = Effect(
        id: .init(rawValue: 0xBD76211C),
        name: "Resist Fire", baseValue: SeptimValue(rawValue: 86)!, outcome: .positive)
    static let resistFrost = Effect(
        id: .init(rawValue: 0xB66AA5AD),
        name: "Resist Frost", baseValue: SeptimValue(rawValue: 86)!, outcome: .positive)
    static let resistMagic = Effect(
        id: .init(rawValue: 0x40BC224B),
        name: "Resist Magic", baseValue: SeptimValue(rawValue: 51)!, outcome: .positive)
    static let resistPoison = Effect(
        id: .init(rawValue: 0x21AD7F9C),
        name: "Resist Poison", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let resistShock = Effect(
        id: .init(rawValue: 0x81015107),
        name: "Resist Shock", baseValue: SeptimValue(rawValue: 86)!, outcome: .positive)
    static let restoreHealth = Effect(
        id: .init(rawValue: 0xAC1F1ADD),
        name: "Restore Health", baseValue: SeptimValue(rawValue: 21)!, outcome: .positive)
    static let restoreMagicka = Effect(
        id: .init(rawValue: 0x693B82CF),
        name: "Restore Magicka", baseValue: SeptimValue(rawValue: 25)!, outcome: .positive)
    static let restoreStamina = Effect(
        id: .init(rawValue: 0x1840C9D6),
        name: "Restore Stamina", baseValue: SeptimValue(rawValue: 25)!, outcome: .positive)
    static let slow = Effect(
        id: .init(rawValue: 0x4E83EB96),
        name: "Slow", baseValue: SeptimValue(rawValue: 247)!, outcome: .negative)
    static let waterbreathing = Effect(
        id: .init(rawValue: 0x515B9388),
        name: "Waterbreathing", baseValue: SeptimValue(rawValue: 100)!, outcome: .positive)
    static let weaknessToFire = Effect(
        id: .init(rawValue: 0x3AABBE46),
        name: "Weakness To Fire", baseValue: SeptimValue(rawValue: 48)!, outcome: .negative)
    static let weaknessToFrost = Effect(
        id: .init(rawValue: 0x16E428C2),
        name: "Weakness To Frost", baseValue: SeptimValue(rawValue: 40)!, outcome: .negative)
    static let weaknessToMagic = Effect(
        id: .init(rawValue: 0x885F2223),
        name: "Weakness To Magic", baseValue: SeptimValue(rawValue: 51)!, outcome: .negative)
    static let weaknessToPoison = Effect(
        id: .init(rawValue: 0x63BA81E5),
        name: "Weakness To Poison", baseValue: SeptimValue(rawValue: 51)!, outcome: .negative)
    static let weaknessToShock = Effect(
        id: .init(rawValue: 0xE8AA6F24),
        name: "Weakness To Shock", baseValue: SeptimValue(rawValue: 56)!, outcome: .negative)
    
    static let all: [Effect] = [
        .cureDisease,
        .damageHealth,
        .damageMagicka,
        .damageMagickaRegen,
        .damageStamina,
        .damageStaminaRegen,
        .fear,
        .fortifyAlteration,
        .fortifyBarter,
        .fortifyBlock,
        .fortifyCarryWeight,
        .fortifyConjuration,
        .fortifyDestruction,
        .fortifyEnchanting,
        .fortifyHealth,
        .fortifyHeavyArmor,
        .fortifyIllusion,
        .fortifyLightArmor,
        .fortifyLockpicking,
        .fortifyMagicka,
        .fortifyMarksman,
        .fortifyOneHanded,
        .fortifyPickpocket,
        .fortifyRestoration,
        .fortifySmithing,
        .fortifySneak,
        .fortifyStamina,
        .fortifyTwoHanded,
        .frenzy,
        .invisibility,
        .lingeringDamageHealth,
        .lingeringDamageMagicka,
        .lingeringDamageStamina,
        .paralysis,
        .ravageHealth,
        .ravageMagicka,
        .ravageStamina,
        .regenerateHealth,
        .regenerateMagicka,
        .regenerateStamina,
        .resistFire,
        .resistFrost,
        .resistMagic,
        .resistPoison,
        .resistShock,
        .restoreHealth,
        .restoreMagicka,
        .restoreStamina,
        .slow,
        .waterbreathing,
        .weaknessToFire,
        .weaknessToFrost,
        .weaknessToMagic,
        .weaknessToPoison,
        .weaknessToShock
    ]
}

extension Array where Element == Effect {
    mutating func sortByName() {
        sort(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })
    }
}
