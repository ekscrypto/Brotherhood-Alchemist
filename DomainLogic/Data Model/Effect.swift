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
        public let rawValue: UUID
        
        public init(rawValue: UUID) { self.rawValue = rawValue }
        public static func string(_ string: String) -> Id {
            Id(rawValue: UUID(uuidString: string)!)
        }
        public static var new: Id { .init(rawValue: UUID()) }
    }
    
    public let id: Id
    public var name: String
    public var baseValue: SeptimValue
    public var outcome: Outcome
    
    static let cureDisease = Effect(
        id: .string("A6AFA2AE-785B-4F90-962F-32B00EB5134C"),
        name: "Cure Disease", baseValue: SeptimValue(rawValue: 21)!, outcome: .positive)
    static let damageHealth = Effect(
        id: .string("B2BCA5B5-AB00-481F-A770-C06801BF96D8"),
        name: "Damage Health", baseValue: SeptimValue(rawValue: 3)!, outcome: .negative)
    static let damageMagicka = Effect(
        id: .string("D9663373-0FCE-464E-9B82-80D36D9E3002"),
        name: "Damage Magicka", baseValue: SeptimValue(rawValue: 52)!, outcome: .negative)
    static let damageMagickaRegen = Effect(
        id: .string("33D9E1AC-4CC2-4F1B-9169-FA02A9FC0FC4"),
        name: "Damage Magicka Regen", baseValue: SeptimValue(rawValue: 265)!, outcome: .negative)
    static let damageStamina = Effect(
        id: .string("526A43AE-448A-4F67-A80D-628E50963748"),
        name: "Damage Stamina", baseValue: SeptimValue(rawValue: 32)!, outcome: .negative)
    static let damageStaminaRegen = Effect(
        id: .string("C04820ED-6779-4EBE-9CB3-45E7A8500A92"),
        name: "Damage Stamina Regen", baseValue: SeptimValue(rawValue: 159)!, outcome: .negative)
    static let fear = Effect(
        id: .string("37255AB7-1992-4A48-81BF-8FC880BA5BF2"),
        name: "Fear", baseValue: SeptimValue(rawValue: 120)!, outcome: .negative)
    static let fortifyAlteration = Effect(
        id: .string("92A3D623-001D-40E2-A93B-A40D58CCC15B"),
        name: "Fortify Alteration", baseValue: SeptimValue(rawValue: 47)!, outcome: .positive)
    static let fortifyBarter = Effect(
        id: .string("B5B82D8C-2EAC-4AD7-9342-0E89C69FAB62"),
        name: "Fortify Barter", baseValue: SeptimValue(rawValue: 48)!, outcome: .positive)
    static let fortifyBlock = Effect(
        id: .string("5C008DFA-1497-4801-914D-740FDE74C087"),
        name: "Fortify Block", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyCarryWeight = Effect(
        id: .string("EAD225D8-853F-4A65-BC4A-7BB2E298D750"),
        name: "Fortify Carry Weight", baseValue: SeptimValue(rawValue: 208)!, outcome: .positive)
    static let fortifyConjuration = Effect(
        id: .string("B7C194D5-2DE6-4228-B0A7-A7B161A51E08"),
        name: "Fortify Conjuration", baseValue: SeptimValue(rawValue: 75)!, outcome: .positive)
    static let fortifyDestruction = Effect(
        id: .string("2510E055-EE03-4E99-B968-B4CD19838F05"),
        name: "Fortify Destruction", baseValue: SeptimValue(rawValue: 151)!, outcome: .positive)
    static let fortifyEnchanting = Effect(
        id: .string("64F08B45-A9A4-4D85-9761-089549C138A5"),
        name: "Fortify Enchanting", baseValue: SeptimValue(rawValue: 14)!, outcome: .positive)
    static let fortifyHealth = Effect(
        id: .string("35077C3E-A8B3-46FD-BE03-B9F95F6195C5"),
        name: "Fortify Health", baseValue: SeptimValue(rawValue: 82)!, outcome: .positive)
    static let fortifyHeavyArmor = Effect(
        id: .string("93FF981F-B5CE-47CC-B170-78CD9171FCA6"),
        name: "Fortify Heavy Armor", baseValue: SeptimValue(rawValue: 82)!, outcome: .positive)
    static let fortifyIllusion = Effect(
        id: .string("96654503-1562-4EE2-B626-D7F07386CFA8"),
        name: "Fortify Illusion", baseValue: SeptimValue(rawValue: 94)!, outcome: .positive)
    static let fortifyLightArmor = Effect(
        id: .string("B84A729D-D260-4632-82DD-23E2E5DA035D"),
        name: "Fortify Light Armor", baseValue: SeptimValue(rawValue: 55)!, outcome: .positive)
    static let fortifyLockpicking = Effect(
        id: .string("5F7B6826-F32B-4D5A-AE07-EF9341DD8151"),
        name: "Fortify Lockpicking", baseValue: SeptimValue(rawValue: 25)!, outcome: .positive)
    static let fortifyMagicka = Effect(
        id: .string("E4E4702E-FA8E-40ED-B105-D65558211F4F"),
        name: "Fortify Magicka", baseValue: SeptimValue(rawValue: 71)!, outcome: .positive)
    static let fortifyMarksman = Effect(
        id: .string("0BC2944A-31BB-4DDC-A154-5AD7A9718804"),
        name: "Fortify Marksman", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyOneHanded = Effect(
        id: .string("FCDAC6CD-614C-427C-B2C0-8C568B1CD82F"),
        name: "Fortify One-Handed", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyPickpocket = Effect(
        id: .string("5523DFE5-B151-49E9-98CC-7D627F3E21CD"),
        name: "Fortify Pickpocket", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyRestoration = Effect(
        id: .string("52089782-4E1A-49F6-BBD0-603AE4921A7F"),
        name: "Fortify Restoration", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifySmithing = Effect(
        id: .string("7CB54116-E9E7-40D9-ABD9-1BD38ECD703C"),
        name: "Fortify Smithing", baseValue: SeptimValue(rawValue: 82)!, outcome: .positive)
    static let fortifySneak = Effect(
        id: .string("084603D8-35BC-4025-B629-5AA5EFB2055A"),
        name: "Fortify Sneak", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let fortifyStamina = Effect(
        id: .string("ECBC06D9-DA16-4C70-BEA2-63149A4CA177"),
        name: "Fortify Stamina", baseValue: SeptimValue(rawValue: 71)!, outcome: .positive)
    static let fortifyTwoHanded = Effect(
        id: .string("DF9A7E54-8F6E-46F1-A7FE-3397241BA608"),
        name: "Fortify Two-Handed", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let frenzy = Effect(
        id: .string("71551663-89E0-4F64-BCF2-136D73E94063"),
        name: "Frenzy", baseValue: SeptimValue(rawValue: 107)!, outcome: .negative)
    static let invisibility = Effect(
        id: .string("38603E93-B951-4B8F-B2FD-3BAF4509F924"),
        name: "Invisibility", baseValue: SeptimValue(rawValue: 261)!, outcome: .positive)
    static let lingeringDamageHealth = Effect(
        id: .string("15DC704E-0E50-4F2E-9DD6-26467CC6278B"),
        name: "Lingering Damage Health", baseValue: SeptimValue(rawValue: 86)!, outcome: .negative)
    static let lingeringDamageMagicka = Effect(
        id: .string("E56A20C7-928D-4121-8BA2-F996A6C53712"),
        name: "Lingering Damage Magicka", baseValue: SeptimValue(rawValue: 71)!, outcome: .negative)
    static let lingeringDamageStamina = Effect(
        id: .string("CE524BBA-07AB-43D6-9233-D06D8E21E783"),
        name: "Lingering Damage Stamina", baseValue: SeptimValue(rawValue: 12)!, outcome: .negative)
    static let paralysis = Effect(
        id: .string("87F29961-8D4A-410D-99EA-8B7C381B348C"),
        name: "Paralysis", baseValue: SeptimValue(rawValue: 285)!, outcome: .negative)
    static let ravageHealth = Effect(
        id: .string("06D282C0-DF31-4F17-8B94-C052236CA94C"),
        name: "Ravage Health", baseValue: SeptimValue(rawValue: 6)!, outcome: .negative)
    static let ravageMagicka = Effect(
        id: .string("D53B7996-15DA-4FA9-9993-63A61B57F880"),
        name: "Ravage Magicka", baseValue: SeptimValue(rawValue: 15)!, outcome: .negative)
    static let ravageStamina = Effect(
        id: .string("3F016843-9D87-4269-B25E-250C0330367F"),
        name: "Ravage Stamina", baseValue: SeptimValue(rawValue: 24)!, outcome: .negative)
    static let regenerateHealth = Effect(
        id: .string("81010930-9FF5-4B24-A655-2EAFEEBD2B7C"),
        name: "Regenerate Health", baseValue: SeptimValue(rawValue: 177)!, outcome: .positive)
    static let regenerateMagicka = Effect(
        id: .string("804797CC-4C93-4091-96AD-19E0B7A366EC"),
        name: "Regenerate Magicka", baseValue: SeptimValue(rawValue: 177)!, outcome: .positive)
    static let regenerateStamina = Effect(
        id: .string("A09B486A-346D-47F1-8E4B-67B50889B0C7"),
        name: "Regenerate Stamina", baseValue: SeptimValue(rawValue: 177)!, outcome: .positive)
    static let resistFire = Effect(
        id: .string("3520CAA7-E215-4F92-AB19-795639088267"),
        name: "Resist Fire", baseValue: SeptimValue(rawValue: 86)!, outcome: .positive)
    static let resistFrost = Effect(
        id: .string("0C0579E7-A051-4B58-8FC4-558D2ECA0819"),
        name: "Resist Frost", baseValue: SeptimValue(rawValue: 86)!, outcome: .positive)
    static let resistMagic = Effect(
        id: .string("995BBA80-E922-4F8B-9375-4F6D4A415A38"),
        name: "Resist Magic", baseValue: SeptimValue(rawValue: 51)!, outcome: .positive)
    static let resistPoison = Effect(
        id: .string("787E0ABE-96B4-493A-8243-476104594F4D"),
        name: "Resist Poison", baseValue: SeptimValue(rawValue: 118)!, outcome: .positive)
    static let resistShock = Effect(
        id: .string("2A702706-8A87-4FEB-97BF-541875A76022"),
        name: "Resist Shock", baseValue: SeptimValue(rawValue: 86)!, outcome: .positive)
    static let restoreHealth = Effect(
        id: .string("6A98700C-A4B0-4585-90DB-0AA11F092E31"),
        name: "Restore Health", baseValue: SeptimValue(rawValue: 21)!, outcome: .positive)
    static let restoreMagicka = Effect(
        id: .string("B285BE71-7EFE-4171-B07F-2BE46B5D69D2"),
        name: "Restore Magicka", baseValue: SeptimValue(rawValue: 25)!, outcome: .positive)
    static let restoreStamina = Effect(
        id: .string("22B1F0D6-6D57-423F-9342-013B770E3024"),
        name: "Restore Stamina", baseValue: SeptimValue(rawValue: 25)!, outcome: .positive)
    static let slow = Effect(
        id: .string("93C28D18-2B7C-4C03-8110-F088BC9E52E4"),
        name: "Slow", baseValue: SeptimValue(rawValue: 247)!, outcome: .negative)
    static let waterbreathing = Effect(
        id: .string("F33DF4DB-0338-4C65-AFA8-72A94715CB4B"),
        name: "Waterbreathing", baseValue: SeptimValue(rawValue: 100)!, outcome: .positive)
    static let weaknessToFire = Effect(
        id: .string("97C13AFA-76F1-4A4D-9351-650BA4DF7A53"),
        name: "Weakness To Fire", baseValue: SeptimValue(rawValue: 48)!, outcome: .negative)
    static let weaknessToFrost = Effect(
        id: .string("2D1B2958-FAA1-4122-9824-C3D3DD8C0C3C"),
        name: "Weakness To Frost", baseValue: SeptimValue(rawValue: 40)!, outcome: .negative)
    static let weaknessToMagic = Effect(
        id: .string("163077FE-BF04-4F75-9F01-4E057950A016"),
        name: "Weakness To Magic", baseValue: SeptimValue(rawValue: 51)!, outcome: .negative)
    static let weaknessToPoison = Effect(
        id: .string("784B9DB8-00B1-4354-A487-DD34205A5620"),
        name: "Weakness To Poison", baseValue: SeptimValue(rawValue: 51)!, outcome: .negative)
    static let weaknessToShock = Effect(
        id: .string("C981C44C-8173-413C-AE1E-C81444FE123C"),
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
