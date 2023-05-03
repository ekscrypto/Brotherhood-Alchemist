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
    public var effects: Set<Effect.Id>
        
    static let abeceanLongfin = Ingredient(
        id: .init(rawValue: 0xBC3C876A), name: "Abecean Longfin", effects: [
            Effect.weaknessToFrost.id,
            Effect.fortifySneak.id,
            Effect.weaknessToPoison.id,
            Effect.fortifyRestoration.id])
    static let ancestorMothWing = Ingredient(
        id: .init(rawValue: 0x79CDFB2C), name: "Ancestor Moth Wing", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyEnchanting.id])
    static let ashCreepCluster = Ingredient(
        id: .init(rawValue: 0x11EEFF1D), name: "Ash Creep Cluster", effects: [
            Effect.damageStamina.id,
            Effect.invisibility.id,
            Effect.resistFire.id,
            Effect.fortifyDestruction.id])
    static let ashHopperJelly = Ingredient(
        id: .init(rawValue: 0xF6D56C08), name: "Ash Hopper Jelly", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyLightArmor.id,
            Effect.resistShock.id,
            Effect.weaknessToFrost.id])
    static let ashenGrassPod = Ingredient(
        id: .init(rawValue: 0xE6C90A9B), name: "Ashen Grass Pod", effects: [
            Effect.resistFire.id,
            Effect.weaknessToShock.id,
            Effect.fortifyLockpicking.id,
            Effect.fortifySneak.id])
    static let bearClaws = Ingredient(
        id: .init(rawValue: 0x062CF6CD), name: "Bear Claws", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyHealth.id,
            Effect.fortifyOneHanded.id,
            Effect.damageMagickaRegen.id])
    static let bee = Ingredient(
        id: .init(rawValue: 0xDA152748), name: "Bee", effects: [
            Effect.restoreStamina.id,
            Effect.ravageStamina.id,
            Effect.regenerateStamina.id,
            Effect.weaknessToShock.id])
    static let beehiveHusk = Ingredient(
        id: .init(rawValue: 0x6D6E4999), name: "Beehive Husk", effects: [
            Effect.resistPoison.id,
            Effect.fortifyLightArmor.id,
            Effect.fortifySneak.id,
            Effect.fortifyDestruction.id])
    static let beritsAshes = Ingredient(
        id: .init(rawValue: 0x5FDD6FAD), name: "Berit's Ashes", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.resistFire.id,
            Effect.ravageStamina.id])
    static let bleedingCrown = Ingredient(
        id: .init(rawValue: 0xDA5E9345), name: "Bleeding Crown", effects: [
            Effect.weaknessToFire.id,
            Effect.fortifyBlock.id,
            Effect.weaknessToPoison.id,
            Effect.resistMagic.id])
    static let blisterWort = Ingredient(
        id: .init(rawValue: 0xBD641756), name: "Blisterwort", effects: [
            Effect.damageStamina.id,
            Effect.restoreHealth.id,
            Effect.frenzy.id,
            Effect.fortifySmithing.id])
    static let blueButterflyWing = Ingredient(
        id: .init(rawValue: 0x330A3F36), name: "Blue Butterfly Wing", effects: [
            Effect.damageStamina.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyConjuration.id,
            Effect.fortifyEnchanting.id])
    static let blueDartwing = Ingredient(
        id: .init(rawValue: 0xA2D73C21), name: "Blue Dartwing", effects: [
            Effect.resistShock.id,
            Effect.restoreHealth.id,
            Effect.fortifyPickpocket.id,
            Effect.fear.id])
    static let blueMountainFlower = Ingredient(
        id: .init(rawValue: 0x317EA39F), name: "Blue Mountain Flower", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyConjuration.id,
            Effect.fortifyHealth.id,
            Effect.damageMagickaRegen.id])
    static let boarTusk = Ingredient(
        id: .init(rawValue: 0x1DFF44F1), name: "Boar Tusk", effects: [
            Effect.fortifyStamina.id,
            Effect.fortifyHealth.id,
            Effect.fortifyBlock.id,
            Effect.frenzy.id])
    static let boneMeal = Ingredient(
        id: .init(rawValue: 0xEEC4AAF5), name: "Bone Meal", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.resistFire.id,
            Effect.ravageStamina.id])
    static let briarHeart = Ingredient(
        id: .init(rawValue: 0x09A34E0C), name: "Briar Heart", effects: [
            Effect.restoreMagicka.id,
            Effect.fortifyBlock.id,
            Effect.paralysis.id,
            Effect.fortifyMagicka.id])
    static let burntSprigganWood = Ingredient(
        id: .init(rawValue: 0xA02F1C80), name: "Burnt Spriggan Wood", effects: [
            Effect.weaknessToFire.id,
            Effect.fortifyAlteration.id,
            Effect.damageMagickaRegen.id,
            Effect.slow.id])
    static let butterflyWing = Ingredient(
        id: .init(rawValue: 0xECF4087A), name: "Butterfly Wing", effects: [
            Effect.restoreHealth.id,
            Effect.lingeringDamageStamina.id,
            Effect.fortifyBarter.id,
            Effect.damageMagicka.id])
    static let canisRoot = Ingredient(
        id: .init(rawValue: 0x526B369B), name: "Canis Root", effects: [
            Effect.damageStamina.id,
            Effect.fortifyMarksman.id,
            Effect.fortifyOneHanded.id,
            Effect.paralysis.id])
    static let charredSkeeverHide = Ingredient(
        id: .init(rawValue: 0xFD4F1BEC), name: "Charred Skeever Hide", effects: [
            Effect.restoreStamina.id,
            Effect.resistPoison.id,
            Effect.cureDisease.id,
            Effect.restoreHealth.id])
    static let chaurusEggs = Ingredient(
        id: .init(rawValue: 0xEDFB1BE6), name: "Chaurus Eggs", effects: [
            Effect.weaknessToPoison.id,
            Effect.fortifyStamina.id,
            Effect.damageMagicka.id,
            Effect.invisibility.id])
    static let chaurusHunterAntennae = Ingredient(
        id: .init(rawValue: 0x1FD4A7CC), name: "Chaurus Hunter Antennae", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyEnchanting.id])
    static let chickensEgg = Ingredient(
        id: .init(rawValue: 0xD2729330), name: "Chicken's Egg", effects: [
            Effect.resistMagic.id,
            Effect.waterbreathing.id,
            Effect.damageMagickaRegen.id,
            Effect.lingeringDamageStamina.id])
    static let creepCluster = Ingredient(
        id: .init(rawValue: 0x9202656D), name: "Creep Cluster", effects: [
            Effect.restoreMagicka.id,
            Effect.fortifyCarryWeight.id,
            Effect.damageStaminaRegen.id,
            Effect.weaknessToMagic.id])
    static let crimsonNirnroot = Ingredient(
        id: .init(rawValue: 0xA1565958), name: "Crimson Nirnroot", effects: [
            Effect.damageHealth.id,
            Effect.invisibility.id,
            Effect.damageStamina.id,
            Effect.resistMagic.id])
    static let cyrodilicSpadetail = Ingredient(
        id: .init(rawValue: 0x4E83F3DB), name: "Cyrodilic Spadetail", effects: [
            Effect.damageStamina.id,
            Effect.fear.id,
            Effect.fortifyRestoration.id,
            Effect.ravageHealth.id])
    static let daedraHeart = Ingredient(
        id: .init(rawValue: 0xB2EABBDA), name: "Daedra Heart", effects: [
            Effect.damageStaminaRegen.id,
            Effect.damageMagicka.id,
            Effect.restoreHealth.id,
            Effect.fear.id])
    static let deathbell = Ingredient(
        id: .init(rawValue: 0xAD003FD3), name: "Deathbell", effects: [
            Effect.damageHealth.id,
            Effect.ravageStamina.id,
            Effect.slow.id,
            Effect.weaknessToPoison.id])
    static let dragonsTongue = Ingredient(
        id: .init(rawValue: 0x20558957), name: "Dragon's Tongue", effects: [
            Effect.resistFire.id,
            Effect.fortifyBarter.id,
            Effect.fortifyIllusion.id,
            Effect.fortifyTwoHanded.id])
    static let dwarvenOil = Ingredient(
        id: .init(rawValue: 0x9930DC92), name: "Dwarven Oil", effects: [
            Effect.weaknessToMagic.id,
            Effect.regenerateMagicka.id,
            Effect.fortifyIllusion.id,
            Effect.restoreMagicka.id])
    static let ectoplasm = Ingredient(
        id: .init(rawValue: 0xF51F3FBF), name: "Ectoplasm", effects: [
            Effect.restoreMagicka.id,
            Effect.fortifyDestruction.id,
            Effect.fortifyMagicka.id,
            Effect.damageHealth.id])
    static let elvesEar = Ingredient(
        id: .init(rawValue: 0xA5A64C26), name: "Elves Ear", effects: [
            Effect.restoreMagicka.id,
            Effect.weaknessToFrost.id,
            Effect.fortifyMarksman.id,
            Effect.resistFire.id])
    static let emperorParasolMoss = Ingredient(
        id: .init(rawValue: 0x680FE5AE), name: "Emperor Parasol Moss", effects: [
            Effect.damageHealth.id,
            Effect.fortifyMagicka.id,
            Effect.regenerateHealth.id,
            Effect.fortifyTwoHanded.id])
    static let eyeOfSabreCat = Ingredient(
        id: .init(rawValue: 0x35FB59B5), name: "Eye Of Sabre Cat", effects: [
            Effect.restoreStamina.id,
            Effect.damageMagicka.id,
            Effect.ravageHealth.id,
            Effect.restoreHealth.id])
    static let falmerEar = Ingredient(
        id: .init(rawValue: 0xE1FC231D), name: "Falmer Ear", effects: [
            Effect.damageHealth.id,
            Effect.frenzy.id,
            Effect.resistPoison.id,
            Effect.fortifyLockpicking.id])
    static let felsaadTernFeathers = Ingredient(
        id: .init(rawValue: 0xE215F1F9), name: "Felsaad Tern Feathers", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyLightArmor.id,
            Effect.cureDisease.id,
            Effect.resistMagic.id])
    static let fireSalts = Ingredient(
        id: .init(rawValue: 0x76CCAE63), name: "Fire Salts", effects: [
            Effect.weaknessToFrost.id,
            Effect.restoreMagicka.id,
            Effect.resistFire.id,
            Effect.regenerateMagicka.id])
    static let flyAmanita = Ingredient(
        id: .init(rawValue: 0xA684959B), name: "Fly Amanita", effects: [
            Effect.resistFire.id,
            Effect.frenzy.id,
            Effect.fortifyTwoHanded.id,
            Effect.regenerateStamina.id])
    static let frostMirriam = Ingredient(
        id: .init(rawValue: 0x84E07533), name: "Frost Mirriam", effects: [
            Effect.resistFrost.id,
            Effect.fortifySneak.id,
            Effect.ravageMagicka.id,
            Effect.damageStaminaRegen.id])
    static let frostSalts = Ingredient(
        id: .init(rawValue: 0xCBA3E01B), name: "Frost Salts", effects: [
            Effect.weaknessToFire.id,
            Effect.resistFrost.id,
            Effect.restoreMagicka.id,
            Effect.fortifyConjuration.id])
    static let garlic = Ingredient(
        id: .init(rawValue: 0x0A4988CD), name: "Garlic", effects: [
            Effect.resistPoison.id,
            Effect.fortifyStamina.id,
            Effect.regenerateMagicka.id,
            Effect.regenerateHealth.id])
    static let giantLichen = Ingredient(
        id: .init(rawValue: 0x70D33B43), name: "Giant Lichen", effects: [
            Effect.ravageHealth.id,
            Effect.weaknessToPoison.id,
            Effect.weaknessToShock.id,
            Effect.restoreMagicka.id])
    static let giantsToe = Ingredient(
        id: .init(rawValue: 0x6150191D), name: "Giant's Toe", effects: [
            Effect.damageStamina.id,
            Effect.fortifyCarryWeight.id,
            Effect.fortifyHealth.id,
            Effect.damageStaminaRegen.id])
    static let gleamblossom = Ingredient(
        id: .init(rawValue: 0x39ADD03A), name: "Gleamblossom", effects: [
            Effect.resistMagic.id,
            Effect.fear.id,
            Effect.regenerateHealth.id,
            Effect.paralysis.id])
    static let glowDust = Ingredient(
        id: .init(rawValue: 0x92B1F291), name: "Glow Dust", effects: [
            Effect.damageMagicka.id,
            Effect.fortifyDestruction.id,
            Effect.damageMagickaRegen.id,
            Effect.resistShock.id])
    static let glowingMushroom = Ingredient(
        id: .init(rawValue: 0xF3D64B5C), name: "Glowing Mushroom", effects: [
            Effect.resistShock.id,
            Effect.fortifyDestruction.id,
            Effect.fortifySmithing.id,
            Effect.fortifyHealth.id])
    static let grassPod = Ingredient(
        id: .init(rawValue: 0x29A05A71), name: "Grass Pod", effects: [
            Effect.resistPoison.id,
            Effect.ravageMagicka.id,
            Effect.fortifyAlteration.id,
            Effect.restoreMagicka.id])
    static let hagravenClaw = Ingredient(
        id: .init(rawValue: 0xBBE38898), name: "Hagraven Claw", effects: [
            Effect.resistMagic.id,
            Effect.lingeringDamageMagicka.id,
            Effect.fortifyEnchanting.id,
            Effect.fortifyBarter.id])
    static let hagravenFeathers = Ingredient(
        id: .init(rawValue: 0x90F144AD), name: "Hagraven Feathers", effects: [
            Effect.damageMagicka.id,
            Effect.frenzy.id,
            Effect.fortifyConjuration.id,
            Effect.weaknessToShock.id])
    static let hangingMoss = Ingredient(
        id: .init(rawValue: 0xEC14670F), name: "Hanging Moss", effects: [
            Effect.damageMagicka.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyHealth.id,
            Effect.fortifyOneHanded.id])
    static let hawkBeak = Ingredient(
        id: .init(rawValue: 0x04D76D8E), name: "Hawk Beak", effects: [
            Effect.restoreStamina.id,
            Effect.resistFrost.id,
            Effect.fortifyCarryWeight.id,
            Effect.resistShock.id])
    static let hawkFeathers = Ingredient(
        id: .init(rawValue: 0x2F6620F0), name: "Hawk Feathers", effects: [
            Effect.cureDisease.id,
            Effect.fortifyLightArmor.id,
            Effect.fortifyOneHanded.id,
            Effect.fortifySneak.id])
    static let hawksEgg = Ingredient(
        id: .init(rawValue: 0x670545AD), name: "Hawk's Egg", effects: [
            Effect.resistMagic.id,
            Effect.damageMagickaRegen.id,
            Effect.waterbreathing.id,
            Effect.lingeringDamageStamina.id])
    static let histcarp = Ingredient(
        id: .init(rawValue: 0x41BD2C86), name: "Histcarp", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyMagicka.id,
            Effect.damageStaminaRegen.id,
            Effect.waterbreathing.id])
    static let honeycomb = Ingredient(
        id: .init(rawValue: 0xA0A4EA57), name: "Honeycomb", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyBlock.id,
            Effect.fortifyLightArmor.id,
            Effect.ravageStamina.id])
    static let humanFlesh = Ingredient(
        id: .init(rawValue: 0xBCC83AD8), name: "Human Flesh", effects: [
            Effect.damageHealth.id,
            Effect.paralysis.id,
            Effect.restoreMagicka.id,
            Effect.fortifySneak.id])
    static let humanHeart = Ingredient(
        id: .init(rawValue: 0xB25F0A5D), name: "Human Heart", effects: [
            Effect.damageHealth.id,
            Effect.damageMagickaRegen.id,
            Effect.damageMagicka.id,
            Effect.frenzy.id])
    static let iceWraithTeeth = Ingredient(
        id: .init(rawValue: 0xD02A1430), name: "Ice Wraith Teeth", effects: [
            Effect.weaknessToFrost.id,
            Effect.fortifyHeavyArmor.id,
            Effect.invisibility.id,
            Effect.weaknessToFire.id])
    static let impStool = Ingredient(
        id: .init(rawValue: 0x984C28EB), name: "Imp Stool", effects: [
            Effect.damageHealth.id,
            Effect.paralysis.id,
            Effect.lingeringDamageHealth.id,
            Effect.restoreHealth.id])
    static let jarrinRoot = Ingredient(
        id: .init(rawValue: 0x07F566DA), name: "Jarrin Root", effects: [
            Effect.damageHealth.id,
            Effect.damageStamina.id,
            Effect.damageMagicka.id,
            Effect.damageMagickaRegen.id])
    static let jazbayGrapes = Ingredient(
        id: .init(rawValue: 0xF0106005), name: "Jazbay Grapes", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyMagicka.id,
            Effect.regenerateMagicka.id,
            Effect.ravageHealth.id])
    static let juniperBerries = Ingredient(
        id: .init(rawValue: 0x50D3784B), name: "Juniper Berries", effects: [
            Effect.weaknessToFire.id,
            Effect.regenerateHealth.id,
            Effect.fortifyMarksman.id,
            Effect.damageStaminaRegen.id])
    static let largeAntlers = Ingredient(
        id: .init(rawValue: 0xDCEA4183), name: "Large Antlers", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyStamina.id,
            Effect.slow.id,
            Effect.damageStaminaRegen.id])
    static let lavender = Ingredient(
        id: .init(rawValue: 0x22E9B578), name: "Lavender", effects: [
            Effect.resistMagic.id,
            Effect.fortifyStamina.id,
            Effect.ravageMagicka.id,
            Effect.fortifyConjuration.id])
    static let lunaMothWing = Ingredient(
        id: .init(rawValue: 0x8C4B4D0D), name: "Luna Moth Wing", effects: [
            Effect.damageMagicka.id,
            Effect.fortifyLightArmor.id,
            Effect.regenerateHealth.id,
            Effect.invisibility.id])
    static let moonSugar = Ingredient(
        id: .init(rawValue: 0xAAAB2B2A), name: "Moon Sugar", effects: [
            Effect.weaknessToFire.id,
            Effect.resistFrost.id,
            Effect.restoreMagicka.id,
            Effect.regenerateMagicka.id])
    static let moraTapinella = Ingredient(
        id: .init(rawValue: 0x89737B42), name: "Mora Tapinella", effects: [
            Effect.restoreMagicka.id,
            Effect.lingeringDamageHealth.id,
            Effect.regenerateStamina.id,
            Effect.fortifyIllusion.id])
    static let mudcrabChitin = Ingredient(
        id: .init(rawValue: 0x794A3393), name: "Mudcrab Chitin", effects: [
            Effect.restoreStamina.id,
            Effect.cureDisease.id,
            Effect.resistPoison.id,
            Effect.resistFire.id])
    static let namirasRot = Ingredient(
        id: .init(rawValue: 0x45C359C4), name: "Namira's Rot", effects: [
            Effect.damageMagicka.id,
            Effect.fear.id,
            Effect.fortifyLockpicking.id,
            Effect.regenerateHealth.id])
    static let netchJelly = Ingredient(
        id: .init(rawValue: 0xFC60474F), name: "Netch Jelly", effects: [
            Effect.paralysis.id,
            Effect.fortifyCarryWeight.id,
            Effect.restoreStamina.id,
            Effect.fear.id])
    static let nightshade = Ingredient(
        id: .init(rawValue: 0x3E6197A5), name: "Nightshade", effects: [
            Effect.damageHealth.id,
            Effect.damageMagickaRegen.id,
            Effect.lingeringDamageStamina.id,
            Effect.fortifyDestruction.id])
    static let nirnroot = Ingredient(
        id: .init(rawValue: 0xBE5E36A4), name: "Nirnroot", effects: [
            Effect.damageHealth.id,
            Effect.damageStamina.id,
            Effect.invisibility.id,
            Effect.resistMagic.id])
    static let nordicBarnacle = Ingredient(
        id: .init(rawValue: 0x8BA5A7CC), name: "Nordic Barnacle", effects: [
            Effect.damageMagicka.id,
            Effect.waterbreathing.id,
            Effect.regenerateHealth.id,
            Effect.fortifyPickpocket.id])
    static let orangeDartwing = Ingredient(
        id: .init(rawValue: 0x62B83FBC), name: "Orange Dartwing", effects: [
            Effect.restoreStamina.id,
            Effect.ravageMagicka.id,
            Effect.fortifyPickpocket.id,
            Effect.lingeringDamageHealth.id])
    static let pearl = Ingredient(
        id: .init(rawValue: 0x8915653A), name: "Pearl", effects: [
            Effect.restoreStamina.id,
            Effect.restoreMagicka.id,
            Effect.fortifyBlock.id,
            Effect.resistShock.id])
    static let pineThrushEgg = Ingredient(
        id: .init(rawValue: 0x04E21BA0), name: "Pine Thrush Egg", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyLockpicking.id,
            Effect.weaknessToPoison.id,
            Effect.resistShock.id])
    static let poisonBloom = Ingredient(
        id: .init(rawValue: 0x51A8893A), name: "Poison Bloom", effects: [
            Effect.damageHealth.id,
            Effect.slow.id,
            Effect.fortifyCarryWeight.id,
            Effect.fear.id])
    static let powderedMammothTusk = Ingredient(
        id: .init(rawValue: 0x54E4B710), name: "Powdered Mammoth Tusk", effects: [
            Effect.restoreStamina.id,
            Effect.weaknessToFire.id,
            Effect.fortifySneak.id,
            Effect.fear.id])
    static let purpleMountainFlower = Ingredient(
        id: .init(rawValue: 0x3DA6124E), name: "Purple Mountain Flower", effects: [
            Effect.restoreStamina.id,
            Effect.fortifySneak.id,
            Effect.lingeringDamageMagicka.id,
            Effect.resistFrost.id])
    static let redMountainFlower = Ingredient(
        id: .init(rawValue: 0xFDF0B8CC), name: "Red Mountain Flower", effects: [
            Effect.restoreMagicka.id,
            Effect.ravageMagicka.id,
            Effect.fortifyMagicka.id,
            Effect.damageHealth.id])
    static let riverBetty = Ingredient(
        id: .init(rawValue: 0xCBF1FA11), name: "River Betty", effects: [
            Effect.damageHealth.id,
            Effect.fortifyAlteration.id,
            Effect.slow.id,
            Effect.fortifyCarryWeight.id])
    static let rockWarblerEgg = Ingredient(
        id: .init(rawValue: 0x10FCC24F), name: "Rock Warbler Egg", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyOneHanded.id,
            Effect.damageStamina.id,
            Effect.weaknessToMagic.id])
    static let sabreCatTooth = Ingredient(
        id: .init(rawValue: 0x09F9B052), name: "Sabre Cat Tooth", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyHeavyArmor.id,
            Effect.fortifySmithing.id,
            Effect.weaknessToPoison.id])
    static let salmonRoe = Ingredient(
        id: .init(rawValue: 0x8169F745), name: "Salmon Roe", effects: [
            Effect.restoreStamina.id,
            Effect.waterbreathing.id,
            Effect.fortifyMagicka.id,
            Effect.regenerateMagicka.id])
    static let saltPile = Ingredient(
        id: .init(rawValue: 0xB9ECF16A), name: "Salt Pile", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyRestoration.id,
            Effect.slow.id,
            Effect.regenerateMagicka.id])
    static let scalyPholiota = Ingredient(
        id: .init(rawValue: 0x844624B2), name: "Scaly Pholiota", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyIllusion.id,
            Effect.regenerateStamina.id,
            Effect.fortifyCarryWeight.id])
    static let scathecraw = Ingredient(
        id: .init(rawValue: 0x9596FBC3), name: "Scathecraw", effects: [
            Effect.ravageHealth.id,
            Effect.ravageStamina.id,
            Effect.ravageMagicka.id,
            Effect.lingeringDamageHealth.id])
    static let silversidePerch = Ingredient(
        id: .init(rawValue: 0xD6E57C79), name: "Silverside Perch", effects: [
            Effect.restoreStamina.id,
            Effect.damageStaminaRegen.id,
            Effect.ravageHealth.id,
            Effect.resistFrost.id])
    static let skeeverTail = Ingredient(
        id: .init(rawValue: 0x0BE73706), name: "Skeever Tail", effects: [
            Effect.damageStaminaRegen.id,
            Effect.ravageHealth.id,
            Effect.damageHealth.id,
            Effect.fortifyLightArmor.id])
    static let slaughterfishEgg = Ingredient(
        id: .init(rawValue: 0xE8722791), name: "Slaughterfish Egg", effects: [
            Effect.resistPoison.id,
            Effect.fortifyPickpocket.id,
            Effect.lingeringDamageHealth.id,
            Effect.fortifyStamina.id])
    static let slaughterfishScales = Ingredient(
        id: .init(rawValue: 0x75232957), name: "Slaughterfish Scales", effects: [
            Effect.resistFrost.id,
            Effect.lingeringDamageHealth.id,
            Effect.fortifyHeavyArmor.id,
            Effect.fortifyBlock.id])
    static let smallAntlers = Ingredient(
        id: .init(rawValue: 0xB448966E), name: "Small Antlers", effects: [
            Effect.weaknessToPoison.id,
            Effect.fortifyRestoration.id,
            Effect.lingeringDamageStamina.id,
            Effect.damageHealth.id])
    static let smallPearl = Ingredient(
        id: .init(rawValue: 0xAEC4A099), name: "Small Pearl", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyOneHanded.id,
            Effect.fortifyRestoration.id,
            Effect.resistFrost.id])
    static let snowberries = Ingredient(
        id: .init(rawValue: 0x3CECFA9E), name: "Snowberries", effects: [
            Effect.resistFire.id,
            Effect.fortifyEnchanting.id,
            Effect.resistFrost.id,
            Effect.resistShock.id])
    static let spawnAsh = Ingredient(
        id: .init(rawValue: 0x3A51B3EB), name: "Spawn Ash", effects: [
            Effect.ravageStamina.id,
            Effect.resistFire.id,
            Effect.fortifyEnchanting.id,
            Effect.ravageMagicka.id])
    static let spiderEgg = Ingredient(
        id: .init(rawValue: 0xFCB7F5B0), name: "Spider Egg", effects: [
            Effect.damageStamina.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyLockpicking.id,
            Effect.fortifyMarksman.id])
    static let sprigganSap = Ingredient(
        id: .init(rawValue: 0x83498CC9), name: "Spriggan Sap", effects: [
            Effect.damageMagickaRegen.id,
            Effect.fortifyEnchanting.id,
            Effect.fortifySmithing.id,
            Effect.fortifyAlteration.id])
    static let swampFungalPod = Ingredient(
        id: .init(rawValue: 0xD415E3EB), name: "Swamp Fungal Pod", effects: [
            Effect.resistShock.id,
            Effect.lingeringDamageMagicka.id,
            Effect.paralysis.id,
            Effect.restoreHealth.id])
    static let taproot = Ingredient(
        id: .init(rawValue: 0xFAED43C1), name: "Taproot", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyIllusion.id,
            Effect.regenerateMagicka.id,
            Effect.restoreMagicka.id])
    static let thistleBranch = Ingredient(
        id: .init(rawValue: 0x60D01E67), name: "Thistle Branch", effects: [
            Effect.resistFrost.id,
            Effect.ravageStamina.id,
            Effect.resistPoison.id,
            Effect.fortifyHeavyArmor.id])
    static let torchbugThorax = Ingredient(
        id: .init(rawValue: 0x2E6F2987), name: "Torchbug Thorax", effects: [
            Effect.restoreStamina.id,
            Effect.lingeringDamageMagicka.id,
            Effect.weaknessToMagic.id,
            Effect.fortifyStamina.id])
    static let tramaRoot = Ingredient(
        id: .init(rawValue: 0x74E24F14), name: "Trama Root", effects: [
            Effect.weaknessToShock.id,
            Effect.fortifyCarryWeight.id,
            Effect.damageMagicka.id,
            Effect.slow.id])
    static let trollFat = Ingredient(
        id: .init(rawValue: 0xD17F8F11), name: "Troll Fat", effects: [
            Effect.resistPoison.id,
            Effect.fortifyTwoHanded.id,
            Effect.frenzy.id,
            Effect.damageHealth.id])
    static let tundraCotton = Ingredient(
        id: .init(rawValue: 0x4A64D9D5), name: "Tundra Cotton", effects: [
            Effect.resistMagic.id,
            Effect.fortifyMagicka.id,
            Effect.fortifyBlock.id,
            Effect.fortifyBarter.id])
    static let vampireDust = Ingredient(
        id: .init(rawValue: 0x145021F3), name: "Vampire Dust", effects: [
            Effect.invisibility.id,
            Effect.regenerateHealth.id,
            Effect.restoreMagicka.id,
            Effect.cureDisease.id])
    static let voidSalts = Ingredient(
        id: .init(rawValue: 0x104BA086), name: "Void Salts", effects: [
            Effect.weaknessToShock.id,
            Effect.resistMagic.id,
            Effect.damageHealth.id,
            Effect.fortifyMagicka.id])
    static let wheat = Ingredient(
        id: .init(rawValue: 0xFEA711D4), name: "Wheat", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyHealth.id,
            Effect.damageStaminaRegen.id,
            Effect.lingeringDamageMagicka.id])
    static let whiteCap = Ingredient(
        id: .init(rawValue: 0x84D141AB), name: "White Cap", effects: [
            Effect.weaknessToFrost.id,
            Effect.fortifyHeavyArmor.id,
            Effect.restoreMagicka.id,
            Effect.ravageMagicka.id])
    static let wispWrappings = Ingredient(
        id: .init(rawValue: 0x58E19C93), name: "Wisp Wrappings", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyDestruction.id,
            Effect.fortifyCarryWeight.id,
            Effect.resistMagic.id])
    static let yellowMountainFlower = Ingredient(
        id: .init(rawValue: 0x1FF12C99), name: "Yellow Mountain Flower", effects: [
            Effect.resistPoison.id,
            Effect.fortifyRestoration.id,
            Effect.fortifyHealth.id,
            Effect.damageStaminaRegen.id])
    
    static let all: [Ingredient] = [
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
        .yellowMountainFlower
    ]
}

extension Array where Element == Ingredient {
    mutating func sortByName() {
        sort(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })
    }
}
