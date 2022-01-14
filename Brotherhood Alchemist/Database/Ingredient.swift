//
//  Ingredient.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
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
        case beritsAshes
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

    class func matchingType(_ type: IngredientType) -> Ingredient? {
        for ingredient in Ingredient.all where ingredient.type == type {
            return ingredient
        }
        return nil
    }

}
