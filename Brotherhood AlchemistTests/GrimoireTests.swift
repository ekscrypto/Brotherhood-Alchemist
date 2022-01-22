//
//  GrimoireTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class GrimoireTests: XCTestCase {
    
//    let referenceEffects: [Effect] = [
//        Effect(id: Effect.DefaultEffectId.damageHealth.rawValue,
//               name: ConstrainedName(rawValue: "Damage Health")!,
//               value: Effect.Value(rawValue: 1)!,
//               isPositive: false),
//        Effect(id: Effect.DefaultEffectId.damageStamina.rawValue,
//               name: ConstrainedName(rawValue: "Damage Stamina")!,
//               value: Effect.Value(rawValue: 3)!,
//               isPositive: false),
//        Effect(id: Effect.DefaultEffectId.invisibility.rawValue,
//               name: ConstrainedName(rawValue: "Invisibility")!,
//               value: Effect.Value(rawValue: 5)!,
//               isPositive: false),
//    ]
//    let referenceIngredients: [Ingredient] = [
//        Ingredient(id: 3,
//                   name: ConstrainedName(rawValue: "Ash Creep Cluster")!,
//                   effects: Effect.DefaultEffectId.values([.damageStamina, .invisibility, .resistFire, .fortifyDestruction]))!,
//        Ingredient(id: 9,
//                   name: ConstrainedName(rawValue: "Berit's Ashes")!,
//                   effects: Effect.DefaultEffectId.values([.damageStamina, .fortifyConjuration, .resistFire, .ravageStamina]))!,
//        Ingredient(id: 26,
//                   name: ConstrainedName(rawValue: "Crimson Nirnroot")!,
//                   effects: Effect.DefaultEffectId.values([.damageHealth, .invisibility, .damageStamina, .resistMagic]))!,
//        Ingredient(id: 29,
//                   name: ConstrainedName(rawValue: "Deathbell")!,
//                   effects: Effect.DefaultEffectId.values([.damageHealth, .ravageStamina, .slow, .weaknessToPoison]))!,
//    ]
//
//    func testEffectFilteramageStamina_IngredientsAny_ExpectsFourResults() throws {
//        let concoctions = grimoire.concoctions(
//            effects: Grimoire.Filter(type: .allOf, criteria: [Effect.DefaultEffectId.damageStamina.rawValue]),
//            ingredients: Grimoire.Filter(type: .anyOf, criteria: [3,9,26,29]))
//
//        print(concoctions)
//        XCTAssertEqual(concoctions.count, 4, "Damage Stamina effect is present in 3 ingredients, expects to find 3 combinations of two ingredients and one combination of 3 ingredients")
//        XCTAssertNotNil(concoctions.first(where: { $0.ingredients == [3, 9] }))
//        XCTAssertNotNil(concoctions.first(where: { $0.ingredients == [3, 26] }))
//        XCTAssertNotNil(concoctions.first(where: { $0.ingredients == [9, 26] }))
//        XCTAssertNotNil(concoctions.first(where: { $0.ingredients == [3, 9, 26] }))
//    }
}
