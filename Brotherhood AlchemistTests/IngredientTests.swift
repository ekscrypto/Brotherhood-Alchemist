//
//  IngredientTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-01-19.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class IngredientTests: XCTestCase {
    
    var effectsRegistry: Effects!
    var ingredientsRegistry: Ingredients!

    override func setUp() async throws {
        effectsRegistry = Effects(filePath: UUID().uuidString, performLoad: false)
        Effects.registry = effectsRegistry
        
        ingredientsRegistry = Ingredients(filePath: UUID().uuidString, performLoad: false)
        Ingredients.registry = ingredientsRegistry
    }
    
    func testInit_emptyEffects_allowed() {
        XCTAssertNotNil(Ingredient(name: "Tulip", effects: []))
    }
    
    func testMaximumEffects() {
        XCTAssertEqual(Ingredient.maximumEffects, 4, "The game does not allow more than 4 effets per ingredient")
    }
    
    func testInit_maximumEffects_allowed() throws {
        let effect1: Effect = ~DefaultEffects.cureDisease
        let effect2: Effect = ~DefaultEffects.damageMagickaRegen
        let effect3: Effect = ~DefaultEffects.fear
        let effect4: Effect = ~DefaultEffects.paralysis
        try effectsRegistry.register(effect1)
        try effectsRegistry.register(effect2)
        try effectsRegistry.register(effect3)
        try effectsRegistry.register(effect4)
        XCTAssertNotNil(Ingredient(name: "Bones", effects: [
            effect1,
            effect2,
            effect3,
            effect4
        ]))
    }
    
    func testInit_repeatingEffets_rejected() throws {
        let effect1: Effect = ~DefaultEffects.cureDisease
        let effect2: Effect = ~DefaultEffects.damageMagickaRegen
        let effect3: Effect = ~DefaultEffects.fear
        try effectsRegistry.register(effect1)
        try effectsRegistry.register(effect2)
        try effectsRegistry.register(effect3)
        XCTAssertNil(Ingredient(name: "Bones", effects: [
            effect1,
            effect2,
            effect3,
            effect1
        ]))
    }
    
    func testInit_tooManyEffects_rejected() throws {
        let effect1: Effect = ~DefaultEffects.cureDisease
        let effect2: Effect = ~DefaultEffects.damageMagickaRegen
        let effect3: Effect = ~DefaultEffects.fear
        let effect4: Effect = ~DefaultEffects.paralysis
        let effect5: Effect = ~DefaultEffects.slow
        try effectsRegistry.register(effect1)
        try effectsRegistry.register(effect2)
        try effectsRegistry.register(effect3)
        try effectsRegistry.register(effect4)
        try effectsRegistry.register(effect5)
        XCTAssertNil(Ingredient(name: "Bones", effects: [
            effect1,
            effect2,
            effect3,
            effect4,
            effect5
        ]))
    }
    
    func testInit_oneEffect_effectAssociated() throws {
        let effect1: Effect = .init(name: "Uncertainty", value: 45, isPositive: true)
        try effectsRegistry.register(effect1)
        let ingredient: Ingredient = .init(name: "Seahorse Legs", effects: [effect1])!
        XCTAssertTrue(effect1.ingredients.contains(where: { $0.ref == ingredient }))
        XCTAssertEqual(effect1.ingredients.count, 1)
    }
    
    func testInit_maxEffects_effectsAssociated() throws {
        let effect1: Effect = .init(name: "Uncertainty", value: 45, isPositive: false)
        let effect2: Effect = .init(name: "Distrust", value: 900, isPositive: true)
        let effect3: Effect = .init(name: "Malevolence", value: 20, isPositive: false)
        let effect4: Effect = .init(name: "Idiocy", value: 1, isPositive: true)
        try effectsRegistry.register(effect1)
        try effectsRegistry.register(effect2)
        try effectsRegistry.register(effect3)
        try effectsRegistry.register(effect4)
        let ingredient: Ingredient = .init(name: "Tortoise Toe-Nails", effects: [
            effect1,
            effect2,
            effect3,
            effect4
        ])!
        XCTAssertTrue(effect1.ingredients.contains(where: { $0.ref == ingredient }))
        XCTAssertEqual(effect1.ingredients.count, 1)
        XCTAssertTrue(effect2.ingredients.contains(where: { $0.ref == ingredient }))
        XCTAssertEqual(effect2.ingredients.count, 1)
        XCTAssertTrue(effect3.ingredients.contains(where: { $0.ref == ingredient }))
        XCTAssertEqual(effect3.ingredients.count, 1)
        XCTAssertTrue(effect4.ingredients.contains(where: { $0.ref == ingredient }))
        XCTAssertEqual(effect4.ingredients.count, 1)
    }
    
    func testInit_twoIngredientsCommonEffect_allIngredientsListedInEffect() throws {
        let effect: Effect = .init(name: "Uncertainty", value: 45, isPositive: false)
        try effectsRegistry.register(effect)
        let ingredient1: Ingredient = .init(name: "Snoop Dog Glasses", effects: [effect])!
        let ingredient2: Ingredient = .init(name: "Ivanovich Ear Plugs", effects: [effect])!
        XCTAssertTrue(effect.ingredients.contains(where: { $0.ref == ingredient1 }))
        XCTAssertTrue(effect.ingredients.contains(where: { $0.ref == ingredient2 }))
        XCTAssertEqual(effect.ingredients.count, 2)
    }
    
    func testChangeEffects_effectRemoved_associationRemoved() throws {
        let effect: Effect = .init(name: "Uncertainty", value: 45, isPositive: false)
        try effectsRegistry.register(effect)
        let ingredient: Ingredient = .init(name: "Snoop Dog Glasses", effects: [effect])!
        XCTAssertTrue(effect.ingredients.contains(where: { $0.ref == ingredient }))
        ingredient.effects = []
        XCTAssertFalse(effect.ingredients.contains(where: { $0.ref == ingredient }))
    }
    
    func testChangeEffects_effectAdded_associationAdded() throws {
        let effect: Effect = .init(name: "Uncertainty", value: 45, isPositive: false)
        try effectsRegistry.register(effect)
        let ingredient: Ingredient = .init(name: "Snoop Dog Glasses", effects: [])!
        XCTAssertFalse(effect.ingredients.contains(where: { $0.ref == ingredient }))
        ingredient.effects = [.init(effect)]
        XCTAssertTrue(effect.ingredients.contains(where: { $0.ref == ingredient }))
    }
    
    func testDeinit_withEffects_associationRemoved() throws {
        let effect: Effect = .init(name: "Uncertainty", value: 45, isPositive: false)
        try effectsRegistry.register(effect)
        var ingredient: Ingredient? = .init(name: "Lucy's Hair Clip", effects: [effect])!
        XCTAssertTrue(effect.ingredients.contains(where: { $0.ref == ingredient! }))
        XCTAssertEqual(effect.ingredients.count, 1)
        ingredient = nil
        XCTAssertEqual(effect.ingredients.count, 0)
    }

    func testUniqueNames() {
        var foundNames: [String] = []
        DefaultIngredients.all.forEach({
            let ingredientName: String = ~$0.name
            XCTAssertFalse(foundNames.contains(ingredientName), "More than one ingredient has name \(ingredientName)")
            foundNames.append(ingredientName)
        })
    }

}
