//
//  Ingredient.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class Ingredient: NSObject {

    enum IngredientType {
        case abeceanLongfin
        case ancestorMothWing
        case ashCreepCluster
        case ashHopperJelly
        case ashenGrassPod
        case bearClaws
        case bee
        case beehiveHusk
        case bleedingCrown
        case blisterwort
        case blueButterflyWing
        case blueDartwing
        case blueMountainFlower
        case boarTusk
        case boneMeal
        case briarHeart
        case burntSprigganWood
        case butterflyWing
        case canisRoot
        case charredSkeeverHide
        case chaurusEggs
        case chaurusHunterAntennae
        case chickensEgg
        case creepCluster
        case crimsonNirnroot
        case cyrodilicSpadetail
        case daedraHeart
        case deathbell
        case dragonsTongue
        case dwarvenOil
        case ectoplasm
        case elvesEar
        case emperorParasolMoss
        case eyeOfSabreCat
        case falmerEar
        case felsaadTernFeathers
        case fireSalts
        case flyAmanita
        case frostMirriam
        case frostSalts
        case garlic
        case giantLichen
        case giantsToe
        case gleamblossom
        case glowDust
        case glowingMushroom
        case grassPod
        case hagravenClaw
        case hagravenFeathers
        case hangingMoss
        case hawkBeak
        case hawkFeathers
        case hawksEgg
        case histcarp
        case honeycomb
        case humanFlesh
        case humanHeart
        case iceWraithTeeth
        case impStool
        case jarrinRoot
        case jazbayGrapes
        case juniperBerries
        case largeAntlers
        case lavender
        case lunaMothWing
        case moonSugar
        case moraTapinella
        case mudcrabChitin
        case namirasRot
        case netchJelly
        case nightshade
        case nirnroot
        case nordicBarnacle
        case orangeDartwing
        case pearl
        case pineThrustEgg
        case poisonBloom
        case powderedMammothTusk
        case purpleMountainFlower
        case redMountainFlower
        case riverBetty
        case rockWarblerEgg
        case sabreCatTooth
        case salmonRoe
        case saltPile
        case scalyPholiota
        case scathecraw
        case silversidePerch
        case skeeverTail
        case slaughterfishEgg
        case slaughterfishScales
        case smallAntlers
        case smallPearl
        case snowberries
        case spawnAsh
        case spiderEgg
        case sprigganSap
        case swampFungalPod
        case taproot
        case thistleBranch
        case torchbugThorax
        case tramaRoot
        case trollFat
        case tundraCotton
        case vampireDust
        case voidSalts
        case wheat
        case whiteCap
        case wispWrappings
        case yellowMountainFlower
    }

    let type: IngredientType
    let name: String
    let effects: [Effect.EffectType]
    var isAvailable: Bool = true

    static var all: [Ingredient]!

    init(_ type: IngredientType, name: String, effects: [Effect.EffectType] ) {
        self.type = type
        self.name = name
        self.effects = effects
        super.init()
    }

    class func populateList() {
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
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.boneMeal, name: NSLocalizedString("Bone Meal", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.briarHeart, name: NSLocalizedString("Briar Heart", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.burntSprigganWood, name: NSLocalizedString("Burtn Spriggan Wood", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.butterflyWing, name: NSLocalizedString("Butterfly Wing", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.canisRoot, name: NSLocalizedString("Canis Root", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.charredSkeeverHide, name: NSLocalizedString("Charred Skeever Hide", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.chaurusEggs, name: NSLocalizedString("Chaurus Eggs", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.chaurusHunterAntennae, name: NSLocalizedString("Chaurus Hunter Antennae", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.chickensEgg, name: NSLocalizedString("Chicken's Egg", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.creepCluster, name: NSLocalizedString("Creep Cluster", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.crimsonNirnroot, name: NSLocalizedString("Crimson Nirnroot", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.cyrodilicSpadetail, name: NSLocalizedString("Cyrodilic Spadetail", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.daedraHeart, name: NSLocalizedString("Daedra Heart", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.deathbell, name: NSLocalizedString("Deathbell", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.dragonsTongue, name: NSLocalizedString("Dragon's Tongue", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.dwarvenOil, name: NSLocalizedString("Dwarven Oil", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.ectoplasm, name: NSLocalizedString("Ectoplasm", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.elvesEar, name: NSLocalizedString("Elves Ear", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.emperorParasolMoss, name: NSLocalizedString("Emperor Parasol Moss", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.eyeOfSabreCat, name: NSLocalizedString("Eye Of Sabre Cat", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.falmerEar, name: NSLocalizedString("Falmer Ear", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.felsaadTernFeathers, name: NSLocalizedString("Felsaad Tern Feathers", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.fireSalts, name: NSLocalizedString("Fire Salts", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.flyAmanita, name: NSLocalizedString("Fly Amanita", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.frostMirriam, name: NSLocalizedString("Frost Mirriam", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.frostSalts, name: NSLocalizedString("Frost Salts", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.garlic, name: NSLocalizedString("Garlic", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.giantLichen, name: NSLocalizedString("Giant Lichen", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.giantsToe, name: NSLocalizedString("Giant's Toe", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.gleamblossom, name: NSLocalizedString("Gleamblossom", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.glowDust, name: NSLocalizedString("Glow Dust", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.glowingMushroom, name: NSLocalizedString("Glowing Mushroom", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.grassPod, name: NSLocalizedString("Grass Pod", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.hagravenClaw, name: NSLocalizedString("Hagraven Claw", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.hagravenFeathers, name: NSLocalizedString("Hagraven Feathers", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.hangingMoss, name: NSLocalizedString("Hanging Moss", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.hawkBeak, name: NSLocalizedString("Hawk Beak", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.hawkFeathers, name: NSLocalizedString("Hawk Feathers", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.hawksEgg, name: NSLocalizedString("Hawk's Egg", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.histcarp, name: NSLocalizedString("Histcarp", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.honeycomb, name: NSLocalizedString("Honeycomb", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.humanFlesh, name: NSLocalizedString("Human Flesh", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.humanHeart, name: NSLocalizedString("Human Heart", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.iceWraithTeeth, name: NSLocalizedString("Ice Wraith Teeth", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.impStool, name: NSLocalizedString("Imp Stool", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.jarrinRoot, name: NSLocalizedString("Jarrin Root", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.jazbayGrapes, name: NSLocalizedString("Jazbay Grapes", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.juniperBerries, name: NSLocalizedString("Juniper Berries", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.largeAntlers, name: NSLocalizedString("Large Antlers", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.lavender, name: NSLocalizedString("Lavender", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.lunaMothWing, name: NSLocalizedString("Luna Moth Wing", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.moonSugar, name: NSLocalizedString("Moon Sugar", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.moraTapinella, name: NSLocalizedString("Mora Tapinella", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.mudcrabChitin, name: NSLocalizedString("Mudcrab Chitin", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.namirasRot, name: NSLocalizedString("Namira's Rot", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.netchJelly, name: NSLocalizedString("Netch Jelly", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.nightshade, name: NSLocalizedString("Nightshade", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.nirnroot, name: NSLocalizedString("Nirnroot", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.nordicBarnacle, name: NSLocalizedString("Nordic Barnacle", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.orangeDartwing, name: NSLocalizedString("Orange Dartwing", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.pearl, name: NSLocalizedString("Pearl", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.pineThrustEgg, name: NSLocalizedString("Pine Trust Egg", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.poisonBloom, name: NSLocalizedString("Poison Bloom", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.powderedMammothTusk, name: NSLocalizedString("Powdered Mammoth Tusk", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.purpleMountainFlower, name: NSLocalizedString("Purple Mountain Flower", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.redMountainFlower, name: NSLocalizedString("Red Mountain Flower", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.riverBetty, name: NSLocalizedString("River Betty", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.rockWarblerEgg, name: NSLocalizedString("Rock Warbler Egg", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.sabreCatTooth, name: NSLocalizedString("Sabre Cat Tooth", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.salmonRoe, name: NSLocalizedString("Salmon Roe", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.saltPile, name: NSLocalizedString("Salt Pile", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.scalyPholiota, name: NSLocalizedString("Scaly Pholiota", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.scathecraw, name: NSLocalizedString("Scathecraw", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.silversidePerch, name: NSLocalizedString("Silverside Perch", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.skeeverTail, name: NSLocalizedString("Skeever Tail", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.slaughterfishEgg, name: NSLocalizedString("Slaughterfish Egg", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.slaughterfishScales, name: NSLocalizedString("Slaughterfish Scales", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.smallAntlers, name: NSLocalizedString("Small Antlers", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.smallPearl, name: NSLocalizedString("Small Pearl", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.snowberries, name: NSLocalizedString("Snowberries", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.spawnAsh, name: NSLocalizedString("Spawn Ash", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.spiderEgg, name: NSLocalizedString("Spider Egg", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.sprigganSap, name: NSLocalizedString("Spriggan Sap", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.swampFungalPod, name: NSLocalizedString("Swamp Fungal Pod", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.taproot, name: NSLocalizedString("Taproot", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.thistleBranch, name: NSLocalizedString("Thistle Branch", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.torchbugThorax, name: NSLocalizedString("Torchbug Thorax", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.tramaRoot, name: NSLocalizedString("Trama Root", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.trollFat, name: NSLocalizedString("Troll Fat", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.tundraCotton, name: NSLocalizedString("Tundra Cotton", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.vampireDust, name: NSLocalizedString("Vampire Dust", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.voidSalts, name: NSLocalizedString("Void Salts", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.wheat, name: NSLocalizedString("Wheat", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.whiteCap, name: NSLocalizedString("White Cap", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.wispWrappings, name: NSLocalizedString("Wisp Wrappings", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))
        list.append(Ingredient(.yellowMountainFlower, name: NSLocalizedString("Yellow Mountain Flower", comment: ""),
                               effects: [.restoreStamina, .ravageStamina, .regenerateStamina, .weaknessToShock]))

        self.all = list.sorted(by: { (ingredient1, ingredient2) -> Bool in
            return ingredient1.name.localizedCompare(ingredient2.name) == .orderedAscending
        })
    }
}
