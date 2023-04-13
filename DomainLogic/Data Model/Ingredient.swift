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
        public let rawValue: UUID
        
        public init(rawValue: UUID) { self.rawValue = rawValue }
        public static func string(_ string: String) -> Id {
            Id(rawValue: UUID(uuidString: string)!)
        }
        public static var new: Id { .init(rawValue: UUID()) }
    }
    
    public let id: Id
    public var name: String
    public var effects: [Effect.Id]
    
    static let abeceanLongfin = Ingredient(
        id: .string("6DFC7D0D-5BF9-4F8F-A76E-177DA329F6CF"), name: "Abecean Longfin", effects: [
            Effect.weaknessToFrost.id,
            Effect.fortifySneak.id,
            Effect.weaknessToPoison.id,
            Effect.fortifyRestoration.id])
    static let ancestorMothWing = Ingredient(
        id: .string("291960AC-1402-48D0-B39A-783C8C9066FD"), name: "Ancestor Moth Wing", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyEnchanting.id])
    static let ashCreepCluster = Ingredient(
        id: .string("95F24A7C-1BC5-4FCF-A553-D595EEFDD036"), name: "Ash Creep Cluster", effects: [
            Effect.damageStamina.id,
            Effect.invisibility.id,
            Effect.resistFire.id,
            Effect.fortifyDestruction.id])
    static let ashHopperJelly = Ingredient(
        id: .string("18390820-1164-4DC8-A44B-7F8B42ABC207"), name: "Ash Hopper Jelly", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyLightArmor.id,
            Effect.resistShock.id,
            Effect.weaknessToFrost.id])
    static let ashenGrassPod = Ingredient(
        id: .string("07EE3023-9272-4836-BBD2-A371F12AEB30"), name: "Ashen Grass Pod", effects: [
            Effect.resistFire.id,
            Effect.weaknessToShock.id,
            Effect.fortifyLockpicking.id,
            Effect.fortifySneak.id])
    static let bearClaws = Ingredient(
        id: .string("BBA20E70-5235-41C9-A2B0-410D083B763C"), name: "Bear Claws", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyHealth.id,
            Effect.fortifyOneHanded.id,
            Effect.damageMagickaRegen.id])
    static let bee = Ingredient(
        id: .string("771FE38A-6630-4F86-9C3A-5C2A7E299AE3"), name: "Bee", effects: [
            Effect.restoreStamina.id,
            Effect.ravageStamina.id,
            Effect.regenerateStamina.id,
            Effect.weaknessToShock.id])
    static let beehiveHusk = Ingredient(
        id: .string("76A210DC-E4E0-4204-9E35-45C90E4CEF1B"), name: "Beehive Husk", effects: [
            Effect.resistPoison.id,
            Effect.fortifyLightArmor.id,
            Effect.fortifySneak.id,
            Effect.fortifyDestruction.id])
    static let beritsAshes = Ingredient(
        id: .string("47AED42E-892B-4C11-AD0D-53EEE2F46D6A"), name: "Berit's Ashes", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.resistFire.id,
            Effect.ravageStamina.id])
    static let bleedingCrown = Ingredient(
        id: .string("85B3B8CA-C28F-4A4D-A5D9-50A0858A0221"), name: "Bleeding Crown", effects: [
            Effect.weaknessToFire.id,
            Effect.fortifyBlock.id,
            Effect.weaknessToPoison.id,
            Effect.resistMagic.id])
    static let blisterWort = Ingredient(
        id: .string("DACF9978-6078-437F-AF52-70B3BB0708A7"), name: "Blisterwort", effects: [
            Effect.damageStamina.id,
            Effect.restoreHealth.id,
            Effect.frenzy.id,
            Effect.fortifySmithing.id])
    static let blueButterflyWing = Ingredient(
        id: .string("98E8650E-4F76-413F-887D-08F97C5E5096"), name: "Blue Butterfly Wing", effects: [
            Effect.damageStamina.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyConjuration.id,
            Effect.fortifyEnchanting.id])
    static let blueDartwing = Ingredient(
        id: .string("A1FE04DB-7DD3-4CE5-954F-4BF115979F63"), name: "Blue Dartwing", effects: [
            Effect.resistShock.id,
            Effect.restoreHealth.id,
            Effect.fortifyPickpocket.id,
            Effect.fear.id])
    static let blueMountainFlower = Ingredient(
        id: .string("F64EAB80-1067-48F2-81B2-D66A38198073"), name: "Blue Mountain Flower", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyConjuration.id,
            Effect.fortifyHealth.id,
            Effect.damageMagickaRegen.id])
    static let boarTusk = Ingredient(
        id: .string("2C1B0950-D7C1-4712-A937-286C3134DF1B"), name: "Boar Tusk", effects: [
            Effect.fortifyStamina.id,
            Effect.fortifyHealth.id,
            Effect.fortifyBlock.id,
            Effect.frenzy.id])
    static let boneMeal = Ingredient(
        id: .string("5C381AA7-D499-4590-8F6A-2B8C6D462AFF"), name: "Bone Meal", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.resistFire.id,
            Effect.ravageStamina.id])
    static let briarHeart = Ingredient(
        id: .string("00DA2309-1B07-4B4C-8C76-74CB0C6E3F02"), name: "Briar Heart", effects: [
            Effect.restoreMagicka.id,
            Effect.fortifyBlock.id,
            Effect.paralysis.id,
            Effect.fortifyMagicka.id])
    static let burntSprigganWood = Ingredient(
        id: .string("40EE0E74-1E9F-4C9F-A677-C5C1CE586C2F"), name: "Burnt Spriggan Wood", effects: [
            Effect.weaknessToFire.id,
            Effect.fortifyAlteration.id,
            Effect.damageMagickaRegen.id,
            Effect.slow.id])
    static let butterflyWing = Ingredient(
        id: .string("14122C46-83F8-4BE6-BCBE-B65F80BBB275"), name: "Butterfly Wing", effects: [
            Effect.restoreHealth.id,
            Effect.lingeringDamageStamina.id,
            Effect.fortifyBarter.id,
            Effect.damageMagicka.id])
    static let canisRoot = Ingredient(
        id: .string("C15A2526-1E4C-4859-BBD3-EBEE22F81551"), name: "Canis Root", effects: [
            Effect.damageStamina.id,
            Effect.fortifyMarksman.id,
            Effect.fortifyOneHanded.id,
            Effect.paralysis.id])
    static let charredSkeeverHide = Ingredient(
        id: .string("CF0FA9FC-694C-41B4-A1CB-F45AB0F12AE8"), name: "Charred Skeever Hide", effects: [
            Effect.restoreStamina.id,
            Effect.resistPoison.id,
            Effect.cureDisease.id,
            Effect.restoreHealth.id])
    static let chaurusEggs = Ingredient(
        id: .string("FA9EF298-4B9B-48A5-8848-490368303DF9"), name: "Chaurus Eggs", effects: [
            Effect.weaknessToPoison.id,
            Effect.fortifyStamina.id,
            Effect.damageMagicka.id,
            Effect.invisibility.id])
    static let chaurusHunterAntennae = Ingredient(
        id: .string("E7ED39FD-EFBF-4C78-BC33-B5A6DF7BC36B"), name: "Chaurus Hunter Antennae", effects: [
            Effect.damageStamina.id,
            Effect.fortifyConjuration.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyEnchanting.id])
    static let chickensEgg = Ingredient(
        id: .string("B292E8E6-8E85-476C-802C-C576140BEF89"), name: "Chicken's Egg", effects: [
            Effect.resistMagic.id,
            Effect.waterbreathing.id,
            Effect.damageMagickaRegen.id,
            Effect.lingeringDamageStamina.id])
    static let creepCluster = Ingredient(
        id: .string("4E3CB425-C838-4AD9-8EDD-DA9A80B6D006"), name: "Creep Cluster", effects: [
            Effect.restoreMagicka.id,
            Effect.fortifyCarryWeight.id,
            Effect.damageStaminaRegen.id,
            Effect.weaknessToMagic.id])
    static let crimsonNirnroot = Ingredient(
        id: .string("97D0DD7F-E089-426D-B658-DC641BD7AC84"), name: "Crimson Nirnroot", effects: [
            Effect.damageHealth.id,
            Effect.invisibility.id,
            Effect.damageStamina.id,
            Effect.resistMagic.id])
    static let cyrodilicSpadetail = Ingredient(
        id: .string("3566A9C3-F0C8-4264-AA1A-8D47C84B192F"), name: "Cyrodilic Spadetail", effects: [
            Effect.damageStamina.id,
            Effect.fear.id,
            Effect.fortifyRestoration.id,
            Effect.ravageHealth.id])
    static let daedraHeart = Ingredient(
        id: .string("1B837091-36B5-4CAA-98D2-E828A645095B"), name: "Daedra Heart", effects: [
            Effect.damageStaminaRegen.id,
            Effect.damageMagicka.id,
            Effect.restoreHealth.id,
            Effect.fear.id])
    static let deathbell = Ingredient(
        id: .string("04561548-839A-49CF-A6A4-093C0AA25699"), name: "Deathbell", effects: [
            Effect.damageHealth.id,
            Effect.ravageStamina.id,
            Effect.slow.id,
            Effect.weaknessToPoison.id])
    static let dragonsTongue = Ingredient(
        id: .string("88FF4A21-5D9B-47C2-AAB5-4043DC5D1326"), name: "Dragon's Tongue", effects: [
            Effect.resistFire.id,
            Effect.fortifyBarter.id,
            Effect.fortifyIllusion.id,
            Effect.fortifyTwoHanded.id])
    static let dwarvenOil = Ingredient(
        id: .string("5B853228-3807-4CED-8B62-EA60C364821D"), name: "Dwarven Oil", effects: [
            Effect.weaknessToMagic.id,
            Effect.regenerateMagicka.id,
            Effect.fortifyIllusion.id,
            Effect.restoreMagicka.id])
    static let ectoplasm = Ingredient(
        id: .string("453FEEDD-E763-491F-B94F-A35B945EA1B3"), name: "Ectoplasm", effects: [
            Effect.restoreMagicka.id,
            Effect.fortifyDestruction.id,
            Effect.fortifyMagicka.id,
            Effect.damageHealth.id])
    static let elvesEar = Ingredient(
        id: .string("6C29674A-36A8-4015-BD79-F16C3205C435"), name: "Elves Ear", effects: [
            Effect.restoreMagicka.id,
            Effect.weaknessToFrost.id,
            Effect.fortifyMarksman.id,
            Effect.resistFire.id])
    static let emperorParasolMoss = Ingredient(
        id: .string("B06E5627-9EC0-4C08-A28D-1F29869C3E00"), name: "Emperor Parasol Moss", effects: [
            Effect.damageHealth.id,
            Effect.fortifyMagicka.id,
            Effect.regenerateHealth.id,
            Effect.fortifyTwoHanded.id])
    static let eyeOfSabreCat = Ingredient(
        id: .string("C4D9CDC9-1F30-4265-BAF7-8565EB8CD445"), name: "Eye Of Sabre Cat", effects: [
            Effect.restoreStamina.id,
            Effect.damageMagicka.id,
            Effect.ravageHealth.id,
            Effect.restoreHealth.id])
    static let falmerEar = Ingredient(
        id: .string("F52EA67E-72B5-46A6-BE7E-B46809860637"), name: "Falmer Ear", effects: [
            Effect.damageHealth.id,
            Effect.frenzy.id,
            Effect.resistPoison.id,
            Effect.fortifyLockpicking.id])
    static let felsaadTernFeathers = Ingredient(
        id: .string("AD694F9F-1DEC-4EA6-92CE-DF066BFDDD98"), name: "Felsaad Tern Feathers", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyLightArmor.id,
            Effect.cureDisease.id,
            Effect.resistMagic.id])
    static let fireSalts = Ingredient(
        id: .string("F3894957-6919-4262-90F7-4E371AABD2DB"), name: "Fire Salts", effects: [
            Effect.weaknessToFrost.id,
            Effect.restoreMagicka.id,
            Effect.resistFire.id,
            Effect.regenerateMagicka.id])
    static let flyAmanita = Ingredient(
        id: .string("D458815E-9DDF-4AFA-8D11-EDAB6CDA8CB2"), name: "Fly Amanita", effects: [
            Effect.resistFire.id,
            Effect.frenzy.id,
            Effect.fortifyTwoHanded.id,
            Effect.regenerateStamina.id])
    static let frostMirriam = Ingredient(
        id: .string("9776C925-AB03-4547-854C-CBB5CE192B8B"), name: "Frost Mirriam", effects: [
            Effect.resistFrost.id,
            Effect.fortifySneak.id,
            Effect.ravageMagicka.id,
            Effect.damageStaminaRegen.id])
    static let frostSalts = Ingredient(
        id: .string("0F93EC0E-47E2-4FDC-8859-949B1E514B54"), name: "Frost Salts", effects: [
            Effect.weaknessToFire.id,
            Effect.resistFrost.id,
            Effect.restoreMagicka.id,
            Effect.fortifyConjuration.id])
    static let garlic = Ingredient(
        id: .string("98580385-A859-4BF8-AE4A-2572646E3B10"), name: "Garlic", effects: [
            Effect.resistPoison.id,
            Effect.fortifyStamina.id,
            Effect.regenerateMagicka.id,
            Effect.regenerateHealth.id])
    static let giantLichen = Ingredient(
        id: .string("C715E436-3CBB-4D34-8A73-0A540BB1F099"), name: "Giant Lichen", effects: [
            Effect.ravageHealth.id,
            Effect.weaknessToPoison.id,
            Effect.weaknessToShock.id,
            Effect.restoreMagicka.id])
    static let giantsToe = Ingredient(
        id: .string("87724ED9-2053-4370-A7DE-97D26263901C"), name: "Giant's Toe", effects: [
            Effect.damageStamina.id,
            Effect.fortifyCarryWeight.id,
            Effect.fortifyHealth.id,
            Effect.damageStaminaRegen.id])
    static let gleamblossom = Ingredient(
        id: .string("973AFA43-5A80-40B7-ACCC-656803CD549D"), name: "Gleamblossom", effects: [
            Effect.resistMagic.id,
            Effect.fear.id,
            Effect.regenerateHealth.id,
            Effect.paralysis.id])
    static let glowDust = Ingredient(
        id: .string("C9649265-3A32-4F5D-BF5A-BA9490A34F15"), name: "Glow Dust", effects: [
            Effect.damageMagicka.id,
            Effect.fortifyDestruction.id,
            Effect.damageMagickaRegen.id,
            Effect.resistShock.id])
    static let glowingMushroom = Ingredient(
        id: .string("924AD086-6BE3-4C51-8D72-70CEB1362C09"), name: "Glowing Mushroom", effects: [
            Effect.resistShock.id,
            Effect.fortifyDestruction.id,
            Effect.fortifySmithing.id,
            Effect.fortifyHealth.id])
    static let grassPod = Ingredient(
        id: .string("40C91BB2-ABBC-404C-A724-D8CD7EC8FCE5"), name: "Grass Pod", effects: [
            Effect.resistPoison.id,
            Effect.ravageMagicka.id,
            Effect.fortifyAlteration.id,
            Effect.restoreMagicka.id])
    static let hagravenClaw = Ingredient(
        id: .string("C57B5E31-222A-4F45-A078-AE0462FA5CD8"), name: "Hagraven Claw", effects: [
            Effect.resistMagic.id,
            Effect.lingeringDamageMagicka.id,
            Effect.fortifyEnchanting.id,
            Effect.fortifyBarter.id])
    static let hagravenFeathers = Ingredient(
        id: .string("E33387F5-7FD5-4A5F-BCB0-B224AD48BE36"), name: "Hagraven Feathers", effects: [
            Effect.damageMagicka.id,
            Effect.frenzy.id,
            Effect.fortifyConjuration.id,
            Effect.weaknessToShock.id])
    static let hangingMoss = Ingredient(
        id: .string("C2530289-00E2-4978-850F-CD899AD64066"), name: "Hanging Moss", effects: [
            Effect.damageMagicka.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyHealth.id,
            Effect.fortifyOneHanded.id])
    static let hawkBeak = Ingredient(
        id: .string("8F8D8369-069C-44E5-82D8-596D554DFCDD"), name: "Hawk Beak", effects: [
            Effect.restoreStamina.id,
            Effect.resistFrost.id,
            Effect.fortifyCarryWeight.id,
            Effect.resistShock.id])
    static let hawkFeathers = Ingredient(
        id: .string("5E8A3EA3-CAAC-434E-A268-246CB686B488"), name: "Hawk Feathers", effects: [
            Effect.cureDisease.id,
            Effect.fortifyLightArmor.id,
            Effect.fortifyOneHanded.id,
            Effect.fortifySneak.id])
    static let hawksEgg = Ingredient(
        id: .string("C36C0A24-509D-4629-BF1E-9515BAF44865"), name: "Hawk's Egg", effects: [
            Effect.resistMagic.id,
            Effect.damageMagickaRegen.id,
            Effect.waterbreathing.id,
            Effect.lingeringDamageStamina.id])
    static let histcarp = Ingredient(
        id: .string("49C27FB6-5079-4B22-A62E-E28E32CC594D"), name: "Histcarp", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyMagicka.id,
            Effect.damageStaminaRegen.id,
            Effect.waterbreathing.id])
    static let honeycomb = Ingredient(
        id: .string("73DD6CEA-DE14-422D-BAEB-CBD49DF3672C"), name: "Honeycomb", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyBlock.id,
            Effect.fortifyLightArmor.id,
            Effect.ravageStamina.id])
    static let humanFlesh = Ingredient(
        id: .string("0E3485D9-6856-4DB3-9BE4-2F217C46744E"), name: "Human Flesh", effects: [
            Effect.damageHealth.id,
            Effect.paralysis.id,
            Effect.restoreMagicka.id,
            Effect.fortifySneak.id])
    static let humanHeart = Ingredient(
        id: .string("06589944-98F5-4468-8461-678301C13279"), name: "Human Heart", effects: [
            Effect.damageHealth.id,
            Effect.damageMagickaRegen.id,
            Effect.damageMagicka.id,
            Effect.frenzy.id])
    static let iceWraithTeeth = Ingredient(
        id: .string("73414F5B-DC88-418A-96B9-E1880E4CC8D8"), name: "Ice Wraith Teeth", effects: [
            Effect.weaknessToFrost.id,
            Effect.fortifyHeavyArmor.id,
            Effect.invisibility.id,
            Effect.weaknessToFire.id])
    static let impStool = Ingredient(
        id: .string("8B3ACCC3-9A52-4706-A9E9-E5D76C3B5D6D"), name: "Imp Stool", effects: [
            Effect.damageHealth.id,
            Effect.paralysis.id,
            Effect.lingeringDamageHealth.id,
            Effect.restoreHealth.id])
    static let jarrinRoot = Ingredient(
        id: .string("20044600-4582-4A5E-B38F-C8F92B08F90F"), name: "Jarrin Root", effects: [
            Effect.damageHealth.id,
            Effect.damageStamina.id,
            Effect.damageMagicka.id,
            Effect.damageMagickaRegen.id])
    static let jazbayGrapes = Ingredient(
        id: .string("B51E4579-C90F-428A-B5FF-4551ACE4E619"), name: "Jazbay Grapes", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyMagicka.id,
            Effect.regenerateMagicka.id,
            Effect.ravageHealth.id])
    static let juniperBerries = Ingredient(
        id: .string("BC883F43-1A83-42CF-BDFC-9EF7298F8F03"), name: "Juniper Berries", effects: [
            Effect.weaknessToFire.id,
            Effect.regenerateHealth.id,
            Effect.fortifyMarksman.id,
            Effect.damageStaminaRegen.id])
    static let largeAntlers = Ingredient(
        id: .string("A39672D4-49E6-42F8-B1AD-D9CC78B0B337"), name: "Large Antlers", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyStamina.id,
            Effect.slow.id,
            Effect.damageStaminaRegen.id])
    static let lavender = Ingredient(
        id: .string("8D781343-CF52-4E8B-BFB3-A05B254F65CC"), name: "Lavender", effects: [
            Effect.resistMagic.id,
            Effect.fortifyStamina.id,
            Effect.ravageMagicka.id,
            Effect.fortifyConjuration.id])
    static let lunaMothWing = Ingredient(
        id: .string("69A13524-4910-4A32-B037-CDAE4336F9EE"), name: "Luna Moth Wing", effects: [
            Effect.damageMagicka.id,
            Effect.fortifyLightArmor.id,
            Effect.regenerateHealth.id,
            Effect.invisibility.id])
    static let moonSugar = Ingredient(
        id: .string("9C637D16-27BC-45B4-A1FF-430729C573C2"), name: "Moon Sugar", effects: [
            Effect.weaknessToFire.id,
            Effect.resistFrost.id,
            Effect.restoreMagicka.id,
            Effect.regenerateMagicka.id])
    static let moraTapinella = Ingredient(
        id: .string("2FD887CE-A553-4C13-96C4-7072965E48EE"), name: "Mora Tapinella", effects: [
            Effect.restoreMagicka.id,
            Effect.lingeringDamageHealth.id,
            Effect.regenerateStamina.id,
            Effect.fortifyIllusion.id])
    static let mudcrabChitin = Ingredient(
        id: .string("582431CC-CDAE-4FC1-82BC-5BA9F4DE1831"), name: "Mudcrab Chitin", effects: [
            Effect.restoreStamina.id,
            Effect.cureDisease.id,
            Effect.resistPoison.id,
            Effect.resistFire.id])
    static let namirasRot = Ingredient(
        id: .string("66000935-3568-4D07-B070-9C406C5FCABF"), name: "Namira's Rot", effects: [
            Effect.damageMagicka.id,
            Effect.fear.id,
            Effect.fortifyLockpicking.id,
            Effect.regenerateHealth.id])
    static let netchJelly = Ingredient(
        id: .string("79535A2F-2E30-473D-AB24-F7032498E025"), name: "Netch Jelly", effects: [
            Effect.paralysis.id,
            Effect.fortifyCarryWeight.id,
            Effect.restoreStamina.id,
            Effect.fear.id])
    static let nightshade = Ingredient(
        id: .string("0041E01B-EB9D-4E8F-BC98-CE404BEDCE62"), name: "Nightshade", effects: [
            Effect.damageHealth.id,
            Effect.damageMagickaRegen.id,
            Effect.lingeringDamageStamina.id,
            Effect.fortifyDestruction.id])
    static let nirnroot = Ingredient(
        id: .string("CA23A6CA-CFA5-4D87-8FA8-9429FFBD1C5D"), name: "Nirnroot", effects: [
            Effect.damageHealth.id,
            Effect.damageStamina.id,
            Effect.invisibility.id,
            Effect.resistMagic.id])
    static let nordicBarnacle = Ingredient(
        id: .string("E9623431-09FD-41F6-B292-3751C7C5C8AE"), name: "Nordic Barnacle", effects: [
            Effect.damageMagicka.id,
            Effect.waterbreathing.id,
            Effect.regenerateHealth.id,
            Effect.fortifyPickpocket.id])
    static let orangeDartwing = Ingredient(
        id: .string("71F826E8-BB03-4210-98EB-64609DC9A927"), name: "Orange Dartwing", effects: [
            Effect.restoreStamina.id,
            Effect.ravageMagicka.id,
            Effect.fortifyPickpocket.id,
            Effect.lingeringDamageHealth.id])
    static let pearl = Ingredient(
        id: .string("64F0ADF3-ABF5-4948-8373-FFAD939DCADC"), name: "Pearl", effects: [
            Effect.restoreStamina.id,
            Effect.restoreMagicka.id,
            Effect.fortifyBlock.id,
            Effect.resistShock.id])
    static let pineThrushEgg = Ingredient(
        id: .string("4BD358EB-FF59-47E6-9156-4FFC943C56D5"), name: "Pine Thrush Egg", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyLockpicking.id,
            Effect.weaknessToPoison.id,
            Effect.resistShock.id])
    static let poisonBloom = Ingredient(
        id: .string("A2ABF193-55F9-46E9-9CE7-84B6AEBEF0C0"), name: "Poison Bloom", effects: [
            Effect.damageHealth.id,
            Effect.slow.id,
            Effect.fortifyCarryWeight.id,
            Effect.fear.id])
    static let powderedMammothTusk = Ingredient(
        id: .string("B0AA6BDB-29F4-4F87-80E5-49F8C5D348E6"), name: "Powdered Mammoth Tusk", effects: [
            Effect.restoreStamina.id,
            Effect.weaknessToFire.id,
            Effect.fortifySneak.id,
            Effect.fear.id])
    static let purpleMountainFlower = Ingredient(
        id: .string("E5499797-A883-4F7B-B83E-C025564053A1"), name: "Purple Mountain Flower", effects: [
            Effect.restoreStamina.id,
            Effect.fortifySneak.id,
            Effect.lingeringDamageMagicka.id,
            Effect.resistFrost.id])
    static let redMountainFlower = Ingredient(
        id: .string("55721537-FA43-4B58-B450-AF46AC78FC37"), name: "Red Mountain Flower", effects: [
            Effect.restoreMagicka.id,
            Effect.ravageMagicka.id,
            Effect.fortifyMagicka.id,
            Effect.damageHealth.id])
    static let riverBetty = Ingredient(
        id: .string("1F5150DF-0ECA-44FA-89B1-A928F25F79DF"), name: "River Betty", effects: [
            Effect.damageHealth.id,
            Effect.fortifyAlteration.id,
            Effect.slow.id,
            Effect.fortifyCarryWeight.id])
    static let rockWarblerEgg = Ingredient(
        id: .string("82100D46-1B58-4873-89E8-72E0806E3B9C"), name: "Rock Warbler Egg", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyOneHanded.id,
            Effect.damageStamina.id,
            Effect.weaknessToMagic.id])
    static let sabreCatTooth = Ingredient(
        id: .string("538AC9E6-009F-4445-BA7A-BD2A8DB593AD"), name: "Sabre Cat Tooth", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyHeavyArmor.id,
            Effect.fortifySmithing.id,
            Effect.weaknessToPoison.id])
    static let salmonRoe = Ingredient(
        id: .string("32BC1CD9-FEDC-4B7F-B62C-E5169122F109"), name: "Salmon Roe", effects: [
            Effect.restoreStamina.id,
            Effect.waterbreathing.id,
            Effect.fortifyMagicka.id,
            Effect.regenerateMagicka.id])
    static let saltPile = Ingredient(
        id: .string("4DA482A5-A34E-4E3C-9CEA-2C3714422135"), name: "Salt Pile", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyRestoration.id,
            Effect.slow.id,
            Effect.regenerateMagicka.id])
    static let scalyPholiota = Ingredient(
        id: .string("7D607E5F-27D7-4502-BE1C-32F0DA585ED4"), name: "Scaly Pholiota", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyIllusion.id,
            Effect.regenerateStamina.id,
            Effect.fortifyCarryWeight.id])
    static let scathecraw = Ingredient(
        id: .string("5B1BE749-D156-47BA-B8AA-DDCC13FE2CE5"), name: "Scathecraw", effects: [
            Effect.ravageHealth.id,
            Effect.ravageStamina.id,
            Effect.ravageMagicka.id,
            Effect.lingeringDamageHealth.id])
    static let silversidePerch = Ingredient(
        id: .string("629B26A4-3CCF-47D7-9E54-6B6130B0D272"), name: "Silverside Perch", effects: [
            Effect.restoreStamina.id,
            Effect.damageStaminaRegen.id,
            Effect.ravageHealth.id,
            Effect.resistFrost.id])
    static let skeeverTail = Ingredient(
        id: .string("453BEC2A-2C8F-4862-A32C-772AB38B1E8D"), name: "Skeever Tail", effects: [
            Effect.damageStaminaRegen.id,
            Effect.ravageHealth.id,
            Effect.damageHealth.id,
            Effect.fortifyLightArmor.id])
    static let slaughterfishEgg = Ingredient(
        id: .string("EA1E9FEB-3817-4322-A733-CEF710035596"), name: "Slaughterfish Egg", effects: [
            Effect.resistPoison.id,
            Effect.fortifyPickpocket.id,
            Effect.lingeringDamageHealth.id,
            Effect.fortifyStamina.id])
    static let slaughterfishScales = Ingredient(
        id: .string("96579A62-52B0-4CC8-ACAA-FBB722872320"), name: "Slaughterfish Scales", effects: [
            Effect.resistFrost.id,
            Effect.lingeringDamageHealth.id,
            Effect.fortifyHeavyArmor.id,
            Effect.fortifyBlock.id])
    static let smallAntlers = Ingredient(
        id: .string("32B3E4F7-6D4D-433C-9F8E-0B66B546B1E3"), name: "Small Antlers", effects: [
            Effect.weaknessToPoison.id,
            Effect.fortifyRestoration.id,
            Effect.lingeringDamageStamina.id,
            Effect.damageHealth.id])
    static let smallPearl = Ingredient(
        id: .string("1CEBA7D6-093A-40A4-8339-50D02386DB92"), name: "Small Pearl", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyOneHanded.id,
            Effect.fortifyRestoration.id,
            Effect.resistFrost.id])
    static let snowberries = Ingredient(
        id: .string("B630B1CC-E77A-429D-99BB-28055EB38748"), name: "Snowberries", effects: [
            Effect.resistFire.id,
            Effect.fortifyEnchanting.id,
            Effect.resistFrost.id,
            Effect.resistShock.id])
    static let spawnAsh = Ingredient(
        id: .string("56E6AB9C-BA55-4554-8BDE-757AFB9498A5"), name: "Spawn Ash", effects: [
            Effect.ravageStamina.id,
            Effect.resistFire.id,
            Effect.fortifyEnchanting.id,
            Effect.ravageMagicka.id])
    static let spiderEgg = Ingredient(
        id: .string("E5833778-28D5-4057-BCEA-AC5AA8A3BD5D"), name: "Spider Egg", effects: [
            Effect.damageStamina.id,
            Effect.damageMagickaRegen.id,
            Effect.fortifyLockpicking.id,
            Effect.fortifyMarksman.id])
    static let sprigganSap = Ingredient(
        id: .string("CC940C09-68F1-4F9F-B95F-78D9795BB814"), name: "Spriggan Sap", effects: [
            Effect.damageMagickaRegen.id,
            Effect.fortifyEnchanting.id,
            Effect.fortifySmithing.id,
            Effect.fortifyAlteration.id])
    static let swampFungalPod = Ingredient(
        id: .string("EC4B8151-9490-47A7-8A41-CB5B232F39D9"), name: "Swamp Fungal Pod", effects: [
            Effect.resistShock.id,
            Effect.lingeringDamageMagicka.id,
            Effect.paralysis.id,
            Effect.restoreHealth.id])
    static let taproot = Ingredient(
        id: .string("94063DA1-AF17-4C5C-AD03-014E79060593"), name: "Taproot", effects: [
            Effect.weaknessToMagic.id,
            Effect.fortifyIllusion.id,
            Effect.regenerateMagicka.id,
            Effect.restoreMagicka.id])
    static let thistleBranch = Ingredient(
        id: .string("0A917057-5265-43AD-80BC-78C94E2299DB"), name: "Thistle Branch", effects: [
            Effect.resistFrost.id,
            Effect.ravageStamina.id,
            Effect.resistPoison.id,
            Effect.fortifyHeavyArmor.id])
    static let torchbugThorax = Ingredient(
        id: .string("1C828736-B21B-4955-B901-579F5199F137"), name: "Torchbug Thorax", effects: [
            Effect.restoreStamina.id,
            Effect.lingeringDamageMagicka.id,
            Effect.weaknessToMagic.id,
            Effect.fortifyStamina.id])
    static let tramaRoot = Ingredient(
        id: .string("7B57E0B2-F4FE-4B78-8692-B7EF51D4ED75"), name: "Trama Root", effects: [
            Effect.weaknessToShock.id,
            Effect.fortifyCarryWeight.id,
            Effect.damageMagicka.id,
            Effect.slow.id])
    static let trollFat = Ingredient(
        id: .string("8EEB96E0-178E-4DF1-9BEE-BB5770CAF89A"), name: "Troll Fat", effects: [
            Effect.resistPoison.id,
            Effect.fortifyTwoHanded.id,
            Effect.frenzy.id,
            Effect.damageHealth.id])
    static let tundraCotton = Ingredient(
        id: .string("5902D05C-BBEF-4DE3-9620-772BFCE2B9DA"), name: "Tundra Cotton", effects: [
            Effect.resistMagic.id,
            Effect.fortifyMagicka.id,
            Effect.fortifyBlock.id,
            Effect.fortifyBarter.id])
    static let vampireDust = Ingredient(
        id: .string("CE815ADB-C00D-4433-9471-30E02DB40C02"), name: "Vampire Dust", effects: [
            Effect.invisibility.id,
            Effect.regenerateHealth.id,
            Effect.restoreMagicka.id,
            Effect.cureDisease.id])
    static let voidSalts = Ingredient(
        id: .string("E68120FC-6DD7-4F3F-9527-E89290A19263"), name: "Void Salts", effects: [
            Effect.weaknessToShock.id,
            Effect.resistMagic.id,
            Effect.damageHealth.id,
            Effect.fortifyMagicka.id])
    static let wheat = Ingredient(
        id: .string("F6114D41-2DDC-471A-97BA-D4182BEAD355"), name: "Wheat", effects: [
            Effect.restoreHealth.id,
            Effect.fortifyHealth.id,
            Effect.damageStaminaRegen.id,
            Effect.lingeringDamageMagicka.id])
    static let whiteCap = Ingredient(
        id: .string("43F5E5AE-814B-45FB-9A22-4581F9DCE200"), name: "White Cap", effects: [
            Effect.weaknessToFrost.id,
            Effect.fortifyHeavyArmor.id,
            Effect.restoreMagicka.id,
            Effect.ravageMagicka.id])
    static let wispWrappings = Ingredient(
        id: .string("887EC2D2-C880-4C54-A6EA-E2A4695B4791"), name: "Wisp Wrappings", effects: [
            Effect.restoreStamina.id,
            Effect.fortifyDestruction.id,
            Effect.fortifyCarryWeight.id,
            Effect.resistMagic.id])
    static let yellowMountainFlower = Ingredient(
        id: .string("BCDC4E76-738D-498C-9CBB-925BC0F9085B"), name: "Yellow Mountain Flower", effects: [
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
