//
//  DefaultIngredients.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

enum DefaultIngredients {
    static let all: [Ingredient] = [
        Ingredient(
            id: 1,
            name: "Abecean Longfin",
            effects: DefaultEffectId.values([
                .weaknessToFrost,
                .fortifySneak,
                .weaknessToPoison,
                .fortifyRestoration]))!,
        Ingredient(
            id: 2,
            name: "Ancestor Moth Wing",
            effects: DefaultEffectId.values([
                .damageStamina,
                .fortifyConjuration,
                .damageMagickaRegen,
                .fortifyEnchanting]))!,
        Ingredient(
            id: 3,
            name: "Ash Creep Cluster",
            effects: DefaultEffectId.values([
                .damageStamina,
                .invisibility,
                .resistFire,
                .fortifyDestruction]))!,
        Ingredient(
            id: 4,
            name: "Ash Hopper Jelly",
            effects: DefaultEffectId.values([
                .restoreHealth,
                .fortifyLightArmor,
                .resistShock,
                .weaknessToFrost]))!,
        Ingredient(
            id: 5,
            name: "Ashen Grass Pod",
            effects: DefaultEffectId.values([
                .resistFire,
                .weaknessToShock,
                .fortifyLockpicking,
                .fortifySneak]))!,
        Ingredient(
            id: 6,
            name: "Bear Claws",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyHealth,
                .fortifyOneHanded,
                .damageMagickaRegen]))!,
        Ingredient(
            id: 7,
            name: "Bee",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .ravageStamina,
                .regenerateStamina,
                .weaknessToShock]))!,
        Ingredient(
            id: 8,
            name: "Beehive Husk",
            effects: DefaultEffectId.values([
                .resistPoison,
                .fortifyLightArmor,
                .fortifySneak,
                .fortifyDestruction]))!,
        Ingredient(
            id: 9,
            name: "Berit's Ashes",
            effects: DefaultEffectId.values([
                .damageStamina,
                .fortifyConjuration,
                .resistFire,
                .ravageStamina]))!,
        Ingredient(
            id: 10,
            name: "Bleeding Crown",
            effects: DefaultEffectId.values([
                .weaknessToFire,
                .fortifyBlock,
                .weaknessToPoison,
                .resistMagic]))!,
        Ingredient(
            id: 11,
            name: "Blisterwort",
            effects: DefaultEffectId.values([
                .damageStamina,
                .restoreHealth,
                .frenzy,
                .fortifySmithing]))!,
        Ingredient(
            id: 12,
            name: "Blue Butterfly Wing",
            effects: DefaultEffectId.values([
                .damageStamina,
                .damageMagickaRegen,
                .fortifyConjuration,
                .fortifyEnchanting]))!,
        Ingredient(
            id: 13,
            name: "Blue Dartwing",
            effects: DefaultEffectId.values([
                .resistShock,
                .restoreHealth,
                .fortifyPickpocket,
                .fear]))!,
        Ingredient(
            id: 14,
            name: "Blue Mountain Flower",
            effects: DefaultEffectId.values([
                .restoreHealth,
                .fortifyConjuration,
                .fortifyHealth,
                .damageMagickaRegen]))!,
        Ingredient(
            id: 15,
            name: "Boar Tusk",
            effects: DefaultEffectId.values([
                .fortifyStamina,
                .fortifyHealth,
                .fortifyBlock,
                .frenzy]))!,
        Ingredient(
            id: 16,
            name: "Bone Meal",
            effects: DefaultEffectId.values([
                .damageStamina,
                .fortifyConjuration,
                .resistFire,
                .ravageStamina]))!,
        Ingredient(
            id: 17,
            name: "Briar Heart",
            effects: DefaultEffectId.values([
                .restoreMagicka,
                .fortifyBlock,
                .paralysis,
                .fortifyMagicka]))!,
        Ingredient(
            id: 18,
            name: "Burnt Spriggan Wood",
            effects: DefaultEffectId.values([
                .weaknessToFire,
                .fortifyAlteration,
                .damageMagickaRegen,
                .slow]))!,
        Ingredient(
            id: 19,
            name: "Butterfly Wing",
            effects: DefaultEffectId.values([
                .restoreHealth,
                .lingeringDamageStamina,
                .fortifyBarter,
                .damageMagicka]))!,
        Ingredient(
            id: 20,
            name: "Canis Root",
            effects: DefaultEffectId.values([
                .damageStamina,
                .fortifyMarksman,
                .fortifyOneHanded,
                .paralysis]))!,
        Ingredient(
            id: 21,
            name: "Charred Skeever Hide",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .resistPoison,
                .cureDisease,
                .restoreHealth]))!,
        Ingredient(
            id: 22,
            name: "Chaurus Eggs",
            effects: DefaultEffectId.values([
                .weaknessToPoison,
                .fortifyStamina,
                .damageMagicka,
                .invisibility]))!,
        Ingredient(
            id: 23,
            name: "Chaurus Hunter Antennae",
            effects: DefaultEffectId.values([
                .damageStamina,
                .fortifyConjuration,
                .damageMagickaRegen,
                .fortifyEnchanting]))!,
        Ingredient(
            id: 24,
            name: "Chicken's Egg",
            effects: DefaultEffectId.values([
                .resistMagic,
                .waterbreathing,
                .damageMagickaRegen,
                .lingeringDamageStamina]))!,
        Ingredient(
            id: 25,
            name: "Creep Cluster",
            effects: DefaultEffectId.values([
                .restoreMagicka,
                .fortifyCarryWeight,
                .damageStaminaRegen,
                .weaknessToMagic]))!,
        Ingredient(
            id: 26,
            name: "Crimson Nirnroot",
            effects: DefaultEffectId.values([
                .damageHealth,
                .invisibility,
                .damageStamina,
                .resistMagic]))!,
        Ingredient(
            id: 27,
            name: "Cyrodilic Spadetail",
            effects: DefaultEffectId.values([
                .damageStamina,
                .fear,
                .fortifyRestoration,
                .ravageHealth]))!,
        Ingredient(
            id: 28,
            name: "Daedra Heart",
            effects: DefaultEffectId.values([
                .damageStaminaRegen,
                .damageMagicka,
                .restoreHealth,
                .fear]))!,
        Ingredient(
            id: 29,
            name: "Deathbell",
            effects: DefaultEffectId.values([
                .damageHealth,
                .ravageStamina,
                .slow,
                .weaknessToPoison]))!,
        Ingredient(
            id: 30,
            name: "Dragon's Tongue",
            effects: DefaultEffectId.values([
                .resistFire,
                .fortifyBarter,
                .fortifyIllusion,
                .fortifyTwoHanded]))!,
        Ingredient(
            id: 31,
            name: "Dwarven Oil",
            effects: DefaultEffectId.values([
                .weaknessToMagic,
                .regenerateMagicka,
                .fortifyIllusion,
                .restoreMagicka]))!,
        Ingredient(
            id: 32,
            name: "Ectoplasm",
            effects: DefaultEffectId.values([
                .restoreMagicka,
                .fortifyDestruction,
                .fortifyMagicka,
                .damageHealth]))!,
        Ingredient(
            id: 33,
            name: "Elves Ear",
            effects: DefaultEffectId.values([
                .restoreMagicka,
                .weaknessToFrost,
                .fortifyMarksman,
                .resistFire]))!,
        Ingredient(
            id: 34,
            name: "Emperor Parasol Moss",
            effects: DefaultEffectId.values([
                .damageHealth,
                .fortifyMagicka,
                .regenerateHealth,
                .fortifyTwoHanded]))!,
        Ingredient(
            id: 35,
            name: "Eye Of Sabre Cat",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .damageMagicka,
                .ravageHealth,
                .restoreHealth]))!,
        Ingredient(
            id: 36,
            name: "Falmer Ear",
            effects: DefaultEffectId.values([
                .damageHealth,
                .frenzy,
                .resistPoison,
                .fortifyLockpicking]))!,
        Ingredient(
            id: 37,
            name: "Felsaad Tern Feathers",
            effects: DefaultEffectId.values([
                .restoreHealth,
                .fortifyLightArmor,
                .cureDisease,
                .resistMagic]))!,
        Ingredient(
            id: 38,
            name: "Fire Salts",
            effects: DefaultEffectId.values([
                .weaknessToFrost,
                .restoreMagicka,
                .resistFire,
                .regenerateMagicka]))!,
        Ingredient(
            id: 39,
            name: "Fly Amanita",
            effects: DefaultEffectId.values([
                .resistFire,
                .frenzy,
                .fortifyTwoHanded,
                .regenerateStamina]))!,
        Ingredient(
            id: 40,
            name: "Frost Mirriam",
            effects: DefaultEffectId.values([
                .resistFrost,
                .fortifySneak,
                .ravageMagicka,
                .damageStaminaRegen]))!,
        Ingredient(
            id: 41,
            name: "Frost Salts",
            effects: DefaultEffectId.values([
                .weaknessToFire,
                .resistFrost,
                .restoreMagicka,
                .fortifyConjuration]))!,
        Ingredient(
            id: 42,
            name: "Garlic",
            effects: DefaultEffectId.values([
                .resistPoison,
                .fortifyStamina,
                .regenerateMagicka,
                .regenerateHealth]))!,
        Ingredient(
            id: 43,
            name: "Giant Lichen",
            effects: DefaultEffectId.values([
                .ravageHealth,
                .weaknessToPoison,
                .weaknessToShock,
                .restoreMagicka]))!,
        Ingredient(
            id: 44,
            name: "Giant's Toe",
            effects: DefaultEffectId.values([
                .damageStamina,
                .fortifyCarryWeight,
                .fortifyHealth,
                .damageStaminaRegen]))!,
        Ingredient(
            id: 45,
            name: "Gleamblossom",
            effects: DefaultEffectId.values([
                .resistMagic,
                .fear,
                .regenerateHealth,
                .paralysis]))!,
        Ingredient(
            id: 46,
            name: "Glow Dust",
            effects: DefaultEffectId.values([
                .damageMagicka,
                .fortifyDestruction,
                .damageMagickaRegen,
                .resistShock]))!,
        Ingredient(
            id: 47,
            name: "Glowing Mushroom",
            effects: DefaultEffectId.values([
                .resistShock,
                .fortifyDestruction,
                .fortifySmithing,
                .fortifyHealth]))!,
        Ingredient(
            id: 48,
            name: "Grass Pod",
            effects: DefaultEffectId.values([
                .resistPoison,
                .ravageMagicka,
                .fortifyAlteration,
                .restoreMagicka]))!,
        Ingredient(
            id: 49,
            name: "Hagraven Claw",
            effects: DefaultEffectId.values([
                .resistMagic,
                .lingeringDamageMagicka,
                .fortifyEnchanting,
                .fortifyBarter]))!,
        Ingredient(
            id: 50,
            name: "Hagraven Feathers",
            effects: DefaultEffectId.values([
                .damageMagicka,
                .frenzy,
                .fortifyConjuration,
                .weaknessToShock]))!,
        Ingredient(
            id: 51,
            name: "Hanging Moss",
            effects: DefaultEffectId.values([
                .damageMagicka,
                .damageMagickaRegen,
                .fortifyHealth,
                .fortifyOneHanded]))!,
        Ingredient(
            id: 52,
            name: "Hawk Beak",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .resistFrost,
                .fortifyCarryWeight,
                .resistShock]))!,
        Ingredient(
            id: 53,
            name: "Hawk Feathers",
            effects: DefaultEffectId.values([
                .cureDisease,
                .fortifyLightArmor,
                .fortifyOneHanded,
                .fortifySneak]))!,
        Ingredient(
            id: 54,
            name: "Hawk's Egg",
            effects: DefaultEffectId.values([
                .resistMagic,
                .damageMagickaRegen,
                .waterbreathing,
                .lingeringDamageStamina]))!,
        Ingredient(
            id: 55,
            name: "Histcarp",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyMagicka,
                .damageStaminaRegen,
                .waterbreathing]))!,
        Ingredient(
            id: 56,
            name: "Honeycomb",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyBlock,
                .fortifyLightArmor,
                .ravageStamina]))!,
        Ingredient(
            id: 57,
            name: "Human Flesh",
            effects: DefaultEffectId.values([
                .damageHealth,
                .paralysis,
                .restoreMagicka,
                .fortifySneak]))!,
        Ingredient(
            id: 58,
            name: "Human Heart",
            effects: DefaultEffectId.values([
                .damageHealth,
                .damageMagickaRegen,
                .damageMagicka,
                .frenzy]))!,
        Ingredient(
            id: 59,
            name: "Ice Wraith Teeth",
            effects: DefaultEffectId.values([
                .weaknessToFrost,
                .fortifyHeavyArmor,
                .invisibility,
                .weaknessToFire]))!,
        Ingredient(
            id: 60,
            name: "Imp Stool",
            effects: DefaultEffectId.values([
                .damageHealth,
                .paralysis,
                .lingeringDamageHealth,
                .restoreHealth]))!,
        Ingredient(
            id: 61,
            name: "Jarrin Root",
            effects: DefaultEffectId.values([
                .damageHealth,
                .damageStamina,
                .damageMagicka,
                .damageMagickaRegen]))!,
        Ingredient(
            id: 62,
            name: "Jazbay Grapes",
            effects: DefaultEffectId.values([
                .weaknessToMagic,
                .fortifyMagicka,
                .regenerateMagicka,
                .ravageHealth]))!,
        Ingredient(
            id: 63,
            name: "Juniper Berries",
            effects: DefaultEffectId.values([
                .weaknessToFire,
                .regenerateHealth,
                .fortifyMarksman,
                .damageStaminaRegen]))!,
        Ingredient(
            id: 64,
            name: "Large Antlers",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyStamina,
                .slow,
                .damageStaminaRegen]))!,
        Ingredient(
            id: 65,
            name: "Lavender",
            effects: DefaultEffectId.values([
                .resistMagic,
                .fortifyStamina,
                .ravageMagicka,
                .fortifyConjuration]))!,
        Ingredient(
            id: 66,
            name: "Luna Moth Wing",
            effects: DefaultEffectId.values([
                .damageMagicka,
                .fortifyLightArmor,
                .regenerateHealth,
                .invisibility]))!,
        Ingredient(
            id: 67,
            name: "Moon Sugar",
            effects: DefaultEffectId.values([
                .weaknessToFire,
                .resistFrost,
                .restoreMagicka,
                .regenerateMagicka]))!,
        Ingredient(
            id: 68,
            name: "Mora Tapinella",
            effects: DefaultEffectId.values([
                .restoreMagicka,
                .lingeringDamageHealth,
                .regenerateStamina,
                .fortifyIllusion]))!,
        Ingredient(
            id: 69,
            name: "Mudcrab Chitin",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .cureDisease,
                .resistPoison,
                .resistFire]))!,
        Ingredient(
            id: 70,
            name: "Namira's Rot",
            effects: DefaultEffectId.values([
                .damageMagicka,
                .fear,
                .fortifyLockpicking,
                .regenerateHealth]))!,
        Ingredient(
            id: 71,
            name: "Netch Jelly",
            effects: DefaultEffectId.values([
                .paralysis,
                .fortifyCarryWeight,
                .restoreStamina,
                .fear]))!,
        Ingredient(
            id: 72,
            name: "Nightshade",
            effects: DefaultEffectId.values([
                .damageHealth,
                .damageMagickaRegen,
                .lingeringDamageStamina,
                .fortifyDestruction]))!,
        Ingredient(
            id: 73,
            name: "Nirnroot",
            effects: DefaultEffectId.values([
                .damageHealth,
                .damageStamina,
                .invisibility,
                .resistMagic]))!,
        Ingredient(
            id: 74,
            name: "Nordic Barnacle",
            effects: DefaultEffectId.values([
                .damageMagicka,
                .waterbreathing,
                .regenerateHealth,
                .fortifyPickpocket]))!,
        Ingredient(
            id: 75,
            name: "Orange Dartwing",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .ravageMagicka,
                .fortifyPickpocket,
                .lingeringDamageHealth]))!,
        Ingredient(
            id: 76,
            name: "Pearl",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .restoreMagicka,
                .fortifyBlock,
                .resistShock]))!,
        Ingredient(
            id: 77,
            name: "Pine Thrush Egg",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyLockpicking,
                .weaknessToPoison,
                .resistShock]))!,
        Ingredient(
            id: 78,
            name: "Poison Bloom",
            effects: DefaultEffectId.values([
                .damageHealth,
                .slow,
                .fortifyCarryWeight,
                .fear]))!,
        Ingredient(
            id: 79,
            name: "Powdered Mammoth Tusk",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .weaknessToFire,
                .fortifySneak,
                .fear]))!,
        Ingredient(
            id: 80,
            name: "Purple Mountain Flower",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifySneak,
                .lingeringDamageMagicka,
                .resistFrost]))!,
        Ingredient(
            id: 81,
            name: "Red Mountain Flower",
            effects: DefaultEffectId.values([
                .restoreMagicka,
                .ravageMagicka,
                .fortifyMagicka,
                .damageHealth]))!,
        Ingredient(
            id: 82,
            name: "River Betty",
            effects: DefaultEffectId.values([
                .damageHealth,
                .fortifyAlteration,
                .slow,
                .fortifyCarryWeight]))!,
        Ingredient(
            id: 83,
            name: "Rock Warbler Egg",
            effects: DefaultEffectId.values([
                .restoreHealth,
                .fortifyOneHanded,
                .damageStamina,
                .weaknessToMagic]))!,
        Ingredient(
            id: 84,
            name: "Sabre Cat Tooth",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyHeavyArmor,
                .fortifySmithing,
                .weaknessToPoison]))!,
        Ingredient(
            id: 85,
            name: "Salmon Roe",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .waterbreathing,
                .fortifyMagicka,
                .regenerateMagicka]))!,
        Ingredient(
            id: 86,
            name: "Salt Pile",
            effects: DefaultEffectId.values([
                .weaknessToMagic,
                .fortifyRestoration,
                .slow,
                .regenerateMagicka]))!,
        Ingredient(
            id: 87,
            name: "Scaly Pholiota",
            effects: DefaultEffectId.values([
                .weaknessToMagic,
                .fortifyIllusion,
                .regenerateStamina,
                .fortifyCarryWeight]))!,
        Ingredient(
            id: 88,
            name: "Scathecraw",
            effects: DefaultEffectId.values([
                .ravageHealth,
                .ravageStamina,
                .ravageMagicka,
                .lingeringDamageHealth]))!,
        Ingredient(
            id: 89,
            name: "Silverside Perch",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .damageStaminaRegen,
                .ravageHealth,
                .resistFrost]))!,
        Ingredient(
            id: 90,
            name: "Skeever Tail",
            effects: DefaultEffectId.values([
                .damageStaminaRegen,
                .ravageHealth,
                .damageHealth,
                .fortifyLightArmor]))!,
        Ingredient(
            id: 91,
            name: "Slaughterfish Egg",
            effects: DefaultEffectId.values([
                .resistPoison,
                .fortifyPickpocket,
                .lingeringDamageHealth,
                .fortifyStamina]))!,
        Ingredient(
            id: 92,
            name: "Slaughterfish Scales",
            effects: DefaultEffectId.values([
                .resistFrost,
                .lingeringDamageHealth,
                .fortifyHeavyArmor,
                .fortifyBlock]))!,
        Ingredient(
            id: 93,
            name: "Small Antlers",
            effects: DefaultEffectId.values([
                .weaknessToPoison,
                .fortifyRestoration,
                .lingeringDamageStamina,
                .damageHealth]))!,
        Ingredient(
            id: 94,
            name: "Small Pearl",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyOneHanded,
                .fortifyRestoration,
                .resistFrost]))!,
        Ingredient(
            id: 95,
            name: "Snowberries",
            effects: DefaultEffectId.values([
                .resistFire,
                .fortifyEnchanting,
                .resistFrost,
                .resistShock]))!,
        Ingredient(
            id: 96,
            name: "Spawn Ash",
            effects: DefaultEffectId.values([
                .ravageStamina,
                .resistFire,
                .fortifyEnchanting,
                .ravageMagicka]))!,
        Ingredient(
            id: 97,
            name: "Spider Egg",
            effects: DefaultEffectId.values([
                .damageStamina,
                .damageMagickaRegen,
                .fortifyLockpicking,
                .fortifyMarksman]))!,
        Ingredient(
            id: 98,
            name: "Spriggan Sap",
            effects: DefaultEffectId.values([
                .damageMagickaRegen,
                .fortifyEnchanting,
                .fortifySmithing,
                .fortifyAlteration]))!,
        Ingredient(
            id: 99,
            name: "Swamp Fungal Pod",
            effects: DefaultEffectId.values([
                .resistShock,
                .lingeringDamageMagicka,
                .paralysis,
                .restoreHealth]))!,
        Ingredient(
            id: 100,
            name: "Taproot",
            effects: DefaultEffectId.values([
                .weaknessToMagic,
                .fortifyIllusion,
                .regenerateMagicka,
                .restoreMagicka]))!,
        Ingredient(
            id: 101,
            name: "Thistle Branch",
            effects: DefaultEffectId.values([
                .resistFrost,
                .ravageStamina,
                .resistPoison,
                .fortifyHeavyArmor]))!,
        Ingredient(
            id: 102,
            name: "Torchbug Thorax",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .lingeringDamageMagicka,
                .weaknessToMagic,
                .fortifyStamina]))!,
        Ingredient(
            id: 103,
            name: "Trama Root",
            effects: DefaultEffectId.values([
                .weaknessToShock,
                .fortifyCarryWeight,
                .damageMagicka,
                .slow]))!,
        Ingredient(
            id: 104,
            name: "Troll Fat",
            effects: DefaultEffectId.values([
                .resistPoison,
                .fortifyTwoHanded,
                .frenzy,
                .damageHealth]))!,
        Ingredient(
            id: 105,
            name: "Tundra Cotton",
            effects: DefaultEffectId.values([
                .resistMagic,
                .fortifyMagicka,
                .fortifyBlock,
                .fortifyBarter]))!,
        Ingredient(
            id: 106,
            name: "Vampire Dust",
            effects: DefaultEffectId.values([
                .invisibility,
                .regenerateHealth,
                .restoreMagicka, .cureDisease]))!,
        Ingredient(
            id: 107,
            name: "Void Salts",
            effects: DefaultEffectId.values([
                .weaknessToShock,
                .resistMagic,
                .damageHealth,
                .fortifyMagicka]))!,
        Ingredient(
            id: 108,
            name: "Wheat",
            effects: DefaultEffectId.values([
                .restoreHealth,
                .fortifyHealth,
                .damageStaminaRegen,
                .lingeringDamageMagicka]))!,
        Ingredient(
            id: 109,
            name: "White Cap",
            effects: DefaultEffectId.values([
                .weaknessToFrost,
                .fortifyHeavyArmor,
                .restoreMagicka,
                .ravageMagicka]))!,
        Ingredient(
            id: 110,
            name: "Wisp Wrappings",
            effects: DefaultEffectId.values([
                .restoreStamina,
                .fortifyDestruction,
                .fortifyCarryWeight,
                .resistMagic]))!,
        Ingredient(
            id: 111,
            name: "Yellow Mountain Flower",
            effects: DefaultEffectId.values([
                .resistPoison,
                .fortifyRestoration,
                .fortifyHealth,
                .damageStaminaRegen]))!
    ]
}
