//
//  ConcoctionFinderTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class ConcoctionFinderTests: XCTestCase {
    
    private lazy var allTestEffects: [Effect] = [
        damageHealth,
        damageStamina,
        invisility,
        resistFire,
        resistMagic,
        fortifyDestruction,
        ravageStamina,
        slow,
        weaknessToPoison
    ]

    private let damageHealth: Effect = Effect(
        id: Effect.DefaultEffectId.damageHealth.rawValue,
        name: ConstrainedName(rawValue: "Damage Health")!,
        value: Effect.Value(rawValue: 1)!,
        isPositive: false)
    private let damageStamina: Effect = Effect(
        id: Effect.DefaultEffectId.damageStamina.rawValue,
        name: ConstrainedName(rawValue: "Damage Stamina")!,
        value: Effect.Value(rawValue: 3)!,
        isPositive: false)
    private let invisility: Effect = Effect(
        id: Effect.DefaultEffectId.invisibility.rawValue,
        name: ConstrainedName(rawValue: "Invisibility")!,
        value: Effect.Value(rawValue: 5)!,
        isPositive: false)
    private let resistFire: Effect = Effect(
        id: Effect.DefaultEffectId.resistFire.rawValue,
        name: ConstrainedName(rawValue: "Resist Fire")!,
        value: Effect.Value(rawValue: 7)!,
        isPositive: true)
    private let fortifyDestruction: Effect = Effect(
        id: Effect.DefaultEffectId.fortifyDestruction.rawValue,
        name: ConstrainedName(rawValue: "Fortify Destruction")!,
        value: Effect.Value(rawValue: 2)!,
        isPositive: true)
    private let resistMagic: Effect = Effect(
        id: Effect.DefaultEffectId.resistMagic.rawValue,
        name: ConstrainedName(rawValue: "Resist Magic")!,
        value: Effect.Value(rawValue: 8)!,
        isPositive: true)
    private let weaknessToPoison: Effect = Effect(
        id: Effect.DefaultEffectId.weaknessToPoison.rawValue,
        name: ConstrainedName(rawValue: "Weakness to Poison")!,
        value: Effect.Value(rawValue: 10)!,
        isPositive: false)
    private let slow: Effect = Effect(
        id: Effect.DefaultEffectId.slow.rawValue,
        name: ConstrainedName(rawValue: "Slow")!,
        value: Effect.Value(rawValue: 11)!,
        isPositive: false)
    private let ravageStamina: Effect = Effect(
        id: Effect.DefaultEffectId.ravageStamina.rawValue,
        name: ConstrainedName(rawValue: "Ravage Stamina")!,
        value: Effect.Value(rawValue: 12)!,
        isPositive: false)
    private let ashCreepCluster: Ingredient = Ingredient(
        id: 3,
        name: ConstrainedName(rawValue: "Ash Creep Cluster")!,
        effects: Effect.DefaultEffectId.values([.damageStamina, .invisibility, .resistFire, .fortifyDestruction]))!
    private let crimsonNirnroot: Ingredient = Ingredient(
        id: 26,
        name: ConstrainedName(rawValue: "Crimson Nirnroot")!,
        effects: Effect.DefaultEffectId.values([.damageHealth, .invisibility, .damageStamina, .resistMagic]))!
    private let deathBell: Ingredient = Ingredient(
        id: 29,
        name: ConstrainedName(rawValue: "Deathbell")!,
        effects: Effect.DefaultEffectId.values([.damageHealth, .ravageStamina, .slow, .weaknessToPoison]))!

    func testNoIngredient_expectsEmpty() {
        let grimoire = Grimoire(effects: allTestEffects, ingredients: [], valueCalculator: { _, _ in 0 })
        XCTAssertTrue(grimoire.threeIngredients.isEmpty)
        XCTAssertTrue(grimoire.twoIngredients.isEmpty)
        XCTAssertTrue(grimoire.twoOrThreeIngredients.isEmpty)
    }
    
    func testOneIngredient_expectsEmpty() {
        let grimoire = Grimoire(effects: allTestEffects, ingredients: [deathBell], valueCalculator: { _, _ in 0 })
        XCTAssertTrue(grimoire.threeIngredients.isEmpty)
        XCTAssertTrue(grimoire.twoIngredients.isEmpty)
        XCTAssertTrue(grimoire.twoOrThreeIngredients.isEmpty)
    }
    
    func testTwoNonRelatedIngredients_expectsEmpty() {
        let grimoire = Grimoire(effects: allTestEffects, ingredients: [ashCreepCluster, deathBell], valueCalculator: { _, _ in 0 })
        XCTAssertTrue(grimoire.threeIngredients.isEmpty)
        XCTAssertTrue(grimoire.twoIngredients.isEmpty)
        XCTAssertTrue(grimoire.twoOrThreeIngredients.isEmpty)
    }
    
    func testTwoIngredientsWithOneCommonEffect_expectsOneConcoction() {
        let grimoire = Grimoire(effects: allTestEffects, ingredients: [crimsonNirnroot, deathBell], valueCalculator: { _, _ in 0 })
        XCTAssertTrue(grimoire.threeIngredients.isEmpty)
        XCTAssertFalse(grimoire.twoIngredients.isEmpty)
        XCTAssertFalse(grimoire.twoOrThreeIngredients.isEmpty)
        if let concoction = grimoire.twoIngredients.first {
            XCTAssertTrue(concoction.ingredients.contains(crimsonNirnroot.id))
            XCTAssertTrue(concoction.ingredients.contains(deathBell.id))
            XCTAssertTrue(concoction.effects.contains(damageHealth.id))
            XCTAssertEqual(concoction.ingredients.count, 2)
            XCTAssertEqual(concoction.effects.count, 1)
        }
    }
    
    func testTwoIngredientsWithTwoCommonEffects_expectsOneConcoction() {
        let grimoire = Grimoire(effects: allTestEffects, ingredients: [crimsonNirnroot, ashCreepCluster], valueCalculator: { _, _ in 0 })
        XCTAssertTrue(grimoire.threeIngredients.isEmpty)
        XCTAssertFalse(grimoire.twoIngredients.isEmpty)
        XCTAssertFalse(grimoire.twoOrThreeIngredients.isEmpty)
        if let concoction = grimoire.twoIngredients.first {
            XCTAssertTrue(concoction.ingredients.contains(crimsonNirnroot.id))
            XCTAssertTrue(concoction.ingredients.contains(ashCreepCluster.id))
            XCTAssertTrue(concoction.effects.contains(damageStamina.id))
            XCTAssertTrue(concoction.effects.contains(invisility.id))
            XCTAssertEqual(concoction.ingredients.count, 2)
            XCTAssertEqual(concoction.effects.count, 2)
        }
    }
    
    func testMultipleIngredientsWithMatchingEffects_expectsMultipleResults() {
        let grimoire = Grimoire(effects: allTestEffects, ingredients: [crimsonNirnroot, ashCreepCluster, deathBell], valueCalculator: { _, _ in 0 })
        XCTAssertEqual(grimoire.threeIngredients.count, 1)
        XCTAssertEqual(grimoire.twoIngredients.count, 2)
        XCTAssertEqual(grimoire.twoOrThreeIngredients.count, 3)
        XCTAssertNotNil(grimoire.twoIngredients.first(where: { $0.ingredients.contains(crimsonNirnroot.id) && $0.ingredients.contains(deathBell.id) }))
        XCTAssertNotNil(grimoire.twoIngredients.first(where: { $0.ingredients.contains(ashCreepCluster.id) && $0.ingredients.contains(crimsonNirnroot.id) }))
        XCTAssertNotNil(grimoire.threeIngredients.first(where: { $0.ingredients.contains(crimsonNirnroot.id) && $0.ingredients.contains(deathBell.id) && $0.ingredients.contains(ashCreepCluster.id) }))
    }
}
