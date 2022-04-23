//
//  DefaultIngredients.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct DefaultIngredients {
    static let abeceanLongfin = Ingredient.DTO(
        name: "Abecean Longfin",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.fortifyRestoration.name])
    static let ancestorMothWing = Ingredient.DTO(
        name: "Ancestor Moth Wing",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyEnchanting.name])
    static let ashCreepCluster = Ingredient.DTO(
        name: "Ash Creep Cluster",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyDestruction.name])
    static let ashHopperJelly = Ingredient.DTO(
        name: "Ash Hopper Jelly",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.resistShock.name,
            DefaultEffects.weaknessToFrost.name])
    static let ashenGrassPod = Ingredient.DTO(
        name: "Ashen Grass Pod",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.fortifySneak.name])
    static let bearClaws = Ingredient.DTO(
        name: "Bear Claws",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.damageMagickaRegen.name])
    static let bee = Ingredient.DTO(
        name: "Bee",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.regenerateStamina.name,
            DefaultEffects.weaknessToShock.name])
    static let beehiveHusk = Ingredient.DTO(
        name: "Beehive Husk",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.fortifyDestruction.name])
    static let beritsAshes = Ingredient.DTO(
        name: "Berit's Ashes",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.ravageStamina.name])
    static let bleedingCrown = Ingredient.DTO(
        name: "Bleeding Crown",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.resistMagic.name])
    static let blisterwort = Ingredient.DTO(
        name: "Blisterwort",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.restoreHealth.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.fortifySmithing.name])
    static let blueButterflyWing = Ingredient.DTO(
        name: "Blue Butterfly Wing",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.fortifyEnchanting.name])
    static let blueDartwing = Ingredient.DTO(
        name: "Blue Dartwing",
        effects: [
            DefaultEffects.resistShock.name,
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyPickpocket.name,
            DefaultEffects.fear.name])
    static let blueMountainFlower = Ingredient.DTO(
        name: "Blue Mountain Flower",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageMagickaRegen.name])
    static let boarTusk = Ingredient.DTO(
        name: "Boar Tusk",
        effects: [
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.frenzy.name])
    static let boneMeal = Ingredient.DTO(
        name: "Bone Meal",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.ravageStamina.name])
    static let briarHeart = Ingredient.DTO(
        name: "Briar Heart",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.fortifyMagicka.name])
    static let burntSprigganWood = Ingredient.DTO(
        name: "Burnt Spriggan Wood",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.fortifyAlteration.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.slow.name])
    static let butterflyWing = Ingredient.DTO(
        name: "Butterfly Wing",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.lingeringDamageStamina.name,
            DefaultEffects.fortifyBarter.name,
            DefaultEffects.damageMagicka.name])
    static let canisRoot = Ingredient.DTO(
        name: "Canis Root",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyMarksman.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.paralysis.name])
    static let charredSkeeverHide = Ingredient.DTO(
        name: "Charred Skeever Hide",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.cureDisease.name,
            DefaultEffects.restoreHealth.name])
    static let chaurusEggs = Ingredient.DTO(
        name: "Chaurus Eggs",
        effects: [
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.invisibility.name])
    static let chaurusHunterAntennae = Ingredient.DTO(
        name: "Chaurus Hunter Antennae",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyEnchanting.name])
    static let chickensEgg = Ingredient.DTO(
        name: "Chicken's Egg",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.lingeringDamageStamina.name])
    static let creepCluster = Ingredient.DTO(
        name: "Creep Cluster",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.weaknessToMagic.name])
    static let crimsonNirnroot = Ingredient.DTO(
        name: "Crimson Nirnroot",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.resistMagic.name])
    static let cyrodilicSpadetail = Ingredient.DTO(
        name: "Cyrodilic Spadetail",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fear.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.ravageHealth.name])
    static let daedraHeart = Ingredient.DTO(
        name: "Daedra Heart",
        effects: [
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fear.name])
    static let deathbell = Ingredient.DTO(
        name: "Deathbell",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.slow.name,
            DefaultEffects.weaknessToPoison.name])
    static let dragonsTongue = Ingredient.DTO(
        name: "Dragon's Tongue",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyBarter.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.fortifyTwoHanded.name])
    static let dwarvenOil = Ingredient.DTO(
        name: "Dwarven Oil",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.restoreMagicka.name])
    static let ectoplasm = Ingredient.DTO(
        name: "Ectoplasm",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.damageHealth.name])
    static let elvesEar = Ingredient.DTO(
        name: "Elves Ear",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifyMarksman.name,
            DefaultEffects.resistFire.name])
    static let emperorParasolMoss = Ingredient.DTO(
        name: "Emperor Parasol Moss",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.fortifyTwoHanded.name])
    static let eyeOfSabreCat = Ingredient.DTO(
        name: "Eye Of Sabre Cat",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.ravageHealth.name,
            DefaultEffects.restoreHealth.name])
    static let falmerEar = Ingredient.DTO(
        name: "Falmer Ear",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyLockpicking.name])
    static let felsaadTernFeathers = Ingredient.DTO(
        name: "Felsaad Tern Feathers",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.cureDisease.name,
            DefaultEffects.resistMagic.name])
    static let fireSalts = Ingredient.DTO(
        name: "Fire Salts",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.regenerateMagicka.name])
    static let flyAmanita = Ingredient.DTO(
        name: "Fly Amanita",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.fortifyTwoHanded.name,
            DefaultEffects.regenerateStamina.name])
    static let frostMirriam = Ingredient.DTO(
        name: "Frost Mirriam",
        effects: [
            DefaultEffects.resistFrost.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.damageStaminaRegen.name])
    static let frostSalts = Ingredient.DTO(
        name: "Frost Salts",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyConjuration.name])
    static let garlic = Ingredient.DTO(
        name: "Garlic",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.regenerateHealth.name])
    static let giantLichen = Ingredient.DTO(
        name: "Giant Lichen",
        effects: [
            DefaultEffects.ravageHealth.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.restoreMagicka.name])
    static let giantsToe = Ingredient.DTO(
        name: "Giant's Toe",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageStaminaRegen.name])
    static let gleamblossom = Ingredient.DTO(
        name: "Gleamblossom",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.fear.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.paralysis.name])
    static let glowDust = Ingredient.DTO(
        name: "Glow Dust",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.resistShock.name])
    static let glowingMushroom = Ingredient.DTO(
        name: "Glowing Mushroom",
        effects: [
            DefaultEffects.resistShock.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.fortifySmithing.name,
            DefaultEffects.fortifyHealth.name])
    static let grassPod = Ingredient.DTO(
        name: "Grass Pod",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyAlteration.name,
            DefaultEffects.restoreMagicka.name])
    static let hagravenClaw = Ingredient.DTO(
        name: "Hagraven Claw",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.fortifyBarter.name])
    static let hagravenFeathers = Ingredient.DTO(
        name: "Hagraven Feathers",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.weaknessToShock.name])
    static let hangingMoss = Ingredient.DTO(
        name: "Hanging Moss",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.fortifyOneHanded.name])
    static let hawkBeak = Ingredient.DTO(
        name: "Hawk Beak",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.resistShock.name])
    static let hawkFeathers = Ingredient.DTO(
        //id: 53.name,
        name: "Hawk Feathers",
        effects: [
            DefaultEffects.cureDisease.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.fortifySneak.name])
    static let hawksEgg = Ingredient.DTO(
        //id: 54.name,
        name: "Hawk's Egg",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.lingeringDamageStamina.name])
    static let histcarp = Ingredient.DTO(
        name: "Histcarp",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.waterbreathing.name])
    static let honeycomb = Ingredient.DTO(
        name: "Honeycomb",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.ravageStamina.name])
    static let humanFlesh = Ingredient.DTO(
        name: "Human Flesh",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifySneak.name])
    static let humanHeart = Ingredient.DTO(
        name: "Human Heart",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.frenzy.name])
    static let iceWraithTeeth = Ingredient.DTO(
        name: "Ice Wraith Teeth",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.weaknessToFire.name])
    static let impStool = Ingredient.DTO(
        name: "Imp Stool",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.restoreHealth.name])
    static let jarrinRoot = Ingredient.DTO(
        name: "Jarrin Root",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.damageMagickaRegen.name])
    static let jazbayGrapes = Ingredient.DTO(
        name: "Jazbay Grapes",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.ravageHealth.name])
    static let juniperBerries = Ingredient.DTO(
        name: "Juniper Berries",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.fortifyMarksman.name,
            DefaultEffects.damageStaminaRegen.name])
    static let largeAntlers = Ingredient.DTO(
        name: "Large Antlers",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.slow.name,
            DefaultEffects.damageStaminaRegen.name])
    static let lavender = Ingredient.DTO(
        name: "Lavender",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyConjuration.name])
    static let lunaMothWing = Ingredient.DTO(
        name: "Luna Moth Wing",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.invisibility.name])
    static let moonSugar = Ingredient.DTO(
        name: "Moon Sugar",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.regenerateMagicka.name])
    static let moraTapinella = Ingredient.DTO(
        name: "Mora Tapinella",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.regenerateStamina.name,
            DefaultEffects.fortifyIllusion.name])
    static let mudcrabChitin = Ingredient.DTO(
        name: "Mudcrab Chitin",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.cureDisease.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.resistFire.name])
    static let namirasRot = Ingredient.DTO(
        name: "Namira's Rot",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.fear.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.regenerateHealth.name])
    static let netchJelly = Ingredient.DTO(
        name: "Netch Jelly",
        effects: [
            DefaultEffects.paralysis.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fear.name])
    static let nightshade = Ingredient.DTO(
        name: "Nightshade",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.lingeringDamageStamina.name,
            DefaultEffects.fortifyDestruction.name])
    static let nirnroot = Ingredient.DTO(
        name: "Nirnroot",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.resistMagic.name])
    static let nordicBarnacle = Ingredient.DTO(
        name: "Nordic Barnacle",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.fortifyPickpocket.name])
    static let orangeDartwing = Ingredient.DTO(
        name: "Orange Dartwing",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyPickpocket.name,
            DefaultEffects.lingeringDamageHealth.name])
    static let pearl = Ingredient.DTO(
        name: "Pearl",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.resistShock.name])
    static let pineThrushEgg = Ingredient.DTO(
        name: "Pine Thrush Egg",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.resistShock.name])
    static let poisonBloom = Ingredient.DTO(
        name: "Poison Bloom",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.slow.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.fear.name])
    static let powderedMammothTusk = Ingredient.DTO(
        name: "Powdered Mammoth Tusk",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.fear.name])
    static let purpleMountainFlower = Ingredient.DTO(
        name: "Purple Mountain Flower",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.resistFrost.name])
    static let redMountainFlower = Ingredient.DTO(
        name: "Red Mountain Flower",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.damageHealth.name])
    static let riverBetty = Ingredient.DTO(
        name: "River Betty",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyAlteration.name,
            DefaultEffects.slow.name,
            DefaultEffects.fortifyCarryWeight.name])
    static let rockWarblerEgg = Ingredient.DTO(
        name: "Rock Warbler Egg",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.weaknessToMagic.name])
    static let sabreCatTooth = Ingredient.DTO(
        name: "Sabre Cat Tooth",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.fortifySmithing.name,
            DefaultEffects.weaknessToPoison.name])
    static let salmonRoe = Ingredient.DTO(
        name: "Salmon Roe",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.regenerateMagicka.name])
    static let saltPile = Ingredient.DTO(
        name: "Salt Pile",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.slow.name,
            DefaultEffects.regenerateMagicka.name])
    static let scalyPholiota = Ingredient.DTO(
        name: "Scaly Pholiota",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.regenerateStamina.name,
            DefaultEffects.fortifyCarryWeight.name])
    static let scathecraw = Ingredient.DTO(
        name: "Scathecraw",
        effects: [
            DefaultEffects.ravageHealth.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.lingeringDamageHealth.name])
    static let silversidePerch = Ingredient.DTO(
        name: "Silverside Perch",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.ravageHealth.name,
            DefaultEffects.resistFrost.name])
    static let skeeverTail = Ingredient.DTO(
        name: "Skeever Tail",
        effects: [
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.ravageHealth.name,
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyLightArmor.name])
    static let slaughterfishEgg = Ingredient.DTO(
        name: "Slaughterfish Egg",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyPickpocket.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.fortifyStamina.name])
    static let slaughterfishScales = Ingredient.DTO(
        name: "Slaughterfish Scales",
        effects: [
            DefaultEffects.resistFrost.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.fortifyBlock.name])
    static let smallAntlers = Ingredient.DTO(
        name: "Small Antlers",
        effects: [
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.lingeringDamageStamina.name,
            DefaultEffects.damageHealth.name])
    static let smallPearl = Ingredient.DTO(
        name: "Small Pearl",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.resistFrost.name])
    static let snowberries = Ingredient.DTO(
        name: "Snowberries",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.resistShock.name])
    static let spawnAsh = Ingredient.DTO(
        name: "Spawn Ash",
        effects: [
            DefaultEffects.ravageStamina.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.ravageMagicka.name])
    static let spiderEgg = Ingredient.DTO(
        name: "Spider Egg",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.fortifyMarksman.name])
    static let sprigganSap = Ingredient.DTO(
        name: "Spriggan Sap",
        effects: [
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.fortifySmithing.name,
            DefaultEffects.fortifyAlteration.name])
    static let swampFungalPod = Ingredient.DTO(
        name: "Swamp Fungal Pod",
        effects: [
            DefaultEffects.resistShock.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.restoreHealth.name])
    static let taproot = Ingredient.DTO(
        name: "Taproot",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.restoreMagicka.name])
    static let thistleBranch = Ingredient.DTO(
        name: "Thistle Branch",
        effects: [
            DefaultEffects.resistFrost.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyHeavyArmor.name])
    static let torchbugThorax = Ingredient.DTO(
        name: "Torchbug Thorax",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyStamina.name])
    static let tramaRoot = Ingredient.DTO(
        name: "Trama Root",
        effects: [
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.slow.name])
    static let trollFat = Ingredient.DTO(
        name: "Troll Fat",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyTwoHanded.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.damageHealth.name])
    static let tundraCotton = Ingredient.DTO(
        name: "Tundra Cotton",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.fortifyBarter.name])
    static let vampireDust = Ingredient.DTO(
        name: "Vampire Dust",
        effects: [
            DefaultEffects.invisibility.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.restoreMagicka.name, DefaultEffects.cureDisease.name])
    static let voidSalts = Ingredient.DTO(
        name: "Void Salts",
        effects: [
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.resistMagic.name,
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyMagicka.name])
    static let wheat = Ingredient.DTO(
        name: "Wheat",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.lingeringDamageMagicka.name])
    static let whiteCap = Ingredient.DTO(
        name: "White Cap",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.ravageMagicka.name])
    static let wispWrappings = Ingredient.DTO(
        name: "Wisp Wrappings",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.resistMagic.name])
    static let yellowMountainFlower = Ingredient.DTO(
        name: "Yellow Mountain Flower",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageStaminaRegen.name])
    
    static let all: [Ingredient.DTO] = [
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
