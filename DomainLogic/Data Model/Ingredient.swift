//
//  Ingredient.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

public struct Ingredient: Identifiable, Codable, Sendable {

    public struct Id: RawRepresentable, Hashable, Sendable, Codable {
        public let rawValue: Int64
        public init(rawValue: Int64) { self.rawValue = rawValue }
        public static var new: Id { .init(rawValue: .random(in: Int64.min ... Int64.max)) }
    }

    public let id: Id
    public var name: String
    public var effectMultipliers: [Effect.Id: IngredientEffectMultiplier]
    public var effects: Set<Effect.Id> { Set(effectMultipliers.keys) }

    static let abeceanLongfin = Ingredient(
        id: .init(rawValue: 0xBC3C876A), name: "Abecean Longfin", effectMultipliers: [
            Effect.weaknessToFrost.id: .standard,
            Effect.fortifySneak.id: .standard,
            Effect.weaknessToPoison.id: .standard,
            Effect.fortifyRestoration.id: .standard])
    static let ancestorMothWing = Ingredient(
        id: .init(rawValue: 0x79CDFB2C), name: "Ancestor Moth Wing", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.fortifyConjuration.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.fortifyEnchanting.id: .standard])
    static let ashCreepCluster = Ingredient(
        id: .init(rawValue: 0x11EEFF1D), name: "Ash Creep Cluster", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.invisibility.id: .standard,
            Effect.resistFire.id: .standard,
            Effect.fortifyDestruction.id: .standard])
    static let ashHopperJelly = Ingredient(
        id: .init(rawValue: 0xF6D56C08), name: "Ash Hopper Jelly", effectMultipliers: [
            Effect.restoreHealth.id: .standard,
            Effect.fortifyLightArmor.id: .standard,
            Effect.resistShock.id: .standard,
            Effect.weaknessToFrost.id: .standard])
    static let ashenGrassPod = Ingredient(
        id: .init(rawValue: 0xE6C90A9B), name: "Ashen Grass Pod", effectMultipliers: [
            Effect.resistFire.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.weaknessToShock.id: .standard,
            Effect.fortifyLockpicking.id: .standard,
            Effect.fortifySneak.id: .standard])
    static let bearClaws = Ingredient(
        id: .init(rawValue: 0x062CF6CD), name: "Bear Claws", effectMultipliers: [
            Effect.restoreStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.8, durationMultiplier: 1.0, valueMultiplier: 0.78),
            Effect.fortifyHealth.id: .standard,
            Effect.fortifyOneHanded.id: .standard,
            Effect.damageMagickaRegen.id: .standard])
    static let bee = Ingredient(
        id: .init(rawValue: 0xDA152748), name: "Bee", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.ravageStamina.id: .standard,
            Effect.regenerateStamina.id: .standard,
            Effect.weaknessToShock.id: .standard])
    static let beehiveHusk = Ingredient(
        id: .init(rawValue: 0x6D6E4999), name: "Beehive Husk", effectMultipliers: [
            Effect.resistPoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.5, durationMultiplier: 1.0, valueMultiplier: 0.46),
            Effect.fortifyLightArmor.id: .standard,
            Effect.fortifySneak.id: .standard,
            Effect.fortifyDestruction.id: .standard])
    static let beritsAshes = Ingredient(
        id: .init(rawValue: 0x5FDD6FAD), name: "Berit's Ashes", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.fortifyConjuration.id: .standard,
            Effect.resistFire.id: .standard,
            Effect.ravageStamina.id: .standard])
    static let bleedingCrown = Ingredient(
        id: .init(rawValue: 0xDA5E9345), name: "Bleeding Crown", effectMultipliers: [
            Effect.weaknessToFire.id: .standard,
            Effect.fortifyBlock.id: .standard,
            Effect.weaknessToPoison.id: .standard,
            Effect.resistMagic.id: .standard])
    static let blisterWort = Ingredient(
        id: .init(rawValue: 0xBD641756), name: "Blisterwort", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.6, durationMultiplier: 1.0, valueMultiplier: 0.57),
            Effect.frenzy.id: .standard,
            Effect.fortifySmithing.id: .standard])
    static let blueButterflyWing = Ingredient(
        id: .init(rawValue: 0x330A3F36), name: "Blue Butterfly Wing", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.fortifyConjuration.id: .standard,
            Effect.fortifyEnchanting.id: .standard])
    static let blueDartwing = Ingredient(
        id: .init(rawValue: 0xA2D73C21), name: "Blue Dartwing", effectMultipliers: [
            Effect.resistShock.id: .standard,
            Effect.restoreHealth.id: .standard,
            Effect.fortifyPickpocket.id: .standard,
            Effect.fear.id: .standard])
    static let blueMountainFlower = Ingredient(
        id: .init(rawValue: 0x317EA39F), name: "Blue Mountain Flower", effectMultipliers: [
            Effect.restoreHealth.id: .standard,
            Effect.fortifyConjuration.id: .standard,
            Effect.fortifyHealth.id: .standard,
            Effect.damageMagickaRegen.id: .standard])
    static let boarTusk = Ingredient(
        id: .init(rawValue: 0x1DFF44F1), name: "Boar Tusk", effectMultipliers: [
            Effect.fortifyStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 5.0, valueMultiplier: 7.5),
            Effect.fortifyHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 5.0, valueMultiplier: 5.9),
            Effect.fortifyBlock.id: .standard,
            Effect.frenzy.id: .standard])
    static let boneMeal = Ingredient(
        id: .init(rawValue: 0xEEC4AAF5), name: "Bone Meal", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.fortifyConjuration.id: .standard,
            Effect.resistFire.id: .standard,
            Effect.ravageStamina.id: .standard])
    static let briarHeart = Ingredient(
        id: .init(rawValue: 0x09A34E0C), name: "Briar Heart", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.fortifyBlock.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.5, durationMultiplier: 1.0, valueMultiplier: 1.0),
            Effect.paralysis.id: .standard,
            Effect.fortifyMagicka.id: .standard])
    static let burntSprigganWood = Ingredient(
        id: .init(rawValue: 0xA02F1C80), name: "Burnt Spriggan Wood", effectMultipliers: [
            Effect.weaknessToFire.id: .standard,
            Effect.fortifyAlteration.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.slow.id: .standard])
    static let butterflyWing = Ingredient(
        id: .init(rawValue: 0xECF4087A), name: "Butterfly Wing", effectMultipliers: [
            Effect.restoreHealth.id: .standard,
            Effect.lingeringDamageStamina.id: .standard,
            Effect.fortifyBarter.id: .standard,
            Effect.damageMagicka.id: .standard])
    static let canisRoot = Ingredient(
        id: .init(rawValue: 0x526B369B), name: "Canis Root", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.fortifyMarksman.id: .standard,
            Effect.fortifyOneHanded.id: .standard,
            Effect.paralysis.id: .standard])
    static let charredSkeeverHide = Ingredient(
        id: .init(rawValue: 0xFD4F1BEC), name: "Charred Skeever Hide", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.resistPoison.id: .standard,
            Effect.cureDisease.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 0.36),
            Effect.restoreHealth.id: .standard])
    static let chaurusEggs = Ingredient(
        id: .init(rawValue: 0xEDFB1BE6), name: "Chaurus Eggs", effectMultipliers: [
            Effect.weaknessToPoison.id: .standard,
            Effect.fortifyStamina.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.invisibility.id: .standard])
    static let chaurusHunterAntennae = Ingredient(
        id: .init(rawValue: 0x1FD4A7CC), name: "Chaurus Hunter Antennae", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.fortifyConjuration.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.fortifyEnchanting.id: .standard])
    static let chickensEgg = Ingredient(
        id: .init(rawValue: 0xD2729330), name: "Chicken's Egg", effectMultipliers: [
            Effect.resistMagic.id: .standard,
            Effect.waterbreathing.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.lingeringDamageStamina.id: .standard])
    static let creepCluster = Ingredient(
        id: .init(rawValue: 0x9202656D), name: "Creep Cluster", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.fortifyCarryWeight.id: .standard,
            Effect.damageStaminaRegen.id: .standard,
            Effect.weaknessToMagic.id: .standard])
    static let crimsonNirnroot = Ingredient(
        id: .init(rawValue: 0xA1565958), name: "Crimson Nirnroot", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 3.0, durationMultiplier: 1.0, valueMultiplier: 3.3),
            Effect.invisibility.id: .standard,
            Effect.damageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 3.0, durationMultiplier: 1.0, valueMultiplier: 1.0),
            Effect.resistMagic.id: .standard])
    static let cyrodilicSpadetail = Ingredient(
        id: .init(rawValue: 0x4E83F3DB), name: "Cyrodilic Spadetail", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.fear.id: .standard,
            Effect.fortifyRestoration.id: .standard,
            Effect.ravageHealth.id: .standard])
    static let daedraHeart = Ingredient(
        id: .init(rawValue: 0xB2EABBDA), name: "Daedra Heart", effectMultipliers: [
            Effect.damageStaminaRegen.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.restoreHealth.id: .standard,
            Effect.fear.id: .standard])
    static let deathbell = Ingredient(
        id: .init(rawValue: 0xAD003FD3), name: "Deathbell", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.6),
            Effect.ravageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 2.1),
            Effect.slow.id: .standard,
            Effect.weaknessToPoison.id: .standard])
    static let dragonsTongue = Ingredient(
        id: .init(rawValue: 0x20558957), name: "Dragon's Tongue", effectMultipliers: [
            Effect.resistFire.id: .standard,
            Effect.fortifyBarter.id: .standard,
            Effect.fortifyIllusion.id: .standard,
            Effect.fortifyTwoHanded.id: .standard])
    static let dwarvenOil = Ingredient(
        id: .init(rawValue: 0x9930DC92), name: "Dwarven Oil", effectMultipliers: [
            Effect.weaknessToMagic.id: .standard,
            Effect.regenerateMagicka.id: .standard,
            Effect.fortifyIllusion.id: .standard,
            Effect.restoreMagicka.id: .standard])
    static let ectoplasm = Ingredient(
        id: .init(rawValue: 0xF51F3FBF), name: "Ectoplasm", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.fortifyDestruction.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.8, durationMultiplier: 1.0, valueMultiplier: 1.0),
            Effect.fortifyMagicka.id: .standard,
            Effect.damageHealth.id: .standard])
    static let elvesEar = Ingredient(
        id: .init(rawValue: 0xA5A64C26), name: "Elves Ear", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.weaknessToFrost.id: .standard,
            Effect.fortifyMarksman.id: .standard,
            Effect.resistFire.id: .standard])
    static let emperorParasolMoss = Ingredient(
        id: .init(rawValue: 0x680FE5AE), name: "Emperor Parasol Moss", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 19.7),
            Effect.fortifyMagicka.id: .standard,
            Effect.regenerateHealth.id: .standard,
            Effect.fortifyTwoHanded.id: .standard])
    static let eyeOfSabreCat = Ingredient(
        id: .init(rawValue: 0x35FB59B5), name: "Eye Of Sabre Cat", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.ravageHealth.id: .standard,
            Effect.restoreHealth.id: .standard])
    static let falmerEar = Ingredient(
        id: .init(rawValue: 0xE1FC231D), name: "Falmer Ear", effectMultipliers: [
            Effect.damageHealth.id: .standard,
            Effect.frenzy.id: .standard,
            Effect.resistPoison.id: .standard,
            Effect.fortifyLockpicking.id: .standard])
    static let felsaadTernFeathers = Ingredient(
        id: .init(rawValue: 0xE215F1F9), name: "Felsaad Tern Feathers", effectMultipliers: [
            Effect.restoreHealth.id: .standard,
            Effect.fortifyLightArmor.id: .standard,
            Effect.cureDisease.id: .standard,
            Effect.resistMagic.id: .standard])
    static let fireSalts = Ingredient(
        id: .init(rawValue: 0x76CCAE63), name: "Fire Salts", effectMultipliers: [
            Effect.weaknessToFrost.id: .standard,
            Effect.restoreMagicka.id: .standard,
            Effect.resistFire.id: .standard,
            Effect.regenerateMagicka.id: .standard])
    static let flyAmanita = Ingredient(
        id: .init(rawValue: 0xA684959B), name: "Fly Amanita", effectMultipliers: [
            Effect.resistFire.id: .standard,
            Effect.frenzy.id: .standard,
            Effect.fortifyTwoHanded.id: .standard,
            Effect.regenerateStamina.id: .standard])
    static let frostMirriam = Ingredient(
        id: .init(rawValue: 0x84E07533), name: "Frost Mirriam", effectMultipliers: [
            Effect.resistFrost.id: .standard,
            Effect.fortifySneak.id: .standard,
            Effect.ravageMagicka.id: .standard,
            Effect.damageStaminaRegen.id: .standard])
    static let frostSalts = Ingredient(
        id: .init(rawValue: 0xCBA3E01B), name: "Frost Salts", effectMultipliers: [
            Effect.weaknessToFire.id: .standard,
            Effect.resistFrost.id: .standard,
            Effect.restoreMagicka.id: .standard,
            Effect.fortifyConjuration.id: .standard])
    static let garlic = Ingredient(
        id: .init(rawValue: 0x0A4988CD), name: "Garlic", effectMultipliers: [
            Effect.resistPoison.id: .standard,
            Effect.fortifyStamina.id: .standard,
            Effect.regenerateMagicka.id: .standard,
            Effect.regenerateHealth.id: .standard])
    static let giantLichen = Ingredient(
        id: .init(rawValue: 0x70D33B43), name: "Giant Lichen", effectMultipliers: [
            Effect.ravageHealth.id: .standard,
            Effect.weaknessToPoison.id: .standard,
            Effect.weaknessToShock.id: .standard,
            Effect.restoreMagicka.id: .standard])
    static let giantsToe = Ingredient(
        id: .init(rawValue: 0x6150191D), name: "Giant's Toe", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.fortifyCarryWeight.id: .standard,
            Effect.fortifyHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 5.0, valueMultiplier: 5.9),
            Effect.damageStaminaRegen.id: .standard])
    static let gleamblossom = Ingredient(
        id: .init(rawValue: 0x39ADD03A), name: "Gleamblossom", effectMultipliers: [
            Effect.resistMagic.id: .standard,
            Effect.fear.id: .standard,
            Effect.regenerateHealth.id: .standard,
            Effect.paralysis.id: .standard])
    static let glowDust = Ingredient(
        id: .init(rawValue: 0x92B1F291), name: "Glow Dust", effectMultipliers: [
            Effect.damageMagicka.id: .standard,
            Effect.fortifyDestruction.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.resistShock.id: .standard])
    static let glowingMushroom = Ingredient(
        id: .init(rawValue: 0xF3D64B5C), name: "Glowing Mushroom", effectMultipliers: [
            Effect.resistShock.id: .standard,
            Effect.fortifyDestruction.id: .standard,
            Effect.fortifySmithing.id: .standard,
            Effect.fortifyHealth.id: .standard])
    static let grassPod = Ingredient(
        id: .init(rawValue: 0x29A05A71), name: "Grass Pod", effectMultipliers: [
            Effect.resistPoison.id: .standard,
            Effect.ravageMagicka.id: .standard,
            Effect.fortifyAlteration.id: .standard,
            Effect.restoreMagicka.id: .standard])
    static let hagravenClaw = Ingredient(
        id: .init(rawValue: 0xBBE38898), name: "Hagraven Claw", effectMultipliers: [
            Effect.resistMagic.id: .standard,
            Effect.lingeringDamageMagicka.id: .standard,
            Effect.fortifyEnchanting.id: .standard,
            Effect.fortifyBarter.id: .standard])
    static let hagravenFeathers = Ingredient(
        id: .init(rawValue: 0x90F144AD), name: "Hagraven Feathers", effectMultipliers: [
            Effect.damageMagicka.id: .standard,
            Effect.frenzy.id: .standard,
            Effect.fortifyConjuration.id: .standard,
            Effect.weaknessToShock.id: .standard])
    static let hangingMoss = Ingredient(
        id: .init(rawValue: 0xEC14670F), name: "Hanging Moss", effectMultipliers: [
            Effect.damageMagicka.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.fortifyHealth.id: .standard,
            Effect.fortifyOneHanded.id: .standard])
    static let hawkBeak = Ingredient(
        id: .init(rawValue: 0x04D76D8E), name: "Hawk Beak", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.resistFrost.id: .standard,
            Effect.fortifyCarryWeight.id: .standard,
            Effect.resistShock.id: .standard])
    static let hawkFeathers = Ingredient(
        id: .init(rawValue: 0x2F6620F0), name: "Hawk Feathers", effectMultipliers: [
            Effect.cureDisease.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 0.36),
            Effect.fortifyLightArmor.id: .standard,
            Effect.fortifyOneHanded.id: .standard,
            Effect.fortifySneak.id: .standard])
    static let hawksEgg = Ingredient(
        id: .init(rawValue: 0x670545AD), name: "Hawk's Egg", effectMultipliers: [
            Effect.resistMagic.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.waterbreathing.id: .standard,
            Effect.lingeringDamageStamina.id: .standard])
    static let histcarp = Ingredient(
        id: .init(rawValue: 0x41BD2C86), name: "Histcarp", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifyMagicka.id: .standard,
            Effect.damageStaminaRegen.id: .standard,
            Effect.waterbreathing.id: .standard])
    static let honeycomb = Ingredient(
        id: .init(rawValue: 0xA0A4EA57), name: "Honeycomb", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifyBlock.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.5, durationMultiplier: 1.0, valueMultiplier: 1.0),
            Effect.fortifyLightArmor.id: .standard,
            Effect.ravageStamina.id: .standard])
    static let humanFlesh = Ingredient(
        id: .init(rawValue: 0xBCC83AD8), name: "Human Flesh", effectMultipliers: [
            Effect.damageHealth.id: .standard,
            Effect.paralysis.id: .standard,
            Effect.restoreMagicka.id: .standard,
            Effect.fortifySneak.id: .standard])
    static let humanHeart = Ingredient(
        id: .init(rawValue: 0xB25F0A5D), name: "Human Heart", effectMultipliers: [
            Effect.damageHealth.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.frenzy.id: .standard])
    static let iceWraithTeeth = Ingredient(
        id: .init(rawValue: 0xD02A1430), name: "Ice Wraith Teeth", effectMultipliers: [
            Effect.weaknessToFrost.id: .standard,
            Effect.fortifyHeavyArmor.id: .standard,
            Effect.invisibility.id: .standard,
            Effect.weaknessToFire.id: .standard])
    static let impStool = Ingredient(
        id: .init(rawValue: 0x984C28EB), name: "Imp Stool", effectMultipliers: [
            Effect.damageHealth.id: .standard,
            Effect.paralysis.id: .standard,
            Effect.lingeringDamageHealth.id: .standard,
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.6, durationMultiplier: 1.0, valueMultiplier: 0.57)])
    static let jarrinRoot = Ingredient(
        id: .init(rawValue: 0x07F566DA), name: "Jarrin Root", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 100.0, durationMultiplier: 1.0, valueMultiplier: 158.5),
            Effect.damageStamina.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.damageMagickaRegen.id: .standard])
    static let jazbayGrapes = Ingredient(
        id: .init(rawValue: 0xF0106005), name: "Jazbay Grapes", effectMultipliers: [
            Effect.weaknessToMagic.id: .standard,
            Effect.fortifyMagicka.id: .standard,
            Effect.regenerateMagicka.id: .standard,
            Effect.ravageHealth.id: .standard])
    static let juniperBerries = Ingredient(
        id: .init(rawValue: 0x50D3784B), name: "Juniper Berries", effectMultipliers: [
            Effect.weaknessToFire.id: .standard,
            Effect.regenerateHealth.id: .standard,
            Effect.fortifyMarksman.id: .standard,
            Effect.damageStaminaRegen.id: .standard])
    static let largeAntlers = Ingredient(
        id: .init(rawValue: 0xDCEA4183), name: "Large Antlers", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifyStamina.id: .standard,
            Effect.slow.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 6.0, valueMultiplier: 1.75),
            Effect.damageStaminaRegen.id: .standard])
    static let lavender = Ingredient(
        id: .init(rawValue: 0x22E9B578), name: "Lavender", effectMultipliers: [
            Effect.resistMagic.id: .standard,
            Effect.fortifyStamina.id: .standard,
            Effect.ravageMagicka.id: .standard,
            Effect.fortifyConjuration.id: .standard])
    static let lunaMothWing = Ingredient(
        id: .init(rawValue: 0x8C4B4D0D), name: "Luna Moth Wing", effectMultipliers: [
            Effect.damageMagicka.id: .standard,
            Effect.fortifyLightArmor.id: .standard,
            Effect.regenerateHealth.id: .standard,
            Effect.invisibility.id: .standard])
    static let moonSugar = Ingredient(
        id: .init(rawValue: 0xAAAB2B2A), name: "Moon Sugar", effectMultipliers: [
            Effect.weaknessToFire.id: .standard,
            Effect.resistFrost.id: .standard,
            Effect.restoreMagicka.id: .standard,
            Effect.regenerateMagicka.id: .standard])
    static let moraTapinella = Ingredient(
        id: .init(rawValue: 0x89737B42), name: "Mora Tapinella", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.lingeringDamageHealth.id: .standard,
            Effect.regenerateStamina.id: .standard,
            Effect.fortifyIllusion.id: .standard])
    static let mudcrabChitin = Ingredient(
        id: .init(rawValue: 0x794A3393), name: "Mudcrab Chitin", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.cureDisease.id: .standard,
            Effect.resistPoison.id: .standard,
            Effect.resistFire.id: .standard])
    static let namirasRot = Ingredient(
        id: .init(rawValue: 0x45C359C4), name: "Namira's Rot", effectMultipliers: [
            Effect.damageMagicka.id: .standard,
            Effect.fear.id: .standard,
            Effect.fortifyLockpicking.id: .standard,
            Effect.regenerateHealth.id: .standard])
    static let netchJelly = Ingredient(
        id: .init(rawValue: 0xFC60474F), name: "Netch Jelly", effectMultipliers: [
            Effect.paralysis.id: .standard,
            Effect.fortifyCarryWeight.id: .standard,
            Effect.restoreStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 1.0),
            Effect.fear.id: .standard])
    static let nightshade = Ingredient(
        id: .init(rawValue: 0x3E6197A5), name: "Nightshade", effectMultipliers: [
            Effect.damageHealth.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.lingeringDamageStamina.id: .standard,
            Effect.fortifyDestruction.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.8, durationMultiplier: 1.0, valueMultiplier: 1.0)])
    static let nirnroot = Ingredient(
        id: .init(rawValue: 0xBE5E36A4), name: "Nirnroot", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 12.6),
            Effect.damageStamina.id: .standard,
            Effect.invisibility.id: .standard,
            Effect.resistMagic.id: .standard])
    static let nordicBarnacle = Ingredient(
        id: .init(rawValue: 0x8BA5A7CC), name: "Nordic Barnacle", effectMultipliers: [
            Effect.damageMagicka.id: .standard,
            Effect.waterbreathing.id: .standard,
            Effect.regenerateHealth.id: .standard,
            Effect.fortifyPickpocket.id: .standard])
    static let orangeDartwing = Ingredient(
        id: .init(rawValue: 0x62B83FBC), name: "Orange Dartwing", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.ravageMagicka.id: .standard,
            Effect.fortifyPickpocket.id: .standard,
            Effect.lingeringDamageHealth.id: .standard])
    static let pearl = Ingredient(
        id: .init(rawValue: 0x8915653A), name: "Pearl", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.restoreMagicka.id: .standard,
            Effect.fortifyBlock.id: .standard,
            Effect.resistShock.id: .standard])
    static let pineThrushEgg = Ingredient(
        id: .init(rawValue: 0x04E21BA0), name: "Pine Thrush Egg", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifyLockpicking.id: .standard,
            Effect.weaknessToPoison.id: .standard,
            Effect.resistShock.id: .standard])
    static let poisonBloom = Ingredient(
        id: .init(rawValue: 0x51A8893A), name: "Poison Bloom", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.6),
            Effect.slow.id: .standard,
            Effect.fortifyCarryWeight.id: .standard,
            Effect.fear.id: .standard])
    static let powderedMammothTusk = Ingredient(
        id: .init(rawValue: 0x54E4B710), name: "Powdered Mammoth Tusk", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.weaknessToFire.id: .standard,
            Effect.fortifySneak.id: .standard,
            Effect.fear.id: .standard])
    static let purpleMountainFlower = Ingredient(
        id: .init(rawValue: 0x3DA6124E), name: "Purple Mountain Flower", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifySneak.id: .standard,
            Effect.lingeringDamageMagicka.id: .standard,
            Effect.resistFrost.id: .standard])
    static let redMountainFlower = Ingredient(
        id: .init(rawValue: 0xFDF0B8CC), name: "Red Mountain Flower", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.ravageMagicka.id: .standard,
            Effect.fortifyMagicka.id: .standard,
            Effect.damageHealth.id: .standard])
    static let riverBetty = Ingredient(
        id: .init(rawValue: 0xCBF1FA11), name: "River Betty", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.5, durationMultiplier: 1.0, valueMultiplier: 34.5),
            Effect.fortifyAlteration.id: .standard,
            Effect.slow.id: .standard,
            Effect.fortifyCarryWeight.id: .standard])
    static let rockWarblerEgg = Ingredient(
        id: .init(rawValue: 0x10FCC24F), name: "Rock Warbler Egg", effectMultipliers: [
            Effect.restoreHealth.id: .standard,
            Effect.fortifyOneHanded.id: .standard,
            Effect.damageStamina.id: .standard,
            Effect.weaknessToMagic.id: .standard])
    static let sabreCatTooth = Ingredient(
        id: .init(rawValue: 0x09F9B052), name: "Sabre Cat Tooth", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifyHeavyArmor.id: .standard,
            Effect.fortifySmithing.id: .standard,
            Effect.weaknessToPoison.id: .standard])
    static let salmonRoe = Ingredient(
        id: .init(rawValue: 0x8169F745), name: "Salmon Roe", effectMultipliers: [
            Effect.restoreStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.4, durationMultiplier: 1.0, valueMultiplier: 0.36),
            Effect.waterbreathing.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 12.0, valueMultiplier: 15.4),
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 12.5, durationMultiplier: 0.08, valueMultiplier: 1.05),
            Effect.regenerateMagicka.id: .standard])
    static let saltPile = Ingredient(
        id: .init(rawValue: 0xB9ECF16A), name: "Salt Pile", effectMultipliers: [
            Effect.weaknessToMagic.id: .standard,
            Effect.fortifyRestoration.id: .standard,
            Effect.slow.id: .standard,
            Effect.regenerateMagicka.id: .standard])
    static let scalyPholiota = Ingredient(
        id: .init(rawValue: 0x844624B2), name: "Scaly Pholiota", effectMultipliers: [
            Effect.weaknessToMagic.id: .standard,
            Effect.fortifyIllusion.id: .standard,
            Effect.regenerateStamina.id: .standard,
            Effect.fortifyCarryWeight.id: .standard])
    static let scathecraw = Ingredient(
        id: .init(rawValue: 0x9596FBC3), name: "Scathecraw", effectMultipliers: [
            Effect.ravageHealth.id: .standard,
            Effect.ravageStamina.id: .standard,
            Effect.ravageMagicka.id: .standard,
            Effect.lingeringDamageHealth.id: .standard])
    static let silversidePerch = Ingredient(
        id: .init(rawValue: 0xD6E57C79), name: "Silverside Perch", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.damageStaminaRegen.id: .standard,
            Effect.ravageHealth.id: .standard,
            Effect.resistFrost.id: .standard])
    static let skeeverTail = Ingredient(
        id: .init(rawValue: 0x0BE73706), name: "Skeever Tail", effectMultipliers: [
            Effect.damageStaminaRegen.id: .standard,
            Effect.ravageHealth.id: .standard,
            Effect.damageHealth.id: .standard,
            Effect.fortifyLightArmor.id: .standard])
    static let slaughterfishEgg = Ingredient(
        id: .init(rawValue: 0xE8722791), name: "Slaughterfish Egg", effectMultipliers: [
            Effect.resistPoison.id: .standard,
            Effect.fortifyPickpocket.id: .standard,
            Effect.lingeringDamageHealth.id: .standard,
            Effect.fortifyStamina.id: .standard])
    static let slaughterfishScales = Ingredient(
        id: .init(rawValue: 0x75232957), name: "Slaughterfish Scales", effectMultipliers: [
            Effect.resistFrost.id: .standard,
            Effect.lingeringDamageHealth.id: .standard,
            Effect.fortifyHeavyArmor.id: .standard,
            Effect.fortifyBlock.id: .standard])
    static let smallAntlers = Ingredient(
        id: .init(rawValue: 0xB448966E), name: "Small Antlers", effectMultipliers: [
            Effect.weaknessToPoison.id: .standard,
            Effect.fortifyRestoration.id: .standard,
            Effect.lingeringDamageStamina.id: .standard,
            Effect.damageHealth.id: .standard])
    static let smallPearl = Ingredient(
        id: .init(rawValue: 0xAEC4A099), name: "Small Pearl", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifyOneHanded.id: .standard,
            Effect.fortifyRestoration.id: .standard,
            Effect.resistFrost.id: .standard])
    static let snowberries = Ingredient(
        id: .init(rawValue: 0x3CECFA9E), name: "Snowberries", effectMultipliers: [
            Effect.resistFire.id: .standard,
            Effect.fortifyEnchanting.id: .standard,
            Effect.resistFrost.id: .standard,
            Effect.resistShock.id: .standard])
    static let spawnAsh = Ingredient(
        id: .init(rawValue: 0x3A51B3EB), name: "Spawn Ash", effectMultipliers: [
            Effect.ravageStamina.id: .standard,
            Effect.resistFire.id: .standard,
            Effect.fortifyEnchanting.id: .standard,
            Effect.ravageMagicka.id: .standard])
    static let spiderEgg = Ingredient(
        id: .init(rawValue: 0xFCB7F5B0), name: "Spider Egg", effectMultipliers: [
            Effect.damageStamina.id: .standard,
            Effect.damageMagickaRegen.id: .standard,
            Effect.fortifyLockpicking.id: .standard,
            Effect.fortifyMarksman.id: .standard])
    static let sprigganSap = Ingredient(
        id: .init(rawValue: 0x83498CC9), name: "Spriggan Sap", effectMultipliers: [
            Effect.damageMagickaRegen.id: .standard,
            Effect.fortifyEnchanting.id: .standard,
            Effect.fortifySmithing.id: .standard,
            Effect.fortifyAlteration.id: .standard])
    static let swampFungalPod = Ingredient(
        id: .init(rawValue: 0xD415E3EB), name: "Swamp Fungal Pod", effectMultipliers: [
            Effect.resistShock.id: .standard,
            Effect.lingeringDamageMagicka.id: .standard,
            Effect.paralysis.id: .standard,
            Effect.restoreHealth.id: .standard])
    static let taproot = Ingredient(
        id: .init(rawValue: 0xFAED43C1), name: "Taproot", effectMultipliers: [
            Effect.weaknessToMagic.id: .standard,
            Effect.fortifyIllusion.id: .standard,
            Effect.regenerateMagicka.id: .standard,
            Effect.restoreMagicka.id: .standard])
    static let thistleBranch = Ingredient(
        id: .init(rawValue: 0x60D01E67), name: "Thistle Branch", effectMultipliers: [
            Effect.resistFrost.id: .standard,
            Effect.ravageStamina.id: .standard,
            Effect.resistPoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.75, durationMultiplier: 0.0, valueMultiplier: 0.1),
            Effect.fortifyHeavyArmor.id: .standard])
    static let torchbugThorax = Ingredient(
        id: .init(rawValue: 0x2E6F2987), name: "Torchbug Thorax", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.lingeringDamageMagicka.id: .standard,
            Effect.weaknessToMagic.id: .standard,
            Effect.fortifyStamina.id: .standard])
    static let tramaRoot = Ingredient(
        id: .init(rawValue: 0x74E24F14), name: "Trama Root", effectMultipliers: [
            Effect.weaknessToShock.id: .standard,
            Effect.fortifyCarryWeight.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.slow.id: .standard])
    static let trollFat = Ingredient(
        id: .init(rawValue: 0xD17F8F11), name: "Troll Fat", effectMultipliers: [
            Effect.resistPoison.id: .standard,
            Effect.fortifyTwoHanded.id: .standard,
            Effect.frenzy.id: .standard,
            Effect.damageHealth.id: .standard])
    static let tundraCotton = Ingredient(
        id: .init(rawValue: 0x4A64D9D5), name: "Tundra Cotton", effectMultipliers: [
            Effect.resistMagic.id: .standard,
            Effect.fortifyMagicka.id: .standard,
            Effect.fortifyBlock.id: .standard,
            Effect.fortifyBarter.id: .standard])
    static let vampireDust = Ingredient(
        id: .init(rawValue: 0x145021F3), name: "Vampire Dust", effectMultipliers: [
            Effect.invisibility.id: .standard,
            Effect.regenerateHealth.id: .standard,
            Effect.restoreMagicka.id: .standard,
            Effect.cureDisease.id: .standard])
    static let voidSalts = Ingredient(
        id: .init(rawValue: 0x104BA086), name: "Void Salts", effectMultipliers: [
            Effect.weaknessToShock.id: .standard,
            Effect.resistMagic.id: .standard,
            Effect.damageHealth.id: .standard,
            Effect.fortifyMagicka.id: .standard])
    static let wheat = Ingredient(
        id: .init(rawValue: 0xFEA711D4), name: "Wheat", effectMultipliers: [
            Effect.restoreHealth.id: .standard,
            Effect.fortifyHealth.id: .standard,
            Effect.damageStaminaRegen.id: .standard,
            Effect.lingeringDamageMagicka.id: .standard])
    static let whiteCap = Ingredient(
        id: .init(rawValue: 0x84D141AB), name: "White Cap", effectMultipliers: [
            Effect.weaknessToFrost.id: .standard,
            Effect.fortifyHeavyArmor.id: .standard,
            Effect.restoreMagicka.id: .standard,
            Effect.ravageMagicka.id: .standard])
    static let wispWrappings = Ingredient(
        id: .init(rawValue: 0x58E19C93), name: "Wisp Wrappings", effectMultipliers: [
            Effect.restoreStamina.id: .standard,
            Effect.fortifyDestruction.id: .standard,
            Effect.fortifyCarryWeight.id: .standard,
            Effect.resistMagic.id: .standard])
    static let yellowMountainFlower = Ingredient(
        id: .init(rawValue: 0x1FF12C99), name: "Yellow Mountain Flower", effectMultipliers: [
            Effect.resistPoison.id: .standard,
            Effect.fortifyRestoration.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.fortifyHealth.id: .standard,
            Effect.damageStaminaRegen.id: .standard])

    // MARK: - Rare Curios (Anniversary Edition)

    static let alocasiaFruit = Ingredient(
        id: .init(rawValue: 0x0C79FB93), name: "Alocasia Fruit", effectMultipliers: [
            Effect.regenerateStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.light.id: .standard,
            Effect.ravageMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let ambrosia = Ingredient(
        id: .init(rawValue: 0x0DF6A822), name: "Ambrosia", effectMultipliers: [
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.curePoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 1.56)])
    static let asterBloomCore = Ingredient(
        id: .init(rawValue: 0x10C8399E), name: "Aster Bloom Core", effectMultipliers: [
            Effect.resistMagic.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyLightArmor.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.fortifyBlock.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56)])
    static let bittergreenPetals = Ingredient(
        id: .init(rawValue: 0x111F5BE2), name: "Bittergreen Petals", effectMultipliers: [
            Effect.lingeringDamageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.invisibility.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.curePoison.id: .standard,
            Effect.damageMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56)])
    static let blindWatchersEye = Ingredient(
        id: .init(rawValue: 0x11B03D91), name: "Blind Watcher's Eye", effectMultipliers: [
            Effect.light.id: .standard,
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.fortifyAlteration.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.spellAbsorption.id: .standard])
    static let blisterPodCap = Ingredient(
        id: .init(rawValue: 0x11CEC2B5), name: "Blister Pod Cap", effectMultipliers: [
            Effect.restoreMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.nightEye.id: .standard,
            Effect.invisibility.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56)])
    static let bogBeacon = Ingredient(
        id: .init(rawValue: 0x13050582), name: "Bog Beacon", effectMultipliers: [
            Effect.restoreMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyHeavyArmor.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.fear.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.damageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36)])
    static let bunglersBane = Ingredient(
        id: .init(rawValue: 0x1415231B), name: "Bungler's Bane", effectMultipliers: [
            Effect.slow.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.ravageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 3.34),
            Effect.damageStaminaRegen.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.resistMagic.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let chokeberry = Ingredient(
        id: .init(rawValue: 0x1A8DC382), name: "Chokeberry", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.ravageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 3.34),
            Effect.lingeringDamageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.weaknessToPoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56)])
    static let chokeweed = Ingredient(
        id: .init(rawValue: 0x1D2AC084), name: "Chokeweed", effectMultipliers: [
            Effect.weaknessToFrost.id: .standard,
            Effect.restoreStamina.id: .standard,
            Effect.cureDisease.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 0.36),
            Effect.damageMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56)])
    static let codaFlower = Ingredient(
        id: .init(rawValue: 0x209D27D3), name: "Coda Flower", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.lingeringDamageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.ravageMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.fortifyCarryWeight.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let comberry = Ingredient(
        id: .init(rawValue: 0x214C17E0), name: "Comberry", effectMultipliers: [
            Effect.damageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.spellAbsorption.id: .standard,
            Effect.restoreMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyDestruction.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let congealedPutrescence = Ingredient(
        id: .init(rawValue: 0x23D78086), name: "Congealed Putrescence", effectMultipliers: [
            Effect.ravageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 3.34),
            Effect.restoreMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.weaknessToFire.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.fortifyConjuration.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let corkbulbRoot = Ingredient(
        id: .init(rawValue: 0x27CD024C), name: "Corkbulb Root", effectMultipliers: [
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.resistShock.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.fortifyMarksman.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let daedraSilk = Ingredient(
        id: .init(rawValue: 0x28D8EAF1), name: "Daedra Silk", effectMultipliers: [
            Effect.lingeringDamageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.nightEye.id: .standard,
            Effect.invisibility.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56)])
    static let daedraVenin = Ingredient(
        id: .init(rawValue: 0x2AF2296F), name: "Daedra Venin", effectMultipliers: [
            Effect.ravageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 3.34),
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.fortifyDestruction.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.spellAbsorption.id: .standard])
    static let daedrothTeeth = Ingredient(
        id: .init(rawValue: 0x2DB7BD59), name: "Daedroth Teeth", effectMultipliers: [
            Effect.resistFrost.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.light.id: .standard,
            Effect.damageMagickaRegen.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.regenerateStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let dreughWax = Ingredient(
        id: .init(rawValue: 0x337BA1A5), name: "Dreugh Wax", effectMultipliers: [
            Effect.weaknessToMagic.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.frenzy.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.fortifyEnchanting.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.fortifySmithing.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let elytraIchor = Ingredient(
        id: .init(rawValue: 0x3546F37C), name: "Elytra Ichor", effectMultipliers: [
            Effect.restoreMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.invisibility.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.slow.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.fear.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14)])
    static let firePetal = Ingredient(
        id: .init(rawValue: 0x35D1F0F3), name: "Fire Petal", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.resistFire.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.spellAbsorption.id: .standard,
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56)])
    static let flameStalk = Ingredient(
        id: .init(rawValue: 0x3B039849), name: "Flame Stalk", effectMultipliers: [
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.resistFrost.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.weaknessToFire.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.invisibility.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56)])
    static let fungusstalk = Ingredient(
        id: .init(rawValue: 0x3CA6AF23), name: "Fungus Stalk", effectMultipliers: [
            Effect.restoreMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 5.0, valueMultiplier: 7.5),
            Effect.fortifyStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 5.0, valueMultiplier: 7.5),
            Effect.waterbreathing.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.6, valueMultiplier: 1.67)])
    static let gnarlBark = Ingredient(
        id: .init(rawValue: 0x3D911E5A), name: "Gnarl Bark", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyHeavyArmor.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.resistFire.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36)])
    static let goldKanet = Ingredient(
        id: .init(rawValue: 0x3EA0DE81), name: "Gold Kanet", effectMultipliers: [
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.ravageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 3.34),
            Effect.weaknessToFrost.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.fortifySmithing.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let hackleLoLeaf = Ingredient(
        id: .init(rawValue: 0x43C5812F), name: "Hackle-Lo Leaf", effectMultipliers: [
            Effect.restoreStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.waterbreathing.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.6, valueMultiplier: 1.67),
            Effect.fortifyRestoration.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let heartOfOrder = Ingredient(
        id: .init(rawValue: 0x43EAB7FE), name: "Heart of Order", effectMultipliers: [
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 5.0, valueMultiplier: 7.5),
            Effect.fortifyOneHanded.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.fortifyTwoHanded.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let hungerTongue = Ingredient(
        id: .init(rawValue: 0x4B17D886), name: "Hunger Tongue", effectMultipliers: [
            Effect.weaknessToFire.id: .standard,
            Effect.cureDisease.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 0.36),
            Effect.curePoison.id: .standard,
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let hydnumAzureGiantSpore = Ingredient(
        id: .init(rawValue: 0x4C46972F), name: "Hydnum Azure Giant Spore", effectMultipliers: [
            Effect.resistFrost.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.fortifyHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 5.0, valueMultiplier: 7.5),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.light.id: .standard])
    static let hyphaFacia = Ingredient(
        id: .init(rawValue: 0x4E082F65), name: "Hypha Facia", effectMultipliers: [
            Effect.weaknessToPoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.frenzy.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.ravageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 3.34),
            Effect.resistMagic.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let impGall = Ingredient(
        id: .init(rawValue: 0x4E57B0C5), name: "Imp Gall", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.weaknessToFire.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.fortifyBarter.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.curePoison.id: .standard])
    static let kagoutiHide = Ingredient(
        id: .init(rawValue: 0x55328130), name: "Kagouti Hide", effectMultipliers: [
            Effect.lingeringDamageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.nightEye.id: .standard,
            Effect.fortifyCarryWeight.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.resistShock.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36)])
    static let kreshFiber = Ingredient(
        id: .init(rawValue: 0x58997AD8), name: "Kresh Fiber", effectMultipliers: [
            Effect.weaknessToMagic.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.slow.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.fortifySneak.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.fortifyPickpocket.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let lichor = Ingredient(
        id: .init(rawValue: 0x58B79350), name: "Lichor", effectMultipliers: [
            Effect.restoreMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.regenerateMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.spellAbsorption.id: .standard])
    static let luminousRussula = Ingredient(
        id: .init(rawValue: 0x59A68D7F), name: "Luminous Russula", effectMultipliers: [
            Effect.lingeringDamageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.lingeringDamageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.waterbreathing.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.6, valueMultiplier: 1.67),
            Effect.fear.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14)])
    static let marshmerrow = Ingredient(
        id: .init(rawValue: 0x5A769A0C), name: "Marshmerrow", effectMultipliers: [
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyCarryWeight.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.weaknessToMagic.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.damageStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36)])
    static let minotaurHorn = Ingredient(
        id: .init(rawValue: 0x5AC4B6D4), name: "Minotaur Horn", effectMultipliers: [
            Effect.resistPoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.damageMagickaRegen.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.regenerateMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let ogresTeeth = Ingredient(
        id: .init(rawValue: 0x5E2FEF27), name: "Ogre's Teeth", effectMultipliers: [
            Effect.weaknessToShock.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.resistPoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.lingeringDamageMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let redKelpGasBladder = Ingredient(
        id: .init(rawValue: 0x5E5B175A), name: "Red Kelp Gas Bladder", effectMultipliers: [
            Effect.regenerateStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.waterbreathing.id: .standard,
            Effect.cureDisease.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 0.36),
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let redwortFlower = Ingredient(
        id: .init(rawValue: 0x602BFE3E), name: "Redwort Flower", effectMultipliers: [
            Effect.resistFrost.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.curePoison.id: .standard,
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.invisibility.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56)])
    static let roobrush = Ingredient(
        id: .init(rawValue: 0x6069533F), name: "Roobrush", effectMultipliers: [
            Effect.weaknessToMagic.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.fortifySneak.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.lingeringDamageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.curePoison.id: .standard])
    static let saltrice = Ingredient(
        id: .init(rawValue: 0x611FF16A), name: "Saltrice", effectMultipliers: [
            Effect.restoreStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.damageStaminaRegen.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let scalonFin = Ingredient(
        id: .init(rawValue: 0x61B6D39E), name: "Scalon Fin", effectMultipliers: [
            Effect.waterbreathing.id: .standard,
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.lingeringDamageMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.damageMagickaRegen.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14)])
    static let scribJelly = Ingredient(
        id: .init(rawValue: 0x6472F90D), name: "Scrib Jelly", effectMultipliers: [
            Effect.regenerateMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.curePoison.id: .standard,
            Effect.cureDisease.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 0.36),
            Effect.regenerateStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let scribJerky = Ingredient(
        id: .init(rawValue: 0x67C995F6), name: "Scrib Jerky", effectMultipliers: [
            Effect.restoreStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.paralysis.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.5, valueMultiplier: 1.56),
            Effect.waterbreathing.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.6, valueMultiplier: 1.67)])
    static let sloadSoap = Ingredient(
        id: .init(rawValue: 0x67FE62D3), name: "Sload Soap", effectMultipliers: [
            Effect.resistFire.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.fear.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14),
            Effect.fortifyConjuration.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyAlteration.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27)])
    static let stoneflowerPetals = Ingredient(
        id: .init(rawValue: 0x68CB00DA), name: "Stoneflower Petals", effectMultipliers: [
            Effect.weaknessToShock.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.33, durationMultiplier: 1.0, valueMultiplier: 1.36),
            Effect.fortifyOneHanded.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.fortifyEnchanting.id: IngredientEffectMultiplier(magnitudeMultiplier: 2.0, durationMultiplier: 1.0, valueMultiplier: 2.14)])
    static let voidEssence = Ingredient(
        id: .init(rawValue: 0x6941EDFE), name: "Void Essence", effectMultipliers: [
            Effect.restoreHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22),
            Effect.fortifyHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 5.0, valueMultiplier: 7.5),
            Effect.fortifyStamina.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 5.0, valueMultiplier: 7.5),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.2, durationMultiplier: 1.0, valueMultiplier: 1.22)])
    static let watchersEye = Ingredient(
        id: .init(rawValue: 0x6A2B45C8), name: "Watcher's Eye", effectMultipliers: [
            Effect.nightEye.id: .standard,
            Effect.fortifyMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.fortifyIllusion.id: IngredientEffectMultiplier(magnitudeMultiplier: 5.0, durationMultiplier: 1.0, valueMultiplier: 5.87),
            Effect.spellAbsorption.id: .standard])
    static let wispStalkCaps = Ingredient(
        id: .init(rawValue: 0x6B0CD99B), name: "Wisp Stalk Caps", effectMultipliers: [
            Effect.damageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.weaknessToPoison.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.frenzy.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14),
            Effect.spellAbsorption.id: .standard])
    static let witheringMoon = Ingredient(
        id: .init(rawValue: 0x6B3BAE30), name: "Withering Moon", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.spellAbsorption.id: .standard,
            Effect.fortifyLightArmor.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.cureDisease.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 1.0, valueMultiplier: 0.36)])
    static let wormsHeadCap = Ingredient(
        id: .init(rawValue: 0x6C1316D5), name: "Worm's Head Cap", effectMultipliers: [
            Effect.fortifyLockpicking.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.5, durationMultiplier: 1.0, valueMultiplier: 1.56),
            Effect.nightEye.id: .standard,
            Effect.fortifyCarryWeight.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.slow.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 2.0, valueMultiplier: 2.14)])

    // MARK: - Saints & Seducers (Anniversary Edition)

    static let blissBugThorax = Ingredient(
        id: .init(rawValue: 0x6DF11FA7), name: "Bliss Bug Thorax", effectMultipliers: [
            Effect.weaknessToFire.id: .standard,
            Effect.resistFire.id: .standard,
            Effect.fortifyHeavyArmor.id: .standard,
            Effect.fortifyIllusion.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.25, durationMultiplier: 1.0, valueMultiplier: 0.21)])
    static let greenButterflyWing = Ingredient(
        id: .init(rawValue: 0x70D0390A), name: "Green Butterfly Wing", effectMultipliers: [
            Effect.restoreMagicka.id: .standard,
            Effect.fear.id: .standard,
            Effect.slow.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 6.0, valueMultiplier: 0.57),
            Effect.invisibility.id: .standard])
    static let purpleButterflyWing = Ingredient(
        id: .init(rawValue: 0x73535146), name: "Purple Butterfly Wing", effectMultipliers: [
            Effect.regenerateHealth.id: .standard,
            Effect.regenerateMagicka.id: .standard,
            Effect.regenerateStamina.id: .standard,
            Effect.paralysis.id: .standard])
    static let rotScale = Ingredient(
        id: .init(rawValue: 0x7726FFBF), name: "Rot Scale", effectMultipliers: [
            Effect.slow.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 3.0, valueMultiplier: 0.26),
            Effect.lingeringDamageHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 3.0, valueMultiplier: 3.34),
            Effect.fear.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 0.16, valueMultiplier: 0.14),
            Effect.paralysis.id: .standard])
    static let screamingMaw = Ingredient(
        id: .init(rawValue: 0x77EE4F1B), name: "Screaming Maw", effectMultipliers: [
            Effect.regenerateMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 4.0, durationMultiplier: 0.2, valueMultiplier: 0.78),
            Effect.fortifyAlteration.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.25, durationMultiplier: 1.0, valueMultiplier: 1.27),
            Effect.invisibility.id: IngredientEffectMultiplier(magnitudeMultiplier: 1.0, durationMultiplier: 4.0, valueMultiplier: 4.6),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 4.0, durationMultiplier: 0.03, valueMultiplier: 0.11)])
    static let thornHook = Ingredient(
        id: .init(rawValue: 0x77F1C92D), name: "Thorn Hook", effectMultipliers: [
            Effect.lingeringDamageHealth.id: .standard,
            Effect.paralysis.id: .standard,
            Effect.regenerateMagicka.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.6, durationMultiplier: 0.6, valueMultiplier: 0.32),
            Effect.regenerateHealth.id: IngredientEffectMultiplier(magnitudeMultiplier: 0.6, durationMultiplier: 0.6, valueMultiplier: 0.32)])

    // MARK: - The Cause (Anniversary Edition)

    static let bloodgrass = Ingredient(
        id: .init(rawValue: 0x7C849020), name: "Bloodgrass", effectMultipliers: [
            Effect.invisibility.id: .standard,
            Effect.resistPoison.id: .standard,
            Effect.slow.id: .standard,
            Effect.fortifyHealth.id: .standard])
    static let harrada = Ingredient(
        id: .init(rawValue: 0x7E5FB839), name: "Harrada", effectMultipliers: [
            Effect.damageHealth.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.paralysis.id: .standard,
            Effect.damageMagickaRegen.id: .standard])
    static let spiddalStick = Ingredient(
        id: .init(rawValue: 0x7E7790A5), name: "Spiddal Stick", effectMultipliers: [
            Effect.damageHealth.id: .standard,
            Effect.damageMagicka.id: .standard,
            Effect.weaknessToFire.id: .standard,
            Effect.restoreStamina.id: .standard])

    public static let all: [Ingredient] = [
        .abeceanLongfin,
        .ancestorMothWing,
        .ashCreepCluster,
        .ashHopperJelly,
        .ashenGrassPod,
        .bearClaws,
        .bee,
        .beehiveHusk,
        .beritsAshes,
        .bleedingCrown,
        .blisterWort,
        .blueButterflyWing,
        .blueDartwing,
        .blueMountainFlower,
        .boarTusk,
        .boneMeal,
        .briarHeart,
        .burntSprigganWood,
        .butterflyWing,
        .canisRoot,
        .charredSkeeverHide,
        .chaurusEggs,
        .chaurusHunterAntennae,
        .chickensEgg,
        .creepCluster,
        .crimsonNirnroot,
        .cyrodilicSpadetail,
        .daedraHeart,
        .deathbell,
        .dragonsTongue,
        .dwarvenOil,
        .ectoplasm,
        .elvesEar,
        .emperorParasolMoss,
        .eyeOfSabreCat,
        .falmerEar,
        .felsaadTernFeathers,
        .fireSalts,
        .flyAmanita,
        .frostMirriam,
        .frostSalts,
        .garlic,
        .giantLichen,
        .giantsToe,
        .gleamblossom,
        .glowDust,
        .glowingMushroom,
        .grassPod,
        .hagravenClaw,
        .hagravenFeathers,
        .hangingMoss,
        .hawkBeak,
        .hawkFeathers,
        .hawksEgg,
        .histcarp,
        .honeycomb,
        .humanFlesh,
        .humanHeart,
        .iceWraithTeeth,
        .impStool,
        .jarrinRoot,
        .jazbayGrapes,
        .juniperBerries,
        .largeAntlers,
        .lavender,
        .lunaMothWing,
        .moonSugar,
        .moraTapinella,
        .mudcrabChitin,
        .namirasRot,
        .netchJelly,
        .nightshade,
        .nirnroot,
        .nordicBarnacle,
        .orangeDartwing,
        .pearl,
        .pineThrushEgg,
        .poisonBloom,
        .powderedMammothTusk,
        .purpleMountainFlower,
        .redMountainFlower,
        .riverBetty,
        .rockWarblerEgg,
        .sabreCatTooth,
        .salmonRoe,
        .saltPile,
        .scalyPholiota,
        .scathecraw,
        .silversidePerch,
        .skeeverTail,
        .slaughterfishEgg,
        .slaughterfishScales,
        .smallAntlers,
        .smallPearl,
        .snowberries,
        .spawnAsh,
        .spiderEgg,
        .sprigganSap,
        .swampFungalPod,
        .taproot,
        .thistleBranch,
        .torchbugThorax,
        .tramaRoot,
        .trollFat,
        .tundraCotton,
        .vampireDust,
        .voidSalts,
        .wheat,
        .whiteCap,
        .wispWrappings,
        .yellowMountainFlower,
        // Rare Curios
        .alocasiaFruit,
        .ambrosia,
        .asterBloomCore,
        .bittergreenPetals,
        .blindWatchersEye,
        .blisterPodCap,
        .bogBeacon,
        .bunglersBane,
        .chokeberry,
        .chokeweed,
        .codaFlower,
        .comberry,
        .congealedPutrescence,
        .corkbulbRoot,
        .daedraSilk,
        .daedraVenin,
        .daedrothTeeth,
        .dreughWax,
        .elytraIchor,
        .firePetal,
        .flameStalk,
        .fungusstalk,
        .gnarlBark,
        .goldKanet,
        .hackleLoLeaf,
        .heartOfOrder,
        .hungerTongue,
        .hydnumAzureGiantSpore,
        .hyphaFacia,
        .impGall,
        .kagoutiHide,
        .kreshFiber,
        .lichor,
        .luminousRussula,
        .marshmerrow,
        .minotaurHorn,
        .ogresTeeth,
        .redKelpGasBladder,
        .redwortFlower,
        .roobrush,
        .saltrice,
        .scalonFin,
        .scribJelly,
        .scribJerky,
        .sloadSoap,
        .stoneflowerPetals,
        .voidEssence,
        .watchersEye,
        .wispStalkCaps,
        .witheringMoon,
        .wormsHeadCap,
        // Saints & Seducers
        .blissBugThorax,
        .greenButterflyWing,
        .purpleButterflyWing,
        .rotScale,
        .screamingMaw,
        .thornHook,
        // The Cause
        .bloodgrass,
        .harrada,
        .spiddalStick
    ]
}

extension Array where Element == Ingredient {
    mutating func sortByName() {
        sort(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })
    }
}
