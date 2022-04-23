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
    
    func testDefaultsAreAllPresentWhenLoaded() async throws {
        let registry = await Registry()
        await RegistryStorage.active.load(into: registry)
        let effects = await registry.effects
        let ingredients = await registry.ingredients
        XCTAssertEqual(DefaultIngredients.all.count, ingredients.count)
        XCTAssertEqual(DefaultEffects.all.count, effects.count)
    }

    func testPerformanceLoadDefaults() async throws {
        self.measure {
            let taskCompletedExpectation: XCTestExpectation = .init(description: "Load to complete")
            Task(priority: .background, operation: {
                let registry = await Registry()
                await RegistryStorage.active.load(into: registry)
                taskCompletedExpectation.fulfill()
            })
            wait(for: [taskCompletedExpectation], timeout: 3.0)
        }
    }

}
