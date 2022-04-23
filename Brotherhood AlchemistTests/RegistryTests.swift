//
//  RegistryTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-04-23.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class RegistryTests: XCTestCase {

    override func setUpWithError() throws {
        try? FileManager.default.removeItem(at: RegistryStorage.registryUrl)
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: RegistryStorage.registryUrl)
    }

    func testEmptyByDefault() async throws {
        let registry = await Registry()
        let effects = await registry.effects
        let ingredients = await registry.ingredients
        XCTAssertTrue(effects.isEmpty)
        XCTAssertTrue(ingredients.isEmpty)
    }
    
    func loadedRegistry() async -> Registry {
        let registry = await Registry()
        await RegistryStorage.active.load(into: registry)
        return registry
    }
    
    func testDefaultsAreAllPresentWhenLoaded() async throws {
        let registry = await loadedRegistry()
        let effects = await registry.effects
        let ingredients = await registry.ingredients
        XCTAssertEqual(DefaultIngredients.all.count, ingredients.count)
        XCTAssertEqual(DefaultEffects.all.count, effects.count)
    }
    
    func randomElements(from registry: Registry, count: Int) async -> [Effect] {
        var effects: [Effect] = []
        let allEffects: [Effect] = await registry.effects
        while effects.count < min(count, allEffects.count) {
            guard let randomEffect = allEffects.randomElement() else {
                break
            }
            guard false == effects.contains(where: { $0.id == randomEffect.id }) else {
                continue
            }
            effects.append(randomEffect)
        }
        return effects
    }
        
    func testAddIngredient_newNameAllEffectsValid_shouldBeAdded() async throws {
        let registry: Registry = await loadedRegistry()
        let effects: [Effect] = await randomElements(from: registry, count: (0...4).randomElement()!)
        let name: ConstrainedName = .init(stringLiteral: UUID().uuidString)
        let newIngredient: Ingredient = try await AddIngredientCoordinator().add(
            name: name,
            effects: effects,
            to: registry)

        // Can we find the ingredient in the registry?
        let allIngredients: [Ingredient] = await registry.ingredients
        var ingredientFound: Bool = false
        for ingredient in allIngredients {
            if ingredient.id == newIngredient.id {
                ingredientFound = true
                break
            }
        }
        XCTAssertTrue(ingredientFound)

        // Does the ingredient has all the requested effects properly set?
        let newIngredientEffects = await newIngredient.effects
        guard effects.allSatisfy({ effect in
            newIngredientEffects.contains(where: { $0.id == effect.id })
        }) else {
            XCTFail("Some of the requested effects were not set properly")
            return
        }

        // Did the effects been updated with the new ingredient?
        for effect in effects {
            let effectIngredients: [Ingredient] = await effect.ingredients
            XCTAssertTrue(effectIngredients.contains(where: { $0.id == newIngredient.id }))
        }
    }
    
    func testAddIngredient_duplicatedName_errorThrownAndNotAdded() async throws {
        let registry: Registry = await loadedRegistry()
        let allIngredients: [Ingredient] = await registry.ingredients
        let effects: [Effect] = await randomElements(from: registry, count: 4)
        let existingName: ConstrainedName = await allIngredients.randomElement()!.name
        do {
            _ = try await AddIngredientCoordinator().add(name: existingName, effects: effects, to: registry)
            XCTFail("We should not be able to add an ingredient with the same name")
        } catch {
            XCTAssertEqual(error as? AddIngredientCoordinator.Errors, .duplicateName)
        }
    }

    func testAddIngredient_duplicatedNameUppercased_errorThrownAndNotAdded() async throws {
        let registry: Registry = await loadedRegistry()
        let allIngredients: [Ingredient] = await registry.ingredients
        let effects: [Effect] = await randomElements(from: registry, count: 4)
        let existingName: ConstrainedName = await allIngredients.randomElement()!.name
        do {
            let uppercasedName: ConstrainedName = ConstrainedName(stringLiteral: existingName.rawValue.uppercased())
            precondition(~existingName != ~uppercasedName)
            _ = try await AddIngredientCoordinator().add(name: uppercasedName, effects: effects, to: registry)
            XCTFail("We should not be able to add an ingredient with the same name")
        } catch {
            XCTAssertEqual(error as? AddIngredientCoordinator.Errors, .duplicateName)
        }
    }

    func testAddIngredient_tooManyEffects_errorThrownAndNotAdded() async throws {
        let registry: Registry = await loadedRegistry()
        let effects: [Effect] = await randomElements(from: registry, count: 5)
        do {
            let name: ConstrainedName = ConstrainedName(stringLiteral: UUID().uuidString)
            _ = try await AddIngredientCoordinator().add(name: name, effects: effects, to: registry)
            XCTFail("We should not be able to add an ingredient with the same name")
        } catch {
            XCTAssertEqual(error as? AddIngredientCoordinator.Errors, .tooManyEffects)
        }
    }
    
    func testAddIngredient_noEffects_ingredientAdded() async throws {
        let registry: Registry = await loadedRegistry()
        let effects: [Effect] = []
        do {
            let name: ConstrainedName = ConstrainedName(stringLiteral: UUID().uuidString)
            _ = try await AddIngredientCoordinator().add(name: name, effects: effects, to: registry)
        } catch {
            XCTFail("We should be able to add an ingredient without effect")
        }
    }
    
    func testAddIngredient_nonRegisteredEffect_errorThrownNotAdded() async throws {
        let registry: Registry = await loadedRegistry()
        var effects: [Effect] = await randomElements(from: registry, count: 3)
        let unregisteredEffect: Effect = await Effect(name: "Slouching", value: 620, isPositive: false)
        effects.append(unregisteredEffect)
        do {
            let name: ConstrainedName = ConstrainedName(stringLiteral: UUID().uuidString)
            _ = try await AddIngredientCoordinator().add(name: name, effects: effects, to: registry)
            XCTFail("We should not be able to add an ingredient with the same name")
        } catch {
            XCTAssertEqual(error as? AddIngredientCoordinator.Errors, .unknownEffect)
        }
    }
    
    func testAddIngredient_duplicatedEffect_errorThrownNotAdded() async throws {
        let registry: Registry = await loadedRegistry()
        var effects: [Effect] = await randomElements(from: registry, count: 3)
        effects.append(effects.first!)
        do {
            let name: ConstrainedName = ConstrainedName(stringLiteral: UUID().uuidString)
            _ = try await AddIngredientCoordinator().add(name: name, effects: effects, to: registry)
            XCTFail("We should not be able to add an ingredient with the same name")
        } catch {
            XCTAssertEqual(error as? AddIngredientCoordinator.Errors, .duplicateEffect)
        }
    }
}
