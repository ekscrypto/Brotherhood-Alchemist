//
//  DefaultIngredients.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

struct DefaultIngredients {
    static let abeceanLongfin = Ingredient.ExportDTO(
        name: "Abecean Longfin",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.fortifyRestoration.name])
    static let ancestorMothWing = Ingredient.ExportDTO(
        name: "Ancestor Moth Wing",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyEnchanting.name])
    static let ashCreepCluster = Ingredient.ExportDTO(
        name: "Ash Creep Cluster",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyDestruction.name])
    static let ashHopperJelly = Ingredient.ExportDTO(
        name: "Ash Hopper Jelly",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.resistShock.name,
            DefaultEffects.weaknessToFrost.name])
    static let ashenGrassPod = Ingredient.ExportDTO(
        name: "Ashen Grass Pod",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.fortifySneak.name])
    static let bearClaws = Ingredient.ExportDTO(
        name: "Bear Claws",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.damageMagickaRegen.name])
    static let bee = Ingredient.ExportDTO(
        name: "Bee",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.regenerateStamina.name,
            DefaultEffects.weaknessToShock.name])
    static let beehiveHusk = Ingredient.ExportDTO(
        name: "Beehive Husk",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.fortifyDestruction.name])
    static let beritsAshes = Ingredient.ExportDTO(
        name: "Berit's Ashes",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.ravageStamina.name])
    static let bleedingCrown = Ingredient.ExportDTO(
        name: "Bleeding Crown",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.resistMagic.name])
    static let blisterwort = Ingredient.ExportDTO(
        name: "Blisterwort",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.restoreHealth.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.fortifySmithing.name])
    static let blueButterflyWing = Ingredient.ExportDTO(
        name: "Blue Butterfly Wing",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.fortifyEnchanting.name])
    static let blueDartwing = Ingredient.ExportDTO(
        name: "Blue Dartwing",
        effects: [
            DefaultEffects.resistShock.name,
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyPickpocket.name,
            DefaultEffects.fear.name])
    static let blueMountainFlower = Ingredient.ExportDTO(
        name: "Blue Mountain Flower",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageMagickaRegen.name])
    static let boarTusk = Ingredient.ExportDTO(
        name: "Boar Tusk",
        effects: [
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.frenzy.name])
    static let boneMeal = Ingredient.ExportDTO(
        name: "Bone Meal",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.ravageStamina.name])
    static let briarHeart = Ingredient.ExportDTO(
        name: "Briar Heart",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.fortifyMagicka.name])
    static let burntSprigganWood = Ingredient.ExportDTO(
        name: "Burnt Spriggan Wood",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.fortifyAlteration.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.slow.name])
    static let butterflyWing = Ingredient.ExportDTO(
        name: "Butterfly Wing",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.lingeringDamageStamina.name,
            DefaultEffects.fortifyBarter.name,
            DefaultEffects.damageMagicka.name])
    static let canisRoot = Ingredient.ExportDTO(
        name: "Canis Root",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyMarksman.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.paralysis.name])
    static let charredSkeeverHide = Ingredient.ExportDTO(
        name: "Charred Skeever Hide",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.cureDisease.name,
            DefaultEffects.restoreHealth.name])
    static let chaurusEggs = Ingredient.ExportDTO(
        name: "Chaurus Eggs",
        effects: [
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.invisibility.name])
    static let chaurusHunterAntennae = Ingredient.ExportDTO(
        name: "Chaurus Hunter Antennae",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyEnchanting.name])
    static let chickensEgg = Ingredient.ExportDTO(
        name: "Chicken's Egg",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.lingeringDamageStamina.name])
    static let creepCluster = Ingredient.ExportDTO(
        name: "Creep Cluster",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.weaknessToMagic.name])
    static let crimsonNirnroot = Ingredient.ExportDTO(
        name: "Crimson Nirnroot",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.resistMagic.name])
    static let cyrodilicSpadetail = Ingredient.ExportDTO(
        name: "Cyrodilic Spadetail",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fear.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.ravageHealth.name])
    static let daedraHeart = Ingredient.ExportDTO(
        name: "Daedra Heart",
        effects: [
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fear.name])
    static let deathbell = Ingredient.ExportDTO(
        name: "Deathbell",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.slow.name,
            DefaultEffects.weaknessToPoison.name])
    static let dragonsTongue = Ingredient.ExportDTO(
        name: "Dragon's Tongue",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyBarter.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.fortifyTwoHanded.name])
    static let dwarvenOil = Ingredient.ExportDTO(
        name: "Dwarven Oil",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.restoreMagicka.name])
    static let ectoplasm = Ingredient.ExportDTO(
        name: "Ectoplasm",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.damageHealth.name])
    static let elvesEar = Ingredient.ExportDTO(
        name: "Elves Ear",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifyMarksman.name,
            DefaultEffects.resistFire.name])
    static let emperorParasolMoss = Ingredient.ExportDTO(
        name: "Emperor Parasol Moss",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.fortifyTwoHanded.name])
    static let eyeOfSabreCat = Ingredient.ExportDTO(
        name: "Eye Of Sabre Cat",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.ravageHealth.name,
            DefaultEffects.restoreHealth.name])
    static let falmerEar = Ingredient.ExportDTO(
        name: "Falmer Ear",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyLockpicking.name])
    static let felsaadTernFeathers = Ingredient.ExportDTO(
        name: "Felsaad Tern Feathers",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.cureDisease.name,
            DefaultEffects.resistMagic.name])
    static let fireSalts = Ingredient.ExportDTO(
        name: "Fire Salts",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.regenerateMagicka.name])
    static let flyAmanita = Ingredient.ExportDTO(
        name: "Fly Amanita",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.fortifyTwoHanded.name,
            DefaultEffects.regenerateStamina.name])
    static let frostMirriam = Ingredient.ExportDTO(
        name: "Frost Mirriam",
        effects: [
            DefaultEffects.resistFrost.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.damageStaminaRegen.name])
    static let frostSalts = Ingredient.ExportDTO(
        name: "Frost Salts",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyConjuration.name])
    static let garlic = Ingredient.ExportDTO(
        name: "Garlic",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.regenerateHealth.name])
    static let giantLichen = Ingredient.ExportDTO(
        name: "Giant Lichen",
        effects: [
            DefaultEffects.ravageHealth.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.restoreMagicka.name])
    static let giantsToe = Ingredient.ExportDTO(
        name: "Giant's Toe",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageStaminaRegen.name])
    static let gleamblossom = Ingredient.ExportDTO(
        name: "Gleamblossom",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.fear.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.paralysis.name])
    static let glowDust = Ingredient.ExportDTO(
        name: "Glow Dust",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.resistShock.name])
    static let glowingMushroom = Ingredient.ExportDTO(
        name: "Glowing Mushroom",
        effects: [
            DefaultEffects.resistShock.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.fortifySmithing.name,
            DefaultEffects.fortifyHealth.name])
    static let grassPod = Ingredient.ExportDTO(
        name: "Grass Pod",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyAlteration.name,
            DefaultEffects.restoreMagicka.name])
    static let hagravenClaw = Ingredient.ExportDTO(
        name: "Hagraven Claw",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.fortifyBarter.name])
    static let hagravenFeathers = Ingredient.ExportDTO(
        name: "Hagraven Feathers",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.fortifyConjuration.name,
            DefaultEffects.weaknessToShock.name])
    static let hangingMoss = Ingredient.ExportDTO(
        name: "Hanging Moss",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.fortifyOneHanded.name])
    static let hawkBeak = Ingredient.ExportDTO(
        name: "Hawk Beak",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.resistShock.name])
    static let hawkFeathers = Ingredient.ExportDTO(
        //id: 53.name,
        name: "Hawk Feathers",
        effects: [
            DefaultEffects.cureDisease.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.fortifySneak.name])
    static let hawksEgg = Ingredient.ExportDTO(
        //id: 54.name,
        name: "Hawk's Egg",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.lingeringDamageStamina.name])
    static let histcarp = Ingredient.ExportDTO(
        name: "Histcarp",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.waterbreathing.name])
    static let honeycomb = Ingredient.ExportDTO(
        name: "Honeycomb",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.ravageStamina.name])
    static let humanFlesh = Ingredient.ExportDTO(
        name: "Human Flesh",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifySneak.name])
    static let humanHeart = Ingredient.ExportDTO(
        name: "Human Heart",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.frenzy.name])
    static let iceWraithTeeth = Ingredient.ExportDTO(
        name: "Ice Wraith Teeth",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.weaknessToFire.name])
    static let impStool = Ingredient.ExportDTO(
        name: "Imp Stool",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.restoreHealth.name])
    static let jarrinRoot = Ingredient.ExportDTO(
        name: "Jarrin Root",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.damageMagickaRegen.name])
    static let jazbayGrapes = Ingredient.ExportDTO(
        name: "Jazbay Grapes",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.ravageHealth.name])
    static let juniperBerries = Ingredient.ExportDTO(
        name: "Juniper Berries",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.fortifyMarksman.name,
            DefaultEffects.damageStaminaRegen.name])
    static let largeAntlers = Ingredient.ExportDTO(
        name: "Large Antlers",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.slow.name,
            DefaultEffects.damageStaminaRegen.name])
    static let lavender = Ingredient.ExportDTO(
        name: "Lavender",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.fortifyStamina.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyConjuration.name])
    static let lunaMothWing = Ingredient.ExportDTO(
        name: "Luna Moth Wing",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.fortifyLightArmor.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.invisibility.name])
    static let moonSugar = Ingredient.ExportDTO(
        name: "Moon Sugar",
        effects: [
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.regenerateMagicka.name])
    static let moraTapinella = Ingredient.ExportDTO(
        name: "Mora Tapinella",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.regenerateStamina.name,
            DefaultEffects.fortifyIllusion.name])
    static let mudcrabChitin = Ingredient.ExportDTO(
        name: "Mudcrab Chitin",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.cureDisease.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.resistFire.name])
    static let namirasRot = Ingredient.ExportDTO(
        name: "Namira's Rot",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.fear.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.regenerateHealth.name])
    static let netchJelly = Ingredient.ExportDTO(
        name: "Netch Jelly",
        effects: [
            DefaultEffects.paralysis.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fear.name])
    static let nightshade = Ingredient.ExportDTO(
        name: "Nightshade",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.lingeringDamageStamina.name,
            DefaultEffects.fortifyDestruction.name])
    static let nirnroot = Ingredient.ExportDTO(
        name: "Nirnroot",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.invisibility.name,
            DefaultEffects.resistMagic.name])
    static let nordicBarnacle = Ingredient.ExportDTO(
        name: "Nordic Barnacle",
        effects: [
            DefaultEffects.damageMagicka.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.fortifyPickpocket.name])
    static let orangeDartwing = Ingredient.ExportDTO(
        name: "Orange Dartwing",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyPickpocket.name,
            DefaultEffects.lingeringDamageHealth.name])
    static let pearl = Ingredient.ExportDTO(
        name: "Pearl",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.resistShock.name])
    static let pineThrushEgg = Ingredient.ExportDTO(
        name: "Pine Thrush Egg",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.resistShock.name])
    static let poisonBloom = Ingredient.ExportDTO(
        name: "Poison Bloom",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.slow.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.fear.name])
    static let powderedMammothTusk = Ingredient.ExportDTO(
        name: "Powdered Mammoth Tusk",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.weaknessToFire.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.fear.name])
    static let purpleMountainFlower = Ingredient.ExportDTO(
        name: "Purple Mountain Flower",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifySneak.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.resistFrost.name])
    static let redMountainFlower = Ingredient.ExportDTO(
        name: "Red Mountain Flower",
        effects: [
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.damageHealth.name])
    static let riverBetty = Ingredient.ExportDTO(
        name: "River Betty",
        effects: [
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyAlteration.name,
            DefaultEffects.slow.name,
            DefaultEffects.fortifyCarryWeight.name])
    static let rockWarblerEgg = Ingredient.ExportDTO(
        name: "Rock Warbler Egg",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.damageStamina.name,
            DefaultEffects.weaknessToMagic.name])
    static let sabreCatTooth = Ingredient.ExportDTO(
        name: "Sabre Cat Tooth",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.fortifySmithing.name,
            DefaultEffects.weaknessToPoison.name])
    static let salmonRoe = Ingredient.ExportDTO(
        name: "Salmon Roe",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.waterbreathing.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.regenerateMagicka.name])
    static let saltPile = Ingredient.ExportDTO(
        name: "Salt Pile",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.slow.name,
            DefaultEffects.regenerateMagicka.name])
    static let scalyPholiota = Ingredient.ExportDTO(
        name: "Scaly Pholiota",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.regenerateStamina.name,
            DefaultEffects.fortifyCarryWeight.name])
    static let scathecraw = Ingredient.ExportDTO(
        name: "Scathecraw",
        effects: [
            DefaultEffects.ravageHealth.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.ravageMagicka.name,
            DefaultEffects.lingeringDamageHealth.name])
    static let silversidePerch = Ingredient.ExportDTO(
        name: "Silverside Perch",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.ravageHealth.name,
            DefaultEffects.resistFrost.name])
    static let skeeverTail = Ingredient.ExportDTO(
        name: "Skeever Tail",
        effects: [
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.ravageHealth.name,
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyLightArmor.name])
    static let slaughterfishEgg = Ingredient.ExportDTO(
        name: "Slaughterfish Egg",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyPickpocket.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.fortifyStamina.name])
    static let slaughterfishScales = Ingredient.ExportDTO(
        name: "Slaughterfish Scales",
        effects: [
            DefaultEffects.resistFrost.name,
            DefaultEffects.lingeringDamageHealth.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.fortifyBlock.name])
    static let smallAntlers = Ingredient.ExportDTO(
        name: "Small Antlers",
        effects: [
            DefaultEffects.weaknessToPoison.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.lingeringDamageStamina.name,
            DefaultEffects.damageHealth.name])
    static let smallPearl = Ingredient.ExportDTO(
        name: "Small Pearl",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyOneHanded.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.resistFrost.name])
    static let snowberries = Ingredient.ExportDTO(
        name: "Snowberries",
        effects: [
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.resistFrost.name,
            DefaultEffects.resistShock.name])
    static let spawnAsh = Ingredient.ExportDTO(
        name: "Spawn Ash",
        effects: [
            DefaultEffects.ravageStamina.name,
            DefaultEffects.resistFire.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.ravageMagicka.name])
    static let spiderEgg = Ingredient.ExportDTO(
        name: "Spider Egg",
        effects: [
            DefaultEffects.damageStamina.name,
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyLockpicking.name,
            DefaultEffects.fortifyMarksman.name])
    static let sprigganSap = Ingredient.ExportDTO(
        name: "Spriggan Sap",
        effects: [
            DefaultEffects.damageMagickaRegen.name,
            DefaultEffects.fortifyEnchanting.name,
            DefaultEffects.fortifySmithing.name,
            DefaultEffects.fortifyAlteration.name])
    static let swampFungalPod = Ingredient.ExportDTO(
        name: "Swamp Fungal Pod",
        effects: [
            DefaultEffects.resistShock.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.paralysis.name,
            DefaultEffects.restoreHealth.name])
    static let taproot = Ingredient.ExportDTO(
        name: "Taproot",
        effects: [
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyIllusion.name,
            DefaultEffects.regenerateMagicka.name,
            DefaultEffects.restoreMagicka.name])
    static let thistleBranch = Ingredient.ExportDTO(
        name: "Thistle Branch",
        effects: [
            DefaultEffects.resistFrost.name,
            DefaultEffects.ravageStamina.name,
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyHeavyArmor.name])
    static let torchbugThorax = Ingredient.ExportDTO(
        name: "Torchbug Thorax",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.lingeringDamageMagicka.name,
            DefaultEffects.weaknessToMagic.name,
            DefaultEffects.fortifyStamina.name])
    static let tramaRoot = Ingredient.ExportDTO(
        name: "Trama Root",
        effects: [
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.damageMagicka.name,
            DefaultEffects.slow.name])
    static let trollFat = Ingredient.ExportDTO(
        name: "Troll Fat",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyTwoHanded.name,
            DefaultEffects.frenzy.name,
            DefaultEffects.damageHealth.name])
    static let tundraCotton = Ingredient.ExportDTO(
        name: "Tundra Cotton",
        effects: [
            DefaultEffects.resistMagic.name,
            DefaultEffects.fortifyMagicka.name,
            DefaultEffects.fortifyBlock.name,
            DefaultEffects.fortifyBarter.name])
    static let vampireDust = Ingredient.ExportDTO(
        name: "Vampire Dust",
        effects: [
            DefaultEffects.invisibility.name,
            DefaultEffects.regenerateHealth.name,
            DefaultEffects.restoreMagicka.name, DefaultEffects.cureDisease.name])
    static let voidSalts = Ingredient.ExportDTO(
        name: "Void Salts",
        effects: [
            DefaultEffects.weaknessToShock.name,
            DefaultEffects.resistMagic.name,
            DefaultEffects.damageHealth.name,
            DefaultEffects.fortifyMagicka.name])
    static let wheat = Ingredient.ExportDTO(
        name: "Wheat",
        effects: [
            DefaultEffects.restoreHealth.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageStaminaRegen.name,
            DefaultEffects.lingeringDamageMagicka.name])
    static let whiteCap = Ingredient.ExportDTO(
        name: "White Cap",
        effects: [
            DefaultEffects.weaknessToFrost.name,
            DefaultEffects.fortifyHeavyArmor.name,
            DefaultEffects.restoreMagicka.name,
            DefaultEffects.ravageMagicka.name])
    static let wispWrappings = Ingredient.ExportDTO(
        name: "Wisp Wrappings",
        effects: [
            DefaultEffects.restoreStamina.name,
            DefaultEffects.fortifyDestruction.name,
            DefaultEffects.fortifyCarryWeight.name,
            DefaultEffects.resistMagic.name])
    static let yellowMountainFlower = Ingredient.ExportDTO(
        name: "Yellow Mountain Flower",
        effects: [
            DefaultEffects.resistPoison.name,
            DefaultEffects.fortifyRestoration.name,
            DefaultEffects.fortifyHealth.name,
            DefaultEffects.damageStaminaRegen.name])
    
    static let all: [Ingredient.ExportDTO] = [
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
