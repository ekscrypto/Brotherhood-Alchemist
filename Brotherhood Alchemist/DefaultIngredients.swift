//
//  DefaultIngredients.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct DefaultIngredients {
    static let abeceanLongfin = Ingredient(
        name: "Abecean Longfin",
        effects: [
            ~DefaultEffects.weaknessToFrost,
            ~DefaultEffects.fortifySneak,
            ~DefaultEffects.weaknessToPoison,
            ~DefaultEffects.fortifyRestoration])!
    static let ancestorMothWing = Ingredient(
        name: "Ancestor Moth Wing",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.fortifyConjuration,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.fortifyEnchanting])!
    static let ashCreepCluster = Ingredient(
        name: "Ash Creep Cluster",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.invisibility,
            ~DefaultEffects.resistFire,
            ~DefaultEffects.fortifyDestruction])!
    static let ashHopperJelly = Ingredient(
        name: "Ash Hopper Jelly",
        effects: [
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.fortifyLightArmor,
            ~DefaultEffects.resistShock,
            ~DefaultEffects.weaknessToFrost])!
    static let ashenGrassPod = Ingredient(
        name: "Ashen Grass Pod",
        effects: [
            ~DefaultEffects.resistFire,
            ~DefaultEffects.weaknessToShock,
            ~DefaultEffects.fortifyLockpicking,
            ~DefaultEffects.fortifySneak])!
    static let bearClaws = Ingredient(
        name: "Bear Claws",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyHealth,
            ~DefaultEffects.fortifyOneHanded,
            ~DefaultEffects.damageMagickaRegen])!
    static let bee = Ingredient(
        name: "Bee",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.ravageStamina,
            ~DefaultEffects.regenerateStamina,
            ~DefaultEffects.weaknessToShock])!
    static let beehiveHusk = Ingredient(
        name: "Beehive Husk",
        effects: [
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.fortifyLightArmor,
            ~DefaultEffects.fortifySneak,
            ~DefaultEffects.fortifyDestruction])!
    static let beritsAshes = Ingredient(
        name: "Berit's Ashes",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.fortifyConjuration,
            ~DefaultEffects.resistFire,
            ~DefaultEffects.ravageStamina])!
    static let bleedingCrown = Ingredient(
        name: "Bleeding Crown",
        effects: [
            ~DefaultEffects.weaknessToFire,
            ~DefaultEffects.fortifyBlock,
            ~DefaultEffects.weaknessToPoison,
            ~DefaultEffects.resistMagic])!
    static let blisterwort = Ingredient(
        name: "Blisterwort",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.frenzy,
            ~DefaultEffects.fortifySmithing])!
    static let blueButterflyWing = Ingredient(
        name: "Blue Butterfly Wing",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.fortifyConjuration,
            ~DefaultEffects.fortifyEnchanting])!
    static let blueDartwing = Ingredient(
        name: "Blue Dartwing",
        effects: [
            ~DefaultEffects.resistShock,
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.fortifyPickpocket,
            ~DefaultEffects.fear])!
    static let blueMountainFlower = Ingredient(
        name: "Blue Mountain Flower",
        effects: [
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.fortifyConjuration,
            ~DefaultEffects.fortifyHealth,
            ~DefaultEffects.damageMagickaRegen])!
    static let boarTusk = Ingredient(
        name: "Boar Tusk",
        effects: [
            ~DefaultEffects.fortifyStamina,
            ~DefaultEffects.fortifyHealth,
            ~DefaultEffects.fortifyBlock,
            ~DefaultEffects.frenzy])!
    static let boneMeal = Ingredient(
        name: "Bone Meal",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.fortifyConjuration,
            ~DefaultEffects.resistFire,
            ~DefaultEffects.ravageStamina])!
    static let briarHeart = Ingredient(
        name: "Briar Heart",
        effects: [
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.fortifyBlock,
            ~DefaultEffects.paralysis,
            ~DefaultEffects.fortifyMagicka])!
    static let burntSprigganWood = Ingredient(
        name: "Burnt Spriggan Wood",
        effects: [
            ~DefaultEffects.weaknessToFire,
            ~DefaultEffects.fortifyAlteration,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.slow])!
    static let butterflyWing = Ingredient(
        name: "Butterfly Wing",
        effects: [
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.lingeringDamageStamina,
            ~DefaultEffects.fortifyBarter,
            ~DefaultEffects.damageMagicka])!
    static let canisRoot = Ingredient(
        name: "Canis Root",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.fortifyMarksman,
            ~DefaultEffects.fortifyOneHanded,
            ~DefaultEffects.paralysis])!
    static let charredSkeeverHide = Ingredient(
        name: "Charred Skeever Hide",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.cureDisease,
            ~DefaultEffects.restoreHealth])!
    static let chaurusEggs = Ingredient(
        name: "Chaurus Eggs",
        effects: [
            ~DefaultEffects.weaknessToPoison,
            ~DefaultEffects.fortifyStamina,
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.invisibility])!
    static let chaurusHunterAntennae = Ingredient(
        name: "Chaurus Hunter Antennae",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.fortifyConjuration,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.fortifyEnchanting])!
    static let chickensEgg = Ingredient(
        name: "Chicken's Egg",
        effects: [
            ~DefaultEffects.resistMagic,
            ~DefaultEffects.waterbreathing,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.lingeringDamageStamina])!
    static let creepCluster = Ingredient(
        name: "Creep Cluster",
        effects: [
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.fortifyCarryWeight,
            ~DefaultEffects.damageStaminaRegen,
            ~DefaultEffects.weaknessToMagic])!
    static let crimsonNirnroot = Ingredient(
        name: "Crimson Nirnroot",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.invisibility,
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.resistMagic])!
    static let cyrodilicSpadetail = Ingredient(
        name: "Cyrodilic Spadetail",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.fear,
            ~DefaultEffects.fortifyRestoration,
            ~DefaultEffects.ravageHealth])!
    static let daedraHeart = Ingredient(
        name: "Daedra Heart",
        effects: [
            ~DefaultEffects.damageStaminaRegen,
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.fear])!
    static let deathbell = Ingredient(
        name: "Deathbell",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.ravageStamina,
            ~DefaultEffects.slow,
            ~DefaultEffects.weaknessToPoison])!
    static let dragonsTongue = Ingredient(
        name: "Dragon's Tongue",
        effects: [
            ~DefaultEffects.resistFire,
            ~DefaultEffects.fortifyBarter,
            ~DefaultEffects.fortifyIllusion,
            ~DefaultEffects.fortifyTwoHanded])!
    static let dwarvenOil = Ingredient(
        name: "Dwarven Oil",
        effects: [
            ~DefaultEffects.weaknessToMagic,
            ~DefaultEffects.regenerateMagicka,
            ~DefaultEffects.fortifyIllusion,
            ~DefaultEffects.restoreMagicka])!
    static let ectoplasm = Ingredient(
        name: "Ectoplasm",
        effects: [
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.fortifyDestruction,
            ~DefaultEffects.fortifyMagicka,
            ~DefaultEffects.damageHealth])!
    static let elvesEar = Ingredient(
        name: "Elves Ear",
        effects: [
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.weaknessToFrost,
            ~DefaultEffects.fortifyMarksman,
            ~DefaultEffects.resistFire])!
    static let emperorParasolMoss = Ingredient(
        name: "Emperor Parasol Moss",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.fortifyMagicka,
            ~DefaultEffects.regenerateHealth,
            ~DefaultEffects.fortifyTwoHanded])!
    static let eyeOfSabreCat = Ingredient(
        name: "Eye Of Sabre Cat",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.ravageHealth,
            ~DefaultEffects.restoreHealth])!
    static let falmerEar = Ingredient(
        name: "Falmer Ear",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.frenzy,
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.fortifyLockpicking])!
    static let felsaadTernFeathers = Ingredient(
        name: "Felsaad Tern Feathers",
        effects: [
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.fortifyLightArmor,
            ~DefaultEffects.cureDisease,
            ~DefaultEffects.resistMagic])!
    static let fireSalts = Ingredient(
        name: "Fire Salts",
        effects: [
            ~DefaultEffects.weaknessToFrost,
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.resistFire,
            ~DefaultEffects.regenerateMagicka])!
    static let flyAmanita = Ingredient(
        name: "Fly Amanita",
        effects: [
            ~DefaultEffects.resistFire,
            ~DefaultEffects.frenzy,
            ~DefaultEffects.fortifyTwoHanded,
            ~DefaultEffects.regenerateStamina])!
    static let frostMirriam = Ingredient(
        name: "Frost Mirriam",
        effects: [
            ~DefaultEffects.resistFrost,
            ~DefaultEffects.fortifySneak,
            ~DefaultEffects.ravageMagicka,
            ~DefaultEffects.damageStaminaRegen])!
    static let frostSalts = Ingredient(
        name: "Frost Salts",
        effects: [
            ~DefaultEffects.weaknessToFire,
            ~DefaultEffects.resistFrost,
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.fortifyConjuration])!
    static let garlic = Ingredient(
        name: "Garlic",
        effects: [
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.fortifyStamina,
            ~DefaultEffects.regenerateMagicka,
            ~DefaultEffects.regenerateHealth])!
    static let giantLichen = Ingredient(
        name: "Giant Lichen",
        effects: [
            ~DefaultEffects.ravageHealth,
            ~DefaultEffects.weaknessToPoison,
            ~DefaultEffects.weaknessToShock,
            ~DefaultEffects.restoreMagicka])!
    static let giantsToe = Ingredient(
        name: "Giant's Toe",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.fortifyCarryWeight,
            ~DefaultEffects.fortifyHealth,
            ~DefaultEffects.damageStaminaRegen])!
    static let gleamblossom = Ingredient(
        name: "Gleamblossom",
        effects: [
            ~DefaultEffects.resistMagic,
            ~DefaultEffects.fear,
            ~DefaultEffects.regenerateHealth,
            ~DefaultEffects.paralysis])!
    static let glowDust = Ingredient(
        name: "Glow Dust",
        effects: [
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.fortifyDestruction,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.resistShock])!
    static let glowingMushroom = Ingredient(
        name: "Glowing Mushroom",
        effects: [
            ~DefaultEffects.resistShock,
            ~DefaultEffects.fortifyDestruction,
            ~DefaultEffects.fortifySmithing,
            ~DefaultEffects.fortifyHealth])!
    static let grassPod = Ingredient(
        name: "Grass Pod",
        effects: [
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.ravageMagicka,
            ~DefaultEffects.fortifyAlteration,
            ~DefaultEffects.restoreMagicka])!
    static let hagravenClaw = Ingredient(
        name: "Hagraven Claw",
        effects: [
            ~DefaultEffects.resistMagic,
            ~DefaultEffects.lingeringDamageMagicka,
            ~DefaultEffects.fortifyEnchanting,
            ~DefaultEffects.fortifyBarter])!
    static let hagravenFeathers = Ingredient(
        name: "Hagraven Feathers",
        effects: [
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.frenzy,
            ~DefaultEffects.fortifyConjuration,
            ~DefaultEffects.weaknessToShock])!
    static let hangingMoss = Ingredient(
        name: "Hanging Moss",
        effects: [
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.fortifyHealth,
            ~DefaultEffects.fortifyOneHanded])!
    static let hawkBeak = Ingredient(
        name: "Hawk Beak",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.resistFrost,
            ~DefaultEffects.fortifyCarryWeight,
            ~DefaultEffects.resistShock])!
    static let hawkFeathers = Ingredient(
        //id: 53,
        name: "Hawk Feathers",
        effects: [
            ~DefaultEffects.cureDisease,
            ~DefaultEffects.fortifyLightArmor,
            ~DefaultEffects.fortifyOneHanded,
            ~DefaultEffects.fortifySneak])!
    static let hawksEgg = Ingredient(
        //id: 54,
        name: "Hawk's Egg",
        effects: [
            ~DefaultEffects.resistMagic,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.waterbreathing,
            ~DefaultEffects.lingeringDamageStamina])!
    static let histcarp = Ingredient(
        name: "Histcarp",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyMagicka,
            ~DefaultEffects.damageStaminaRegen,
            ~DefaultEffects.waterbreathing])!
    static let honeycomb = Ingredient(
        name: "Honeycomb",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyBlock,
            ~DefaultEffects.fortifyLightArmor,
            ~DefaultEffects.ravageStamina])!
    static let humanFlesh = Ingredient(
        name: "Human Flesh",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.paralysis,
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.fortifySneak])!
    static let humanHeart = Ingredient(
        name: "Human Heart",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.frenzy])!
    static let iceWraithTeeth = Ingredient(
        name: "Ice Wraith Teeth",
        effects: [
            ~DefaultEffects.weaknessToFrost,
            ~DefaultEffects.fortifyHeavyArmor,
            ~DefaultEffects.invisibility,
            ~DefaultEffects.weaknessToFire])!
    static let impStool = Ingredient(
        name: "Imp Stool",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.paralysis,
            ~DefaultEffects.lingeringDamageHealth,
            ~DefaultEffects.restoreHealth])!
    static let jarrinRoot = Ingredient(
        name: "Jarrin Root",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.damageMagickaRegen])!
    static let jazbayGrapes = Ingredient(
        name: "Jazbay Grapes",
        effects: [
            ~DefaultEffects.weaknessToMagic,
            ~DefaultEffects.fortifyMagicka,
            ~DefaultEffects.regenerateMagicka,
            ~DefaultEffects.ravageHealth])!
    static let juniperBerries = Ingredient(
        name: "Juniper Berries",
        effects: [
            ~DefaultEffects.weaknessToFire,
            ~DefaultEffects.regenerateHealth,
            ~DefaultEffects.fortifyMarksman,
            ~DefaultEffects.damageStaminaRegen])!
    static let largeAntlers = Ingredient(
        name: "Large Antlers",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyStamina,
            ~DefaultEffects.slow,
            ~DefaultEffects.damageStaminaRegen])!
    static let lavender = Ingredient(
        name: "Lavender",
        effects: [
            ~DefaultEffects.resistMagic,
            ~DefaultEffects.fortifyStamina,
            ~DefaultEffects.ravageMagicka,
            ~DefaultEffects.fortifyConjuration])!
    static let lunaMothWing = Ingredient(
        name: "Luna Moth Wing",
        effects: [
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.fortifyLightArmor,
            ~DefaultEffects.regenerateHealth,
            ~DefaultEffects.invisibility])!
    static let moonSugar = Ingredient(
        name: "Moon Sugar",
        effects: [
            ~DefaultEffects.weaknessToFire,
            ~DefaultEffects.resistFrost,
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.regenerateMagicka])!
    static let moraTapinella = Ingredient(
        name: "Mora Tapinella",
        effects: [
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.lingeringDamageHealth,
            ~DefaultEffects.regenerateStamina,
            ~DefaultEffects.fortifyIllusion])!
    static let mudcrabChitin = Ingredient(
        name: "Mudcrab Chitin",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.cureDisease,
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.resistFire])!
    static let namirasRot = Ingredient(
        name: "Namira's Rot",
        effects: [
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.fear,
            ~DefaultEffects.fortifyLockpicking,
            ~DefaultEffects.regenerateHealth])!
    static let netchJelly = Ingredient(
        name: "Netch Jelly",
        effects: [
            ~DefaultEffects.paralysis,
            ~DefaultEffects.fortifyCarryWeight,
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fear])!
    static let nightshade = Ingredient(
        name: "Nightshade",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.lingeringDamageStamina,
            ~DefaultEffects.fortifyDestruction])!
    static let nirnroot = Ingredient(
        name: "Nirnroot",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.invisibility,
            ~DefaultEffects.resistMagic])!
    static let nordicBarnacle = Ingredient(
        name: "Nordic Barnacle",
        effects: [
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.waterbreathing,
            ~DefaultEffects.regenerateHealth,
            ~DefaultEffects.fortifyPickpocket])!
    static let orangeDartwing = Ingredient(
        name: "Orange Dartwing",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.ravageMagicka,
            ~DefaultEffects.fortifyPickpocket,
            ~DefaultEffects.lingeringDamageHealth])!
    static let pearl = Ingredient(
        name: "Pearl",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.fortifyBlock,
            ~DefaultEffects.resistShock])!
    static let pineThrushEgg = Ingredient(
        name: "Pine Thrush Egg",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyLockpicking,
            ~DefaultEffects.weaknessToPoison,
            ~DefaultEffects.resistShock])!
    static let poisonBloom = Ingredient(
        name: "Poison Bloom",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.slow,
            ~DefaultEffects.fortifyCarryWeight,
            ~DefaultEffects.fear])!
    static let powderedMammothTusk = Ingredient(
        name: "Powdered Mammoth Tusk",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.weaknessToFire,
            ~DefaultEffects.fortifySneak,
            ~DefaultEffects.fear])!
    static let purpleMountainFlower = Ingredient(
        name: "Purple Mountain Flower",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifySneak,
            ~DefaultEffects.lingeringDamageMagicka,
            ~DefaultEffects.resistFrost])!
    static let redMountainFlower = Ingredient(
        name: "Red Mountain Flower",
        effects: [
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.ravageMagicka,
            ~DefaultEffects.fortifyMagicka,
            ~DefaultEffects.damageHealth])!
    static let riverBetty = Ingredient(
        name: "River Betty",
        effects: [
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.fortifyAlteration,
            ~DefaultEffects.slow,
            ~DefaultEffects.fortifyCarryWeight])!
    static let rockWarblerEgg = Ingredient(
        name: "Rock Warbler Egg",
        effects: [
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.fortifyOneHanded,
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.weaknessToMagic])!
    static let sabreCatTooth = Ingredient(
        name: "Sabre Cat Tooth",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyHeavyArmor,
            ~DefaultEffects.fortifySmithing,
            ~DefaultEffects.weaknessToPoison])!
    static let salmonRoe = Ingredient(
        name: "Salmon Roe",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.waterbreathing,
            ~DefaultEffects.fortifyMagicka,
            ~DefaultEffects.regenerateMagicka])!
    static let saltPile = Ingredient(
        name: "Salt Pile",
        effects: [
            ~DefaultEffects.weaknessToMagic,
            ~DefaultEffects.fortifyRestoration,
            ~DefaultEffects.slow,
            ~DefaultEffects.regenerateMagicka])!
    static let scalyPholiota = Ingredient(
        name: "Scaly Pholiota",
        effects: [
            ~DefaultEffects.weaknessToMagic,
            ~DefaultEffects.fortifyIllusion,
            ~DefaultEffects.regenerateStamina,
            ~DefaultEffects.fortifyCarryWeight])!
    static let scathecraw = Ingredient(
        name: "Scathecraw",
        effects: [
            ~DefaultEffects.ravageHealth,
            ~DefaultEffects.ravageStamina,
            ~DefaultEffects.ravageMagicka,
            ~DefaultEffects.lingeringDamageHealth])!
    static let silversidePerch = Ingredient(
        name: "Silverside Perch",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.damageStaminaRegen,
            ~DefaultEffects.ravageHealth,
            ~DefaultEffects.resistFrost])!
    static let skeeverTail = Ingredient(
        name: "Skeever Tail",
        effects: [
            ~DefaultEffects.damageStaminaRegen,
            ~DefaultEffects.ravageHealth,
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.fortifyLightArmor])!
    static let slaughterfishEgg = Ingredient(
        name: "Slaughterfish Egg",
        effects: [
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.fortifyPickpocket,
            ~DefaultEffects.lingeringDamageHealth,
            ~DefaultEffects.fortifyStamina])!
    static let slaughterfishScales = Ingredient(
        name: "Slaughterfish Scales",
        effects: [
            ~DefaultEffects.resistFrost,
            ~DefaultEffects.lingeringDamageHealth,
            ~DefaultEffects.fortifyHeavyArmor,
            ~DefaultEffects.fortifyBlock])!
    static let smallAntlers = Ingredient(
        name: "Small Antlers",
        effects: [
            ~DefaultEffects.weaknessToPoison,
            ~DefaultEffects.fortifyRestoration,
            ~DefaultEffects.lingeringDamageStamina,
            ~DefaultEffects.damageHealth])!
    static let smallPearl = Ingredient(
        name: "Small Pearl",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyOneHanded,
            ~DefaultEffects.fortifyRestoration,
            ~DefaultEffects.resistFrost])!
    static let snowberries = Ingredient(
        name: "Snowberries",
        effects: [
            ~DefaultEffects.resistFire,
            ~DefaultEffects.fortifyEnchanting,
            ~DefaultEffects.resistFrost,
            ~DefaultEffects.resistShock])!
    static let spawnAsh = Ingredient(
        name: "Spawn Ash",
        effects: [
            ~DefaultEffects.ravageStamina,
            ~DefaultEffects.resistFire,
            ~DefaultEffects.fortifyEnchanting,
            ~DefaultEffects.ravageMagicka])!
    static let spiderEgg = Ingredient(
        name: "Spider Egg",
        effects: [
            ~DefaultEffects.damageStamina,
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.fortifyLockpicking,
            ~DefaultEffects.fortifyMarksman])!
    static let sprigganSap = Ingredient(
        name: "Spriggan Sap",
        effects: [
            ~DefaultEffects.damageMagickaRegen,
            ~DefaultEffects.fortifyEnchanting,
            ~DefaultEffects.fortifySmithing,
            ~DefaultEffects.fortifyAlteration])!
    static let swampFungalPod = Ingredient(
        name: "Swamp Fungal Pod",
        effects: [
            ~DefaultEffects.resistShock,
            ~DefaultEffects.lingeringDamageMagicka,
            ~DefaultEffects.paralysis,
            ~DefaultEffects.restoreHealth])!
    static let taproot = Ingredient(
        name: "Taproot",
        effects: [
            ~DefaultEffects.weaknessToMagic,
            ~DefaultEffects.fortifyIllusion,
            ~DefaultEffects.regenerateMagicka,
            ~DefaultEffects.restoreMagicka])!
    static let thistleBranch = Ingredient(
        name: "Thistle Branch",
        effects: [
            ~DefaultEffects.resistFrost,
            ~DefaultEffects.ravageStamina,
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.fortifyHeavyArmor])!
    static let torchbugThorax = Ingredient(
        name: "Torchbug Thorax",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.lingeringDamageMagicka,
            ~DefaultEffects.weaknessToMagic,
            ~DefaultEffects.fortifyStamina])!
    static let tramaRoot = Ingredient(
        name: "Trama Root",
        effects: [
            ~DefaultEffects.weaknessToShock,
            ~DefaultEffects.fortifyCarryWeight,
            ~DefaultEffects.damageMagicka,
            ~DefaultEffects.slow])!
    static let trollFat = Ingredient(
        name: "Troll Fat",
        effects: [
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.fortifyTwoHanded,
            ~DefaultEffects.frenzy,
            ~DefaultEffects.damageHealth])!
    static let tundraCotton = Ingredient(
        name: "Tundra Cotton",
        effects: [
            ~DefaultEffects.resistMagic,
            ~DefaultEffects.fortifyMagicka,
            ~DefaultEffects.fortifyBlock,
            ~DefaultEffects.fortifyBarter])!
    static let vampireDust = Ingredient(
        name: "Vampire Dust",
        effects: [
            ~DefaultEffects.invisibility,
            ~DefaultEffects.regenerateHealth,
            ~DefaultEffects.restoreMagicka, ~DefaultEffects.cureDisease])!
    static let voidSalts = Ingredient(
        name: "Void Salts",
        effects: [
            ~DefaultEffects.weaknessToShock,
            ~DefaultEffects.resistMagic,
            ~DefaultEffects.damageHealth,
            ~DefaultEffects.fortifyMagicka])!
    static let wheat = Ingredient(
        name: "Wheat",
        effects: [
            ~DefaultEffects.restoreHealth,
            ~DefaultEffects.fortifyHealth,
            ~DefaultEffects.damageStaminaRegen,
            ~DefaultEffects.lingeringDamageMagicka])!
    static let whiteCap = Ingredient(
        name: "White Cap",
        effects: [
            ~DefaultEffects.weaknessToFrost,
            ~DefaultEffects.fortifyHeavyArmor,
            ~DefaultEffects.restoreMagicka,
            ~DefaultEffects.ravageMagicka])!
    static let wispWrappings = Ingredient(
        name: "Wisp Wrappings",
        effects: [
            ~DefaultEffects.restoreStamina,
            ~DefaultEffects.fortifyDestruction,
            ~DefaultEffects.fortifyCarryWeight,
            ~DefaultEffects.resistMagic])!
    static let yellowMountainFlower = Ingredient(
        name: "Yellow Mountain Flower",
        effects: [
            ~DefaultEffects.resistPoison,
            ~DefaultEffects.fortifyRestoration,
            ~DefaultEffects.fortifyHealth,
            ~DefaultEffects.damageStaminaRegen])!
    static let all: [Ingredient] = [
        DefaultIngredients.abeceanLongfin,
        DefaultIngredients.ancestorMothWing,
        DefaultIngredients.ashCreepCluster,
        DefaultIngredients.ashHopperJelly,
        DefaultIngredients.ashenGrassPod,
        DefaultIngredients.bearClaws,
        DefaultIngredients.bee,
        DefaultIngredients.beehiveHusk,
        DefaultIngredients.beritsAshes,
        DefaultIngredients.bleedingCrown,
        DefaultIngredients.blisterwort,
        DefaultIngredients.blueButterflyWing,
        DefaultIngredients.blueDartwing,
        DefaultIngredients.blueMountainFlower,
        DefaultIngredients.boarTusk,
        DefaultIngredients.boneMeal,
        DefaultIngredients.briarHeart,
        DefaultIngredients.burntSprigganWood,
        DefaultIngredients.butterflyWing,
        DefaultIngredients.canisRoot,
        DefaultIngredients.charredSkeeverHide,
        DefaultIngredients.chaurusEggs,
        DefaultIngredients.chaurusHunterAntennae,
        DefaultIngredients.chickensEgg,
        DefaultIngredients.creepCluster,
        DefaultIngredients.crimsonNirnroot,
        DefaultIngredients.cyrodilicSpadetail,
        DefaultIngredients.daedraHeart,
        DefaultIngredients.deathbell,
        DefaultIngredients.dragonsTongue,
        DefaultIngredients.dwarvenOil,
        DefaultIngredients.ectoplasm,
        DefaultIngredients.elvesEar,
        DefaultIngredients.emperorParasolMoss,
        DefaultIngredients.eyeOfSabreCat,
        DefaultIngredients.falmerEar,
        DefaultIngredients.felsaadTernFeathers,
        DefaultIngredients.fireSalts,
        DefaultIngredients.flyAmanita,
        DefaultIngredients.frostMirriam,
        DefaultIngredients.frostSalts,
        DefaultIngredients.garlic,
        DefaultIngredients.giantLichen,
        DefaultIngredients.giantsToe,
        DefaultIngredients.gleamblossom,
        DefaultIngredients.glowDust,
        DefaultIngredients.glowingMushroom,
        DefaultIngredients.grassPod,
        DefaultIngredients.hagravenClaw,
        DefaultIngredients.hagravenFeathers,
        DefaultIngredients.hangingMoss,
        DefaultIngredients.hawkBeak,
        DefaultIngredients.hawkFeathers,
        DefaultIngredients.hawksEgg,
        DefaultIngredients.histcarp,
        DefaultIngredients.honeycomb,
        DefaultIngredients.humanFlesh,
        DefaultIngredients.humanHeart,
        DefaultIngredients.iceWraithTeeth,
        DefaultIngredients.impStool,
        DefaultIngredients.jarrinRoot,
        DefaultIngredients.jazbayGrapes,
        DefaultIngredients.juniperBerries,
        DefaultIngredients.largeAntlers,
        DefaultIngredients.lavender,
        DefaultIngredients.lunaMothWing,
        DefaultIngredients.moonSugar,
        DefaultIngredients.moraTapinella,
        DefaultIngredients.mudcrabChitin,
        DefaultIngredients.namirasRot,
        DefaultIngredients.netchJelly,
        DefaultIngredients.nightshade,
        DefaultIngredients.nirnroot,
        DefaultIngredients.nordicBarnacle,
        DefaultIngredients.orangeDartwing,
        DefaultIngredients.pearl,
        DefaultIngredients.pineThrushEgg,
        DefaultIngredients.poisonBloom,
        DefaultIngredients.powderedMammothTusk,
        DefaultIngredients.purpleMountainFlower,
        DefaultIngredients.redMountainFlower,
        DefaultIngredients.riverBetty,
        DefaultIngredients.rockWarblerEgg,
        DefaultIngredients.sabreCatTooth,
        DefaultIngredients.salmonRoe,
        DefaultIngredients.saltPile,
        DefaultIngredients.scalyPholiota,
        DefaultIngredients.scathecraw,
        DefaultIngredients.silversidePerch,
        DefaultIngredients.skeeverTail,
        DefaultIngredients.slaughterfishEgg,
        DefaultIngredients.slaughterfishScales,
        DefaultIngredients.smallAntlers,
        DefaultIngredients.smallPearl,
        DefaultIngredients.snowberries,
        DefaultIngredients.spawnAsh,
        DefaultIngredients.spiderEgg,
        DefaultIngredients.sprigganSap,
        DefaultIngredients.swampFungalPod,
        DefaultIngredients.taproot,
        DefaultIngredients.thistleBranch,
        DefaultIngredients.torchbugThorax ,
        DefaultIngredients.tramaRoot,
        DefaultIngredients.trollFat,
        DefaultIngredients.tundraCotton,
        DefaultIngredients.vampireDust,
        DefaultIngredients.voidSalts,
        DefaultIngredients.wheat,
        DefaultIngredients.whiteCap,
        DefaultIngredients.wispWrappings,
        DefaultIngredients.yellowMountainFlower
        ]
}
