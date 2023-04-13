//
//  DomainLogicTests.swift
//  DomainLogicTests
//
//  Created by Dave Poirier on 2023-04-10.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import XCTest
@testable import DomainLogic

final class DomainLogicTests: XCTestCase {
    
    let bleed = Effect(
        id: .new,
        name: "Bleed",
        baseValue: SeptimValue(rawValue: 65)!,
        outcome: .negative)
    let restoreHealth = Effect(
        id: .new,
        name: "Heal",
        baseValue: SeptimValue(rawValue: 75)!,
        outcome: .positive)
    let damageStamina = Effect(
        id: .new,
        name: "Damage Stamina",
        baseValue: SeptimValue(rawValue: 20)!,
        outcome: .negative)
    let restoreStamina = Effect(
        id: .new,
        name: "Restore Stamina",
        baseValue: SeptimValue(rawValue: 25)!,
        outcome: .positive)
    let slow = Effect(
        id: .new,
        name: "Slow",
        baseValue: SeptimValue(rawValue: 90)!,
        outcome: .negative)
    
    
    func testCanAddEffects_listStaysSortedAlphabetically() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(restoreHealth))
            .ingest(Intent.AddEffect(bleed))
            .ingest(Intent.AddEffect(damageStamina))
        let finalState = await stateMachine.appState
        let orderedEffects = finalState.effects.map { $0.name }
        XCTAssertEqual(orderedEffects, ["Bleed", "Damage Stamina", "Heal"])
    }
    
    func testEffectsAddedCanBeFoundById() async throws {
        let stateMachine = StateMachine()
        try await stateMachine.ingest(Intent.AddEffect(restoreStamina))
        let finalState = await stateMachine.appState
        let storedEffect = try XCTUnwrap(finalState.effects.first)
        XCTAssertEqual(storedEffect.id, restoreStamina.id)
        XCTAssertEqual(storedEffect.baseValue.rawValue, 25)
        XCTAssertEqual(storedEffect.outcome, .positive)
        XCTAssertEqual(storedEffect.name, "Restore Stamina")
    }
    
    func testCanAddIngredientWithNoDefinedEffects() async throws {
        let stateMachine = StateMachine()
        let rubberShoelaces = Ingredient(id: .new, name: "Rubber Shoelaces", effects: [])
        try await stateMachine.ingest(Intent.AddIngredient(rubberShoelaces))
        let finalState = await stateMachine.appState
        let storedIngredient = try XCTUnwrap(finalState.ingredients.first)
        XCTAssertEqual(storedIngredient.id, rubberShoelaces.id)
        XCTAssertEqual(storedIngredient.name, "Rubber Shoelaces")
        XCTAssertTrue(storedIngredient.effects.isEmpty)
    }
    
    func testCannotAddIngredientIfAnEffectIsUnknown() async throws {
        let stateMachine = StateMachine()
        let copperPowder = Ingredient(id: .new, name: "Rubber Shoelaces", effects: [.new])
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.AddIngredient(copperPowder)))
    }
    
    func testCanAddIngredientsWithValidEffects() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(bleed))
            .ingest(Intent.AddEffect(restoreHealth))
            .ingest(Intent.AddEffect(restoreStamina))
            .ingest(Intent.AddEffect(damageStamina))
        let antBrains = Ingredient(id: .new, name: "Ant Brains", effects: [
            bleed.id, restoreHealth.id, restoreStamina.id, damageStamina.id])
        try await stateMachine.ingest(Intent.AddIngredient(antBrains))
        let finalState = await stateMachine.appState
        let storedIngredient = try XCTUnwrap(finalState.ingredients.first)
        XCTAssertEqual(storedIngredient.id, antBrains.id)
        XCTAssertEqual(storedIngredient.name, "Ant Brains")
        XCTAssertEqual(storedIngredient.effects, [bleed.id, restoreHealth.id, restoreStamina.id, damageStamina.id])
    }
    
    func testCannotAddIngredientWithMoreThanFourEffects() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(bleed))
            .ingest(Intent.AddEffect(restoreHealth))
            .ingest(Intent.AddEffect(restoreStamina))
            .ingest(Intent.AddEffect(damageStamina))
            .ingest(Intent.AddEffect(slow))
        let monkeyToes = Ingredient(id: .new, name: "Monkey Toes", effects: [
            bleed.id, slow.id, restoreHealth.id, restoreStamina.id, damageStamina.id])
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.AddIngredient(monkeyToes)))
    }
    
    func testCannotAddIngredientWithSameEffectTwice() async throws {
        let stateMachine = StateMachine()
        try await stateMachine.ingest(Intent.AddEffect(restoreStamina))
        let eternalTreeBark = Ingredient(id: .new, name: "Eternal Tree Bark", effects: [
            restoreStamina.id, restoreStamina.id])
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.AddIngredient(eternalTreeBark)))
    }
    
    func testCanRemoveEffectIfUnused() async throws {
        let stateMachine = StateMachine()
        try await stateMachine.ingest(Intent.AddEffect(slow))
        try await stateMachine.ingest(Intent.RemoveEffect(id: slow.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.effects.isEmpty)
    }
    
    func testFailsToRemoveEffectIfUnknown() async throws {
        let stateMachine = StateMachine()
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.RemoveEffect(id: .new)))
    }
    
    func testFailsToRemoveEffectIfInUse() async throws {
        let stateMachine = StateMachine()
        try await stateMachine.ingest(Intent.AddEffect(bleed))
        let purpleBeesStinger = Ingredient(id: .new, name: "Purple Bees Stinger", effects: [bleed.id])
        try await stateMachine.ingest(Intent.AddIngredient(purpleBeesStinger))
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.RemoveEffect(id: slow.id)))
    }
    
    func testCanRemoveIngredientThatExists() async throws {
        let stateMachine = StateMachine()
        let purpleBeesStinger = Ingredient(id: .new, name: "Purple Bees Stinger", effects: [])
        try await stateMachine.ingest(Intent.AddIngredient(purpleBeesStinger))
        try await stateMachine.ingest(Intent.RemoveIngredient(id: purpleBeesStinger.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.ingredients.isEmpty)
    }
    
    func testFailsToRemoveIngredientIfUnknown() async throws {
        let stateMachine = StateMachine()
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.RemoveIngredient(id: .new)))
    }
    
    func testCanUpdateEffectThatExists() async throws {
        let stateMachine = StateMachine()
        try await stateMachine.ingest(Intent.AddEffect(bleed))
        let updatedBleed = Effect(
            id: bleed.id,
            name: "Deeply bleeding",
            baseValue: SeptimValue(rawValue: 125)!,
            outcome: .negative)
        try await stateMachine.ingest(Intent.UpdateEffect(updatedBleed))
        let finalState = await stateMachine.appState
        let storedEffect = try XCTUnwrap(finalState.effects.first)
        XCTAssertEqual(storedEffect.id, bleed.id)
        XCTAssertEqual(storedEffect.name, "Deeply bleeding")
        XCTAssertEqual(storedEffect.baseValue.rawValue, 125)
        XCTAssertEqual(storedEffect.outcome, .negative)
    }
    
    func testFailsToUpdateEffectThatIsUnknown() async throws {
        let stateMachine = StateMachine()
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.UpdateEffect(slow)))
    }
    
    func testFailsToUpdateEffectIfNewNameConflicts() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.AddEffect(bleed))
        let updatedEffect = Effect(
            id: slow.id,
            name: bleed.name,
            baseValue: SeptimValue(rawValue: 53)!,
            outcome: .positive)
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.UpdateEffect(updatedEffect)))
    }
    
    func testCanUpdateIngredientThatExists() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [slow.id])
        let blackCarp = Ingredient(id: magicCarp.id, name: "Black Carp", effects: [restoreHealth.id])
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.AddEffect(restoreHealth))
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.UpdateIngredient(blackCarp))
        let finalState = await stateMachine.appState
        let storedIngredient = try XCTUnwrap(finalState.ingredients.first)
        XCTAssertEqual(storedIngredient.id, magicCarp.id)
        XCTAssertEqual(storedIngredient.name, "Black Carp")
        XCTAssertEqual(storedIngredient.effects, [restoreHealth.id])
    }
    
    func testFailsToUpdateIngredientThatIsUnknown() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [slow.id])
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.UpdateIngredient(magicCarp)))
    }
    
    func testFailsToUpdateIngredientIfNewNameConflicts() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [slow.id])
        let blackCarp = Ingredient(id: .new, name: "Black Carp", effects: [restoreHealth.id])
        let renamedMagicCarp = Ingredient(id: magicCarp.id, name: "Black Carp", effects: [slow.id])
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.AddEffect(restoreHealth))
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.AddIngredient(blackCarp))
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.UpdateIngredient(renamedMagicCarp)))
    }
    
    func testFailsToUpdateIngredientIfContainsUnknownEffect() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [slow.id])
        let updatedMagicCarp = Ingredient(id: magicCarp.id, name: magicCarp.name, effects: [.new])
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.AddIngredient(magicCarp))
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.UpdateIngredient(updatedMagicCarp)))
    }
    
    func testFailsToUpdateIngredientIfContainsTooManyEffects() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [slow.id])
        let updatedMagicCarp = Ingredient(id: magicCarp.id, name: magicCarp.name, effects: [
            bleed.id, damageStamina.id, restoreHealth.id, restoreStamina.id, slow.id])
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.AddEffect(restoreHealth))
            .ingest(Intent.AddEffect(restoreStamina))
            .ingest(Intent.AddEffect(damageStamina))
            .ingest(Intent.AddEffect(bleed))
            .ingest(Intent.AddIngredient(magicCarp))
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.UpdateIngredient(updatedMagicCarp)))
    }
    
    func testFailsToUpdateIngredientIfEffectsAreNotUnique() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [slow.id])
        let updatedMagicCarp = Ingredient(id: magicCarp.id, name: magicCarp.name, effects: [
            slow.id, slow.id])
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.AddIngredient(magicCarp))
        await XCTAssertThrowsError(try await stateMachine.ingest(Intent.UpdateIngredient(updatedMagicCarp)))
    }
    
    func testCanAddIngredientAsMustHave() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [])
        try await stateMachine
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.MustHaveIngredient(id: magicCarp.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.cantHaveIngredients.isEmpty)
        XCTAssertEqual(finalState.mustHaveIngredients, [magicCarp.id])
    }
    
    func testCanAddIngredientAsCantHave() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [])
        try await stateMachine
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.CantHaveIngredient(id: magicCarp.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveIngredients.isEmpty)
        XCTAssertEqual(finalState.cantHaveIngredients, [magicCarp.id])
    }
    
    func testCantHaveIngredientCanBecomeMustHave() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [])
        try await stateMachine
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.CantHaveIngredient(id: magicCarp.id))
            .ingest(Intent.MustHaveIngredient(id: magicCarp.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.cantHaveIngredients.isEmpty)
        XCTAssertEqual(finalState.mustHaveIngredients, [magicCarp.id])
    }
    
    func testMustHaveIngredientCanBecomeCantHave() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [])
        try await stateMachine
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.MustHaveIngredient(id: magicCarp.id))
            .ingest(Intent.CantHaveIngredient(id: magicCarp.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveIngredients.isEmpty)
        XCTAssertEqual(finalState.cantHaveIngredients, [magicCarp.id])
    }
    
    func testMustHaveIngredientCanBecomeMayHave() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [])
        try await stateMachine
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.MustHaveIngredient(id: magicCarp.id))
            .ingest(Intent.MayHaveIngredient(id: magicCarp.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveIngredients.isEmpty)
        XCTAssertTrue(finalState.cantHaveIngredients.isEmpty)
    }
    
    func testCantHaveIngredientCanBecomeMayHave() async throws {
        let stateMachine = StateMachine()
        let magicCarp = Ingredient(id: .new, name: "Magic Carp", effects: [])
        try await stateMachine
            .ingest(Intent.AddIngredient(magicCarp))
            .ingest(Intent.CantHaveIngredient(id: magicCarp.id))
            .ingest(Intent.MayHaveIngredient(id: magicCarp.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveIngredients.isEmpty)
        XCTAssertTrue(finalState.cantHaveIngredients.isEmpty)
    }
    
    func testCanAddEffectToMustHave() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.MustHaveEffect(id: slow.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.cantHaveEffects.isEmpty)
        XCTAssertEqual(finalState.mustHaveEffects, [slow.id])
    }
    
    func testCanAddEffectToCantHave() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.CantHaveEffect(id: slow.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveEffects.isEmpty)
        XCTAssertEqual(finalState.cantHaveEffects, [slow.id])
    }
    
    func testMustHaveEffectCanBecomeCantHave() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.MustHaveEffect(id: slow.id))
            .ingest(Intent.CantHaveEffect(id: slow.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveEffects.isEmpty)
        XCTAssertEqual(finalState.cantHaveEffects, [slow.id])
    }
    
    func testCantHaveEffectCanBecomeMustHave() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.CantHaveEffect(id: slow.id))
            .ingest(Intent.MustHaveEffect(id: slow.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.cantHaveEffects.isEmpty)
        XCTAssertEqual(finalState.mustHaveEffects, [slow.id])
    }
    
    func testMustHaveEffectCanBecomeMayHave() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.MustHaveEffect(id: slow.id))
            .ingest(Intent.MayHaveEffect(id: slow.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveEffects.isEmpty)
        XCTAssertTrue(finalState.cantHaveEffects.isEmpty)
    }
    
    func testCantHaveEffectCanBecomeMayHave() async throws {
        let stateMachine = StateMachine()
        try await stateMachine
            .ingest(Intent.AddEffect(slow))
            .ingest(Intent.CantHaveEffect(id: slow.id))
            .ingest(Intent.MayHaveEffect(id: slow.id))
        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mustHaveEffects.isEmpty)
        XCTAssertTrue(finalState.cantHaveEffects.isEmpty)
    }
    
    func testCanAddAllEffectsAndIngredients() async throws {
        let stateMachine = StateMachine()
        try await withThrowingTaskGroup(of: Void.self) { group in
            Effect.all.forEach { effect in
                group.addTask {
                    try await stateMachine.ingest(Intent.AddEffect(effect))
                }
            }
            
            for try await _ in group { }
        }
        try await withThrowingTaskGroup(of: Void.self) { group in
            Ingredient.all.forEach { ingredient in
                group.addTask {
                    do {
                        try await stateMachine.ingest(Intent.AddIngredient(ingredient))
                    } catch {
                        fatalError("Failed to add ingredient \(ingredient.name): \(error)")
                    }
                }
            }
            
            for try await _ in group { }
        }
        
        let finalState = await stateMachine.appState
        XCTAssertEqual(finalState.effects.count, Effect.all.count)
        XCTAssertEqual(finalState.ingredients.count, Ingredient.all.count)
    }
}
