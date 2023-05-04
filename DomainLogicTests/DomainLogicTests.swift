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
    
    private func addAllEffectsAndIngredients(to stateMachine: StateMachine) async throws {
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
    }
    
    func testCanIdentifyAllDefaultMixtures() async throws {
        let stateMachine = StateMachine()
        let finalStateExpectation = XCTestExpectation(description: "Expected mixtures should be found in the AppState")
        let stateObserver = await stateMachine.appStatePublisher.sink(receiveValue: { updatedState in
            if updatedState.mixtures.count == 33682, updatedState.mixtureViewModels.count == 33682 {
                finalStateExpectation.fulfill()
            }
        })
        try await addAllEffectsAndIngredients(to: stateMachine)
        await fulfillment(of: [finalStateExpectation], timeout: 10.0)
        _ = stateObserver
        let finalState = await stateMachine.appState
        XCTAssertEqual(finalState.effects.count, Effect.all.count)
        XCTAssertEqual(finalState.ingredients.count, Ingredient.all.count)
    }
    
    func testCanIdentifyMixtures() async throws {
        let sneakMixture = Mixture(
            id: .new,
            ingredients: [Ingredient.abeceanLongfin.id, Ingredient.ashenGrassPod.id],
            effects: [Effect.fortifySneak.id],
            retailValue: SeptimValue(rawValue: 118)!)
        let weaknessToFrostMixture1 = Mixture(
            id: .new,
            ingredients: [Ingredient.abeceanLongfin.id, Ingredient.elvesEar.id],
            effects: [Effect.weaknessToFrost.id],
            retailValue: SeptimValue(rawValue: 40)!)
        let weaknessToFrostMixture2 = Mixture(
            id: .new,
            ingredients: [Ingredient.abeceanLongfin.id, Ingredient.fireSalts.id],
            effects: [Effect.weaknessToFrost.id],
            retailValue: SeptimValue(rawValue: 40)!)
        let resistFireMixture1 = Mixture(
            id: .new,
            ingredients: [Ingredient.ashenGrassPod.id, Ingredient.elvesEar.id],
            effects: [Effect.resistFire.id],
            retailValue: SeptimValue(rawValue: 86)!)
        let resistFireMixture2 = Mixture(
            id: .new,
            ingredients: [Ingredient.ashenGrassPod.id, Ingredient.fireSalts.id],
            effects: [Effect.resistFire.id],
            retailValue: SeptimValue(rawValue: 86)!)
        let complexMixture1 = Mixture(
            id: .new,
            ingredients: [Ingredient.abeceanLongfin.id, Ingredient.ashenGrassPod.id, Ingredient.elvesEar.id],
            effects: [Effect.fortifySneak.id, Effect.resistFire.id, Effect.weaknessToFrost.id],
            retailValue: SeptimValue(rawValue: 86 + 40 + 118)!)
        let complexMixture2 = Mixture(
            id: .new,
            ingredients: [Ingredient.abeceanLongfin.id, Ingredient.ashenGrassPod.id, Ingredient.fireSalts.id],
            effects: [Effect.fortifySneak.id, Effect.resistFire.id, Effect.weaknessToFrost.id],
            retailValue: SeptimValue(rawValue: 86 + 40 + 118)!)
        let complexMixture3 = Mixture(
            id: .new,
            ingredients: [Ingredient.elvesEar.id, Ingredient.fireSalts.id],
            effects: [Effect.resistFire.id, Effect.restoreMagicka.id, Effect.weaknessToFrost.id],
            retailValue: SeptimValue(rawValue: 86 + 25 + 40)!)
        // NOTES: There are more recipes possible like Abecean Longfin + Elves Ear + Fire Salts, but the effects
        // would be the same as just having the elves ear + fire salts.  Therefore we filter out that recipe.
        
        let expectedMixtures: [Mixture] = [
            sneakMixture,
            weaknessToFrostMixture1,
            weaknessToFrostMixture2,
            resistFireMixture1,
            resistFireMixture2,
            complexMixture1,
            complexMixture2,
            complexMixture3]

        let finalStateExpectation = XCTestExpectation(description: "Expected mixtures should be found in the AppState")
        let stateMachine = StateMachine()
        let stateObserver = await stateMachine.appStatePublisher.sink(receiveValue: { updatedState in
            let mixtures = updatedState.mixtures
            let allExpectedMixturesFound = expectedMixtures.allSatisfy { expectedMixture in
                mixtures.contains(where: { mixture in
                    mixture.effects == expectedMixture.effects &&
                    mixture.ingredients == expectedMixture.ingredients &&
                    mixture.retailValue == expectedMixture.retailValue
                })
            }
            let mixturesCountMatches = mixtures.count == expectedMixtures.count
            if allExpectedMixturesFound, mixturesCountMatches {
                finalStateExpectation.fulfill()
            }
        })
        
        try await stateMachine
            .ingest(Intent.AddEffect(.weaknessToFrost))
            .ingest(Intent.AddEffect(.fortifySneak))
            .ingest(Intent.AddEffect(.weaknessToPoison))
            .ingest(Intent.AddEffect(.fortifyRestoration))
            .ingest(Intent.AddEffect(.resistFire))
            .ingest(Intent.AddEffect(.weaknessToShock))
            .ingest(Intent.AddEffect(.fortifyLockpicking))
            .ingest(Intent.AddEffect(.restoreMagicka))
            .ingest(Intent.AddEffect(.fortifyMarksman))
            .ingest(Intent.AddEffect(.regenerateMagicka))
            .ingest(Intent.AddIngredient(.abeceanLongfin))
            .ingest(Intent.AddIngredient(.ashenGrassPod))
            .ingest(Intent.AddIngredient(.elvesEar))
            .ingest(Intent.AddIngredient(.fireSalts))
        await fulfillment(of: [finalStateExpectation], timeout: 3.0)
        _ = stateObserver
    }
    
    func testMixtureViewModelsMatchesMixtures() async throws {
        let finalStateExpectation = XCTestExpectation(description: "Expected mixtures should be found in the AppState")
        let stateMachine = StateMachine()
        let stateObserver = await stateMachine.appStatePublisher.sink(receiveValue: { updatedState in
            if updatedState.mixtures.count == 1, updatedState.mixtureViewModels.count == 1 {
                finalStateExpectation.fulfill()
            }
        })
        
        try await stateMachine
            .ingest(Intent.AddEffect(.weaknessToFrost))
            .ingest(Intent.AddEffect(.resistFire))
            .ingest(Intent.AddEffect(.restoreMagicka))
            .ingest(Intent.AddEffect(.fortifyMarksman))
            .ingest(Intent.AddEffect(.regenerateMagicka))
            .ingest(Intent.AddIngredient(.elvesEar))
            .ingest(Intent.AddIngredient(.fireSalts))
        await fulfillment(of: [finalStateExpectation], timeout: 3.0)
        _ = stateObserver

        let finalState = await stateMachine.appState
        XCTAssertTrue(finalState.mixtureViewModels.contains(where: { mixtureViewModel in
            mixtureViewModel.effects == ["Resist Fire", "Restore Magicka", "Weakness To Frost"] &&
            mixtureViewModel.ingredients == ["Elves Ear", "Fire Salts"] &&
            mixtureViewModel.value == 151
        }))
    }
    
    func testViewRepEffectsIncludeAllEffectsAddedAndAreSorted() async throws {
        let expectedEffects: [ViewRep.Effect] = [
            .init(id: Effect.fortifyLockpicking.id,
                  name: Effect.fortifyLockpicking.name,
                  value: Effect.fortifyLockpicking.baseValue.rawValue,
                  isPositiveOutcome: true),
            .init(id: Effect.fortifyMarksman.id,
                  name: Effect.fortifyMarksman.name,
                  value: Effect.fortifyMarksman.baseValue.rawValue,
                  isPositiveOutcome: true),
            .init(id: Effect.fortifyRestoration.id,
                  name: Effect.fortifyRestoration.name,
                  value: Effect.fortifyRestoration.baseValue.rawValue,
                  isPositiveOutcome: true),
            .init(id: Effect.fortifySneak.id,
                  name: Effect.fortifySneak.name,
                  value: Effect.fortifySneak.baseValue.rawValue,
                  isPositiveOutcome: true),
            .init(id: Effect.regenerateMagicka.id,
                  name: Effect.regenerateMagicka.name,
                  value: Effect.regenerateMagicka.baseValue.rawValue,
                  isPositiveOutcome: true),
            .init(id: Effect.resistFire.id,
                  name: Effect.resistFire.name,
                  value: Effect.resistFire.baseValue.rawValue,
                  isPositiveOutcome: true),
            .init(id: Effect.restoreMagicka.id,
                  name: Effect.restoreMagicka.name,
                  value: Effect.restoreMagicka.baseValue.rawValue,
                  isPositiveOutcome: true),
            .init(id: Effect.weaknessToFrost.id,
                  name: Effect.weaknessToFrost.name,
                  value: Effect.weaknessToFrost.baseValue.rawValue,
                  isPositiveOutcome: false),
            .init(id: Effect.weaknessToPoison.id,
                  name: Effect.weaknessToPoison.name,
                  value: Effect.weaknessToPoison.baseValue.rawValue,
                  isPositiveOutcome: false),
            .init(id: Effect.weaknessToShock.id,
                  name: Effect.weaknessToShock.name,
                  value: Effect.weaknessToShock.baseValue.rawValue,
                  isPositiveOutcome: false)
        ]
        
        let stateMachine = StateMachine()

        let finalStateExpectation = XCTestExpectation(description: "Effects all listed and sorted")
        let viewRepObserver = stateMachine.viewRepPublisher.sink(receiveValue: { viewRep in
            XCTAssertTrue(Thread.isMainThread)
            if viewRep.effects == expectedEffects {
                finalStateExpectation.fulfill()
            }
        })
        
        try await stateMachine
            .ingest(Intent.AddEffect(.weaknessToFrost))
            .ingest(Intent.AddEffect(.fortifySneak))
            .ingest(Intent.AddEffect(.weaknessToPoison))
            .ingest(Intent.AddEffect(.fortifyRestoration))
            .ingest(Intent.AddEffect(.resistFire))
            .ingest(Intent.AddEffect(.weaknessToShock))
            .ingest(Intent.AddEffect(.fortifyLockpicking))
            .ingest(Intent.AddEffect(.restoreMagicka))
            .ingest(Intent.AddEffect(.fortifyMarksman))
            .ingest(Intent.AddEffect(.regenerateMagicka))

        await fulfillment(of: [finalStateExpectation], timeout: 3.0)
    }
    
    func testViewRepIngredientsIncludeAllIngredientsAddedAndAreSorted() async throws {
        let expectedIngredients: [ViewRep.Ingredient] = [
            .init(id: Ingredient.abeceanLongfin.id,
                  name: Ingredient.abeceanLongfin.name,
                  effects: [
                    .init(id: Effect.fortifyRestoration.id,
                          name: Effect.fortifyRestoration.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.fortifySneak.id,
                          name: Effect.fortifySneak.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.weaknessToFrost.id,
                          name: Effect.weaknessToFrost.name,
                          isPositiveOutcome: false),
                    .init(id: Effect.weaknessToPoison.id,
                          name: Effect.weaknessToPoison.name,
                          isPositiveOutcome: false)
                  ]),
            .init(id: Ingredient.ashenGrassPod.id,
                  name: Ingredient.ashenGrassPod.name,
                  effects: [
                    .init(id: Effect.fortifyLockpicking.id,
                          name: Effect.fortifyLockpicking.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.fortifySneak.id,
                          name: Effect.fortifySneak.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.resistFire.id,
                          name: Effect.resistFire.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.weaknessToShock.id,
                          name: Effect.weaknessToShock.name,
                          isPositiveOutcome: false)
                  ]),
            .init(id: Ingredient.elvesEar.id,
                  name: Ingredient.elvesEar.name,
                  effects: [
                    .init(id: Effect.fortifyMarksman.id,
                          name: Effect.fortifyMarksman.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.resistFire.id,
                          name: Effect.resistFire.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.restoreMagicka.id,
                          name: Effect.restoreMagicka.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.weaknessToFrost.id,
                          name: Effect.weaknessToFrost.name,
                          isPositiveOutcome: false)
                  ]),
            .init(id: Ingredient.fireSalts.id,
                  name: Ingredient.fireSalts.name,
                  effects: [
                    .init(id: Effect.regenerateMagicka.id,
                          name: Effect.regenerateMagicka.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.resistFire.id,
                          name: Effect.resistFire.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.restoreMagicka.id,
                          name: Effect.restoreMagicka.name,
                          isPositiveOutcome: true),
                    .init(id: Effect.weaknessToFrost.id,
                          name: Effect.weaknessToFrost.name,
                          isPositiveOutcome: false)
                  ])
        ]
        
        let stateMachine = StateMachine()
        
        let finalStateExpectation = XCTestExpectation(description: "Ingredients all listed and sorted")
        let viewRepObserver = stateMachine.viewRepPublisher.sink(receiveValue: { viewRep in
            XCTAssertTrue(Thread.isMainThread)
            if viewRep.ingredients == expectedIngredients {
                finalStateExpectation.fulfill()
            }
        })
        
        try await stateMachine
            .ingest(Intent.AddEffect(.weaknessToFrost))
            .ingest(Intent.AddEffect(.fortifySneak))
            .ingest(Intent.AddEffect(.weaknessToPoison))
            .ingest(Intent.AddEffect(.fortifyRestoration))
            .ingest(Intent.AddEffect(.resistFire))
            .ingest(Intent.AddEffect(.weaknessToShock))
            .ingest(Intent.AddEffect(.fortifyLockpicking))
            .ingest(Intent.AddEffect(.restoreMagicka))
            .ingest(Intent.AddEffect(.fortifyMarksman))
            .ingest(Intent.AddEffect(.regenerateMagicka))
        // ingredients added in non-alphabetical order on purpose
            .ingest(Intent.AddIngredient(.ashenGrassPod))
            .ingest(Intent.AddIngredient(.elvesEar))
            .ingest(Intent.AddIngredient(.abeceanLongfin))
            .ingest(Intent.AddIngredient(.fireSalts))

        await fulfillment(of: [finalStateExpectation], timeout: 3.0)
        _ = viewRepObserver
    }
}
