//
//  IngredientGenerator.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class IngredientGenerator: NSObject {
    class func execute() {
        var list: [Ingredient] = []
        list.append(Ingredient(.abeceanLongfin, name: NSLocalizedString("Abecean Longfin", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyRestoration]))
        list.append(Ingredient(.ancestorMothWing, name: NSLocalizedString("Ancestor Moth Wing", comment: ""),
                               effects: [.damageStamina, .fortifyConjuration, .damageMagickaRegen, .fortifyEnchanting]))
        list.append(Ingredient(.ashCreepCluster, name: NSLocalizedString("Ash Creep Cluster", comment: ""),
                               effects: [.damageStamina, .invisibility, .resistFire, .fortifyDestruction]))
        list.append(Ingredient(.ashHopperJelly, name: NSLocalizedString("Ash Hopper Jelly", comment: ""),
                               effects: [.restoreHealth, .fortifyLightArmor, .resistShock, .weaknessToFrost]))
        list.append(Ingredient(.ashenGrassPod, name: NSLocalizedString("Ashen Grass Pod", comment: ""),
                               effects: [.resistFire, .weaknessToShock, .fortifyLockpicking, .fortifySneak]))
        list.append(Ingredient(.bearClaws, name: NSLocalizedString("Bear Claws", comment: ""),
                               effects: [.restoreStamina, .fortifyHealth, .fortifyOneHanded, .damageMagickaRegen]))
        list.append(Ingredient(.bee, name: NSLocalizedString("Bee", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.beehiveHusk, name: NSLocalizedString("Beehive Husk", comment: ""),
                               effects: [.resistPoison, .fortifyLightArmor, .fortifySneak, .fortifyDestruction]))
        list.append(Ingredient(.beritsAshes, name: NSLocalizedString("Berit's Ashes", comment: ""),
                               effects: [.damageStamina, .fortifyConjuration, .resistFire, .ravageStamina]))
        list.append(Ingredient(.bleedingCrown, name: NSLocalizedString("Bleeding Crown", comment: ""),
                               effects: [.weaknessToFire, .fortifyBlock, .weaknessToPoison, .resistMagic]))
        list.append(Ingredient(.blisterwort, name: NSLocalizedString("Blisterwort", comment: ""),
                               effects: [.damageStamina, .restoreHealth, .frenzy, .fortifySmithing]))
        list.append(Ingredient(.blueButterflyWing, name: NSLocalizedString("Blue Butterfly Wing", comment: ""),
                               effects: [.damageStamina, .damageMagickaRegen, .fortifyConjuration, .fortifyEnchanting]))
        list.append(Ingredient(.blueDartwing, name: NSLocalizedString("Blue Dartwing", comment: ""),
                               effects: [.resistShock, .restoreHealth, .fortifyPickpocket, .fear]))
        list.append(Ingredient(.blueMountainFlower, name: NSLocalizedString("Blue Mountain Flower", comment: ""),
                               effects: [.restoreHealth, .fortifyConjuration, .fortifyHealth, .damageMagickaRegen]))
        list.append(Ingredient(.boarTusk, name: NSLocalizedString("Boar Tusk", comment: ""),
                               effects: [.fortifyStamina, .fortifyHealth, .fortifyBlock, .frenzy]))
        list.append(Ingredient(.boneMeal, name: NSLocalizedString("Bone Meal", comment: ""),
                               effects: [.damageStamina, .fortifyConjuration, .resistFire, .ravageStamina]))
        list.append(Ingredient(.briarHeart, name: NSLocalizedString("Briar Heart", comment: ""),
                               effects: [.restoreMagicka, .fortifyBlock, .paralysis, .fortifyMagicka]))
        list.append(Ingredient(.burntSprigganWood, name: NSLocalizedString("Burnt Spriggan Wood", comment: ""),
                               effects: [.weaknessToFire, .fortifyAlteration, .damageMagickaRegen, .slow]))
        list.append(Ingredient(.butterflyWing, name: NSLocalizedString("Butterfly Wing", comment: ""),
                               effects: [.restoreHealth, .lingeringDamageStamina, .fortifyBarter, .damageMagicka]))
        list.append(Ingredient(.canisRoot, name: NSLocalizedString("Canis Root", comment: ""),
                               effects: [.damageStamina, .fortifyMarksman, .fortifyOneHanded, .paralysis]))
        list.append(Ingredient(.charredSkeeverHide, name: NSLocalizedString("Charred Skeever Hide", comment: ""),
                               effects: [.restoreStamina, .resistPoison, .cureDisease, .restoreHealth]))
        list.append(Ingredient(.chaurusEggs, name: NSLocalizedString("Chaurus Eggs", comment: ""),
                               effects: [.weaknessToPoison, .fortifyStamina, .damageMagicka, .invisibility]))
        list.append(Ingredient(.chaurusHunterAntennae, name: NSLocalizedString("Chaurus Hunter Antennae", comment: ""),
                               effects: [.damageStamina, .fortifyConjuration, .damageMagickaRegen, .fortifyEnchanting]))
        list.append(Ingredient(.chickensEgg, name: NSLocalizedString("Chicken's Egg", comment: ""),
                               effects: [.resistMagic, .waterbreathing, .damageMagickaRegen, .lingeringDamageStamina]))
        list.append(Ingredient(.creepCluster, name: NSLocalizedString("Creep Cluster", comment: ""),
                               effects: [.restoreMagicka, .fortifyCarryWeight, .damageStaminaRegen, .weaknessToMagic]))
        list.append(Ingredient(.crimsonNirnroot, name: NSLocalizedString("Crimson Nirnroot", comment: ""),
                               effects: [.damageHealth, .invisibility, .damageStamina, .resistMagic]))
        list.append(Ingredient(.cyrodilicSpadetail, name: NSLocalizedString("Cyrodilic Spadetail", comment: ""),
                               effects: [.damageStamina, .fear, .fortifyRestoration, .ravageHealth]))
        list.append(Ingredient(.daedraHeart, name: NSLocalizedString("Daedra Heart", comment: ""),
                               effects: [.damageStaminaRegen, .damageMagicka, .restoreHealth, .fear]))
        list.append(Ingredient(.deathbell, name: NSLocalizedString("Deathbell", comment: ""),
                               effects: [.damageHealth, .ravageStamina, .slow, .weaknessToPoison]))
        list.append(Ingredient(.dragonsTongue, name: NSLocalizedString("Dragon's Tongue", comment: ""),
                               effects: [.resistFire, .fortifyBarter, .fortifyIllusion, .fortifyTwoHanded]))
        list.append(Ingredient(.dwarvenOil, name: NSLocalizedString("Dwarven Oil", comment: ""),
                               effects: [.weaknessToMagic, .regenerateMagicka, .fortifyIllusion, .restoreMagicka]))
        list.append(Ingredient(.ectoplasm, name: NSLocalizedString("Ectoplasm", comment: ""),
                               effects: [.restoreMagicka, .fortifyDestruction, .fortifyMagicka, .damageHealth]))
        list.append(Ingredient(.elvesEar, name: NSLocalizedString("Elves Ear", comment: ""),
                               effects: [.restoreMagicka, .weaknessToFrost, .fortifyMarksman, .resistFire]))
        list.append(Ingredient(.emperorParasolMoss, name: NSLocalizedString("Emperor Parasol Moss", comment: ""),
                               effects: [.damageHealth, .fortifyMagicka, .regenerateHealth, .fortifyTwoHanded]))
        list.append(Ingredient(.eyeOfSabreCat, name: NSLocalizedString("Eye Of Sabre Cat", comment: ""),
                               effects: [.restoreStamina, .damageMagicka, .ravageHealth, .restoreHealth]))
        list.append(Ingredient(.falmerEar, name: NSLocalizedString("Falmer Ear", comment: ""),
                               effects: [.damageHealth, .frenzy, .resistPoison, .fortifyLockpicking]))
        list.append(Ingredient(.felsaadTernFeathers, name: NSLocalizedString("Felsaad Tern Feathers", comment: ""),
                               effects: [.restoreHealth, .fortifyLightArmor, .cureDisease, .resistMagic]))
        list.append(Ingredient(.fireSalts, name: NSLocalizedString("Fire Salts", comment: ""),
                               effects: [.weaknessToFrost, .restoreMagicka, .resistFire, .regenerateMagicka]))
        list.append(Ingredient(.flyAmanita, name: NSLocalizedString("Fly Amanita", comment: ""),
                               effects: [.resistFire, .frenzy, .fortifyTwoHanded, .regenerateStamina]))
        list.append(Ingredient(.frostMirriam, name: NSLocalizedString("Frost Mirriam", comment: ""),
                               effects: [.resistFrost, .fortifySneak, .ravageMagicka, .damageStaminaRegen]))
        list.append(Ingredient(.frostSalts, name: NSLocalizedString("Frost Salts", comment: ""),
                               effects: [.weaknessToFire, .resistFrost, .restoreMagicka, .fortifyConjuration]))
        list.append(Ingredient(.garlic, name: NSLocalizedString("Garlic", comment: ""),
                               effects: [.resistPoison, .fortifyStamina, .regenerateMagicka, .regenerateHealth]))
        list.append(Ingredient(.giantLichen, name: NSLocalizedString("Giant Lichen", comment: ""),
                               effects: [.ravageHealth, .weaknessToPoison, .weaknessToShock, .restoreMagicka]))
        list.append(Ingredient(.giantsToe, name: NSLocalizedString("Giant's Toe", comment: ""),
                               effects: [.damageStamina, .fortifyCarryWeight, .fortifyHealth, .damageStaminaRegen]))
        list.append(Ingredient(.gleamblossom, name: NSLocalizedString("Gleamblossom", comment: ""),
                               effects: [.resistMagic, .fear, .regenerateHealth, .paralysis]))
        list.append(Ingredient(.glowDust, name: NSLocalizedString("Glow Dust", comment: ""),
                               effects: [.damageMagicka, .fortifyDestruction, .damageMagickaRegen, .resistShock]))
        list.append(Ingredient(.glowingMushroom, name: NSLocalizedString("Glowing Mushroom", comment: ""),
                               effects: [.resistShock, .fortifyDestruction, .fortifySmithing, .fortifyHealth]))
        list.append(Ingredient(.grassPod, name: NSLocalizedString("Grass Pod", comment: ""),
                               effects: [.resistPoison, .ravageMagicka, .fortifyAlteration, .restoreMagicka]))
        list.append(Ingredient(.hagravenClaw, name: NSLocalizedString("Hagraven Claw", comment: ""),
                               effects: [.resistMagic, .lingeringDamageMagicka, .fortifyEnchanting, .fortifyBarter]))
        list.append(Ingredient(.hagravenFeathers, name: NSLocalizedString("Hagraven Feathers", comment: ""),
                               effects: [.damageMagicka, .frenzy, .fortifyConjuration, .weaknessToShock]))
        list.append(Ingredient(.hangingMoss, name: NSLocalizedString("Hanging Moss", comment: ""),
                               effects: [.damageMagicka, .damageMagickaRegen, .fortifyHealth, .fortifyOneHanded]))
        list.append(Ingredient(.hawkBeak, name: NSLocalizedString("Hawk Beak", comment: ""),
                               effects: [.restoreStamina, .resistFrost, .fortifyCarryWeight, .resistShock]))
        list.append(Ingredient(.hawkFeathers, name: NSLocalizedString("Hawk Feathers", comment: ""),
                               effects: [.cureDisease, .fortifyLightArmor, .fortifyOneHanded, .fortifySneak]))
        list.append(Ingredient(.hawksEgg, name: NSLocalizedString("Hawk's Egg", comment: ""),
                               effects: [.resistMagic, .damageMagickaRegen, .waterbreathing, .lingeringDamageStamina]))
        list.append(Ingredient(.histcarp, name: NSLocalizedString("Histcarp", comment: ""),
                               effects: [.restoreStamina, .fortifyMagicka, .damageStaminaRegen, .waterbreathing]))
        list.append(Ingredient(.honeycomb, name: NSLocalizedString("Honeycomb", comment: ""),
                               effects: [.restoreStamina, .fortifyBlock, .fortifyLightArmor, .ravageStamina]))
        list.append(Ingredient(.humanFlesh, name: NSLocalizedString("Human Flesh", comment: ""),
                               effects: [.damageHealth, .paralysis, .restoreMagicka, .fortifySneak]))
        list.append(Ingredient(.humanHeart, name: NSLocalizedString("Human Heart", comment: ""),
                               effects: [.damageHealth, .damageMagickaRegen, .damageMagicka, .frenzy]))
        list.append(Ingredient(.iceWraithTeeth, name: NSLocalizedString("Ice Wraith Teeth", comment: ""),
                               effects: [.weaknessToFrost, .fortifyHeavyArmor, .invisibility, .weaknessToFire]))
        list.append(Ingredient(.impStool, name: NSLocalizedString("Imp Stool", comment: ""),
                               effects: [.damageHealth, .paralysis, .lingeringDamageHealth, .restoreHealth]))
        list.append(Ingredient(.jarrinRoot, name: NSLocalizedString("Jarrin Root", comment: ""),
                               effects: [.damageHealth, .damageStamina, .damageMagicka, .damageMagickaRegen]))
        list.append(Ingredient(.jazbayGrapes, name: NSLocalizedString("Jazbay Grapes", comment: ""),
                               effects: [.weaknessToMagic, .fortifyMagicka, .regenerateMagicka, .ravageHealth]))
        list.append(Ingredient(.juniperBerries, name: NSLocalizedString("Juniper Berries", comment: ""),
                               effects: [.weaknessToFire, .regenerateHealth, .fortifyMarksman, .damageStaminaRegen]))
        list.append(Ingredient(.largeAntlers, name: NSLocalizedString("Large Antlers", comment: ""),
                               effects: [.restoreStamina, .fortifyStamina, .slow, .damageStaminaRegen]))
        list.append(Ingredient(.lavender, name: NSLocalizedString("Lavender", comment: ""),
                               effects: [.resistMagic, .fortifyStamina, .ravageMagicka, .fortifyConjuration]))
        list.append(Ingredient(.lunaMothWing, name: NSLocalizedString("Luna Moth Wing", comment: ""),
                               effects: [.damageMagicka, .fortifyLightArmor, .regenerateHealth, .invisibility]))
        list.append(Ingredient(.moonSugar, name: NSLocalizedString("Moon Sugar", comment: ""),
                               effects: [.weaknessToFire, .resistFrost, .restoreMagicka, .regenerateMagicka]))
        list.append(Ingredient(.moraTapinella, name: NSLocalizedString("Mora Tapinella", comment: ""),
                               effects: [.restoreMagicka, .lingeringDamageHealth, .regenerateStamina, .fortifyIllusion]))
        list.append(Ingredient(.mudcrabChitin, name: NSLocalizedString("Mudcrab Chitin", comment: ""),
                               effects: [.restoreStamina, .cureDisease, .resistPoison, .resistFire]))
        list.append(Ingredient(.namirasRot, name: NSLocalizedString("Namira's Rot", comment: ""),
                               effects: [.damageMagicka, .fear, .fortifyLockpicking, .regenerateHealth]))
        list.append(Ingredient(.netchJelly, name: NSLocalizedString("Netch Jelly", comment: ""),
                               effects: [.paralysis, .fortifyCarryWeight, .restoreStamina, .fear]))
        list.append(Ingredient(.nightshade, name: NSLocalizedString("Nightshade", comment: ""),
                               effects: [.damageHealth, .damageMagickaRegen, .lingeringDamageStamina, .fortifyDestruction]))
        list.append(Ingredient(.nirnroot, name: NSLocalizedString("Nirnroot", comment: ""),
                               effects: [.damageHealth, .damageStamina, .invisibility, .resistMagic]))
        list.append(Ingredient(.nordicBarnacle, name: NSLocalizedString("Nordic Barnacle", comment: ""),
                               effects: [.damageMagicka, .waterbreathing, .regenerateHealth, .fortifyPickpocket]))
        list.append(Ingredient(.orangeDartwing, name: NSLocalizedString("Orange Dartwing", comment: ""),
                               effects: [.restoreStamina, .ravageMagicka, .fortifyPickpocket, .lingeringDamageHealth]))
        list.append(Ingredient(.pearl, name: NSLocalizedString("Pearl", comment: ""),
                               effects: [.restoreStamina, .restoreMagicka, .fortifyBlock, .resistShock]))
        list.append(Ingredient(.pineThrustEgg, name: NSLocalizedString("Pine Thrush Egg", comment: ""),
                               effects: [.restoreStamina, .fortifyLockpicking, .weaknessToPoison, .resistShock]))
        list.append(Ingredient(.poisonBloom, name: NSLocalizedString("Poison Bloom", comment: ""),
                               effects: [.damageHealth, .slow, .fortifyCarryWeight, .fear]))
        list.append(Ingredient(.powderedMammothTusk, name: NSLocalizedString("Powdered Mammoth Tusk", comment: ""),
                               effects: [.restoreStamina, .weaknessToFire, .fortifySneak, .fear]))
        list.append(Ingredient(.purpleMountainFlower, name: NSLocalizedString("Purple Mountain Flower", comment: ""),
                               effects: [.restoreStamina, .fortifySneak, .lingeringDamageMagicka, .resistFrost]))
        list.append(Ingredient(.redMountainFlower, name: NSLocalizedString("Red Mountain Flower", comment: ""),
                               effects: [.restoreMagicka, .ravageMagicka, .fortifyMagicka, .damageHealth]))
        list.append(Ingredient(.riverBetty, name: NSLocalizedString("River Betty", comment: ""),
                               effects: [.damageHealth, .fortifyAlteration, .slow, .fortifyCarryWeight]))
        list.append(Ingredient(.rockWarblerEgg, name: NSLocalizedString("Rock Warbler Egg", comment: ""),
                               effects: [.restoreHealth, .fortifyOneHanded, .damageStamina, .weaknessToMagic]))
        list.append(Ingredient(.sabreCatTooth, name: NSLocalizedString("Sabre Cat Tooth", comment: ""),
                               effects: [.restoreStamina, .fortifyHeavyArmor, .fortifySmithing, .weaknessToPoison]))
        list.append(Ingredient(.salmonRoe, name: NSLocalizedString("Salmon Roe", comment: ""),
                               effects: [.restoreStamina, .waterbreathing, .fortifyMagicka, .regenerateMagicka]))
        list.append(Ingredient(.saltPile, name: NSLocalizedString("Salt Pile", comment: ""),
                               effects: [.weaknessToMagic, .fortifyRestoration, .slow, .regenerateMagicka]))
        list.append(Ingredient(.scalyPholiota, name: NSLocalizedString("Scaly Pholiota", comment: ""),
                               effects: [.weaknessToMagic, .fortifyIllusion, .regenerateStamina, .fortifyCarryWeight]))
        list.append(Ingredient(.scathecraw, name: NSLocalizedString("Scathecraw", comment: ""),
                               effects: [.ravageHealth, .ravageStamina, .ravageMagicka, .lingeringDamageHealth]))
        list.append(Ingredient(.silversidePerch, name: NSLocalizedString("Silverside Perch", comment: ""),
                               effects: [.restoreStamina, .damageStaminaRegen, .ravageHealth, .resistFrost]))
        list.append(Ingredient(.skeeverTail, name: NSLocalizedString("Skeever Tail", comment: ""),
                               effects: [.damageStaminaRegen, .ravageHealth, .damageHealth, .fortifyLightArmor]))
        list.append(Ingredient(.slaughterfishEgg, name: NSLocalizedString("Slaughterfish Egg", comment: ""),
                               effects: [.resistPoison, .fortifyPickpocket, .lingeringDamageHealth, .fortifyStamina]))
        list.append(Ingredient(.slaughterfishScales, name: NSLocalizedString("Slaughterfish Scales", comment: ""),
                               effects: [.resistFrost, .lingeringDamageHealth, .fortifyHeavyArmor, .fortifyBlock]))
        list.append(Ingredient(.smallAntlers, name: NSLocalizedString("Small Antlers", comment: ""),
                               effects: [.weaknessToPoison, .fortifyRestoration, .lingeringDamageStamina, .damageHealth]))
        list.append(Ingredient(.smallPearl, name: NSLocalizedString("Small Pearl", comment: ""),
                               effects: [.restoreStamina, .fortifyOneHanded, .fortifyRestoration, .resistFrost]))
        list.append(Ingredient(.snowberries, name: NSLocalizedString("Snowberries", comment: ""),
                               effects: [.resistFire, .fortifyEnchanting, .resistFrost, .resistShock]))
        list.append(Ingredient(.spawnAsh, name: NSLocalizedString("Spawn Ash", comment: ""),
                               effects: [.ravageStamina, .resistFire, .fortifyEnchanting, .ravageMagicka]))
        list.append(Ingredient(.spiderEgg, name: NSLocalizedString("Spider Egg", comment: ""),
                               effects: [.damageStamina, .damageMagickaRegen, .fortifyLockpicking, .fortifyMarksman]))
        list.append(Ingredient(.sprigganSap, name: NSLocalizedString("Spriggan Sap", comment: ""),
                               effects: [.damageMagickaRegen, .fortifyEnchanting, .fortifySmithing, .fortifyAlteration]))
        list.append(Ingredient(.swampFungalPod, name: NSLocalizedString("Swamp Fungal Pod", comment: ""),
                               effects: [.resistShock, .lingeringDamageMagicka, .paralysis, .restoreHealth]))
        list.append(Ingredient(.taproot, name: NSLocalizedString("Taproot", comment: ""),
                               effects: [.weaknessToMagic, .fortifyIllusion, .regenerateMagicka, .restoreMagicka]))
        list.append(Ingredient(.thistleBranch, name: NSLocalizedString("Thistle Branch", comment: ""),
                               effects: [.resistFrost, .ravageStamina, .resistPoison, .fortifyHeavyArmor]))
        list.append(Ingredient(.torchbugThorax, name: NSLocalizedString("Torchbug Thorax", comment: ""),
                               effects: [.restoreStamina, .lingeringDamageMagicka, .weaknessToMagic, .fortifyStamina]))
        list.append(Ingredient(.tramaRoot, name: NSLocalizedString("Trama Root", comment: ""),
                               effects: [.weaknessToShock, .fortifyCarryWeight, .damageMagicka, .slow]))
        list.append(Ingredient(.trollFat, name: NSLocalizedString("Troll Fat", comment: ""),
                               effects: [.resistPoison, .fortifyTwoHanded, .frenzy, .damageHealth]))
        list.append(Ingredient(.tundraCotton, name: NSLocalizedString("Tundra Cotton", comment: ""),
                               effects: [.resistMagic, .fortifyMagicka, .fortifyBlock, .fortifyBarter]))
        list.append(Ingredient(.vampireDust, name: NSLocalizedString("Vampire Dust", comment: ""),
                               effects: [.invisibility, .regenerateHealth, .restoreMagicka, .cureDisease]))
        list.append(Ingredient(.voidSalts, name: NSLocalizedString("Void Salts", comment: ""),
                               effects: [.weaknessToShock, .resistMagic, .damageHealth, .fortifyMagicka]))
        list.append(Ingredient(.wheat, name: NSLocalizedString("Wheat", comment: ""),
                               effects: [.restoreHealth, .fortifyHealth, .damageStaminaRegen, .lingeringDamageMagicka]))
        list.append(Ingredient(.whiteCap, name: NSLocalizedString("White Cap", comment: ""),
                               effects: [.weaknessToFrost, .fortifyHeavyArmor, .restoreMagicka, .ravageMagicka]))
        list.append(Ingredient(.wispWrappings, name: NSLocalizedString("Wisp Wrappings", comment: ""),
                               effects: [.restoreStamina, .fortifyDestruction, .fortifyCarryWeight, .resistMagic]))
        list.append(Ingredient(.yellowMountainFlower, name: NSLocalizedString("Yellow Mountain Flower", comment: ""),
                               effects: [.resistPoison, .fortifyRestoration, .fortifyHealth, .damageStaminaRegen]))

        Ingredient.all = list.sorted(by: { (ingredient1, ingredient2) -> Bool in
            return ingredient1.name.localizedCompare(ingredient2.name) == .orderedAscending
        })
        IngredientTracker.markAllActive()
    }
}
