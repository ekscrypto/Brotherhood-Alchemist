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
        case blisterworth
        case blueButterflyWing
        case blueDartwing
        case blueMountainFlower
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
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.ancestorMothWing, name: NSLocalizedString("Ancestor Moth Wing", comment: ""),
                               effects: [.damageStamina, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.ashCreepCluster, name: NSLocalizedString("Ash Creep Cluster", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.ashHopperJelly, name: NSLocalizedString("Ash Hopper Jelly", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.ashenGrassPod, name: NSLocalizedString("Ashen Grass Pod", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.bearClaws, name: NSLocalizedString("Bear Claws", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.bee, name: NSLocalizedString("Bee", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.beehiveHusk, name: NSLocalizedString("Beehive Husk", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.bleedingCrown, name: NSLocalizedString("Bleeding Crown", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.blueButterflyWing, name: NSLocalizedString("Blue Butterfly Wing", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.blueDartwing, name: NSLocalizedString("Blue Dartwing", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))
        list.append(Ingredient(.blueMountainFlower, name: NSLocalizedString("Blue Mountain Flower", comment: ""),
                               effects: [.weaknessToFrost, .fortifySneak, .weaknessToPoison, .fortifyDestruction]))

        self.all = list.sorted(by: { (ingredient1, ingredient2) -> Bool in
            return ingredient1.name.localizedCompare(ingredient2.name) == .orderedAscending
        })
    }
}
