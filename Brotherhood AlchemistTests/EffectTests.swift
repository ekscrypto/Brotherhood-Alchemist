//
//  EffectsTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-01-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class EffectsTests: XCTestCase {

    func testEffectCodable() throws {
        XCTAssertGreaterThan(Effect.defaultEffects.count, 0, "Some default effects should be defined")
        let encodedEffects = try JSONEncoder().encode(Effect.defaultEffects)
        let restoredEffects = try JSONDecoder().decode([Effect].self, from: encodedEffects)
        XCTAssertEqual(Effect.defaultEffects, restoredEffects, "Values should not have been modified from encoding/decoding")
    }
    
    func testEffectValue_zero_rejected() {
        XCTAssertNil(Effect.Value(rawValue: 0), "Expected a value of 0 to be rejected")
    }
    
    func testEffectValue_one_allowed() {
        XCTAssertNotNil(Effect.Value(rawValue: 1), "Expected a value of 1 to be allowed")
    }
    
    func testEffectValue_maximum_allowed() {
        XCTAssertNotNil(Effect.Value(rawValue: 50_000), "Expected maximum value of 50,000 to be allowed")
    }
    
    func testEffectValue_higherThanMaximum_rejected() {
        XCTAssertNil(Effect.Value(rawValue: 50_001), "Expected values higher than 50,000 to be rejected")
    }
    
    func testUniqueId() {
        var foundIds: [Effect.Id] = []
        Effect.defaultEffects.forEach({
            XCTAssertFalse(foundIds.contains($0.id), "More than one effect has id \($0.id)")
            foundIds.append($0.id)
        })
    }
    
    func testUniqueNames() {
        var foundNames: [String] = []
        Effect.defaultEffects.forEach({
            XCTAssertFalse(foundNames.contains($0.name.rawValue), "More than one effect has name \($0.name.rawValue)")
            foundNames.append($0.name.rawValue)
        })
    }
}
