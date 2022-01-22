//
//  ConcoctionEffectsFilterTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-03-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class ConcoctionEffectsFilterTests: XCTestCase {
    
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

    func testFilterOnly_singleMatchingValue_expectsValueOut() {
        let concoction: Concoction = Concoction(
            effects: [damageHealth.id],
            ingredients: [crimsonNirnroot.id, deathBell.id],
            estimatedValue: damageHealth.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageHealth.id], rule: .only)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterOnly_matchingAndNonMatchingValuesWithUndesiredEffect_expectsEmptyOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageHealth.id, damageStamina.id], rule: .only)
        XCTAssertTrue(result.isEmpty)
    }
    
    func testFilterOnly_matchingAndNonMatchingNoUndesiredEffect_expectsValueOut() {
        let concoction: Concoction = Concoction(
            effects: [damageHealth.id],
            ingredients: [crimsonNirnroot.id, deathBell.id],
            estimatedValue: damageHealth.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageHealth.id, damageStamina.id], rule: .only)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterOnly_matchingMultipleValues_expectsValueOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageStamina.id, invisility.id], rule: .only)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterOnly_extraEffects_expectsEmptyOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [invisility.id], rule: .only)
        XCTAssertTrue(result.isEmpty)
    }
    
    func testFilterOnly_emptySet_expectsEmptyOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [], rule: .only)
        XCTAssertTrue(result.isEmpty)
    }
    
    func testFilterAny_emptySet_expectsEmptyOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [], rule: .anyOf)
        XCTAssertTrue(result.isEmpty)
    }
    
    func testFilterAny_singleMatchingValue_expectsValueOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let resultDamageStamina = ConcoctionEffectsFilter.filter([concoction], on: [damageStamina.id], rule: .anyOf)
        XCTAssertEqual(resultDamageStamina.count, 1)
        let resultInvisility = ConcoctionEffectsFilter.filter([concoction], on: [invisility.id], rule: .anyOf)
        XCTAssertEqual(resultInvisility.count, 1)
    }
    
    func testFilterAny_nonMatchingValue_expectsEmptyOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageHealth.id], rule: .anyOf)
        XCTAssertTrue(result.isEmpty)
    }
    
    func testFilterAny_nonMatchingValues_expectsEmptyOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageHealth.id, Effect.DefaultEffectId.resistMagic.rawValue], rule: .anyOf)
        XCTAssertTrue(result.isEmpty)
    }
    
    func testFilterAny_matchingAndNonMatchingValues_expectsValueOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageHealth.id, Effect.DefaultEffectId.resistMagic.rawValue, damageStamina.id], rule: .anyOf)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterAll_singleMatchingValue_expectsValueOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageStamina.id], rule: .allOf)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterAll_multipleMatchingValues_expectsValueOut() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageStamina.id, invisility.id], rule: .allOf)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterAll_matchingAndNonMatchingValues_expectsEmpty() {
        let concoction: Concoction = Concoction(
            effects: [damageStamina.id, invisility.id],
            ingredients: [ashCreepCluster.id, crimsonNirnroot.id],
            estimatedValue: damageStamina.value.rawValue + invisility.value.rawValue)
        let result = ConcoctionEffectsFilter.filter([concoction], on: [damageHealth.id, damageStamina.id, invisility.id], rule: .allOf)
        XCTAssertTrue(result.isEmpty)
    }
}
