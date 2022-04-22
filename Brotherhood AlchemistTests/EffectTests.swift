//
//  EffectTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-01-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class EffectTests: XCTestCase {

    func testEffectCodable() throws {
        let allEffects: [Effect] = DefaultEffects.allCases.map { ~$0 }
        XCTAssertGreaterThan(DefaultEffects.allCases.count, 0, "Some default effects should be defined")
        let encodedEffects = try JSONEncoder().encode(allEffects)
        let restoredEffects = try JSONDecoder().decode([Effect].self, from: encodedEffects)
        XCTAssertEqual(allEffects, restoredEffects, "Values should not have been modified from encoding/decoding")
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
    
    func testDecoding() {
        let rawValue = "\"Loving Embrace:49999:p\""
        let rawData: Data = rawValue.data(using: .utf8)!
        do {
            let effect = try JSONDecoder().decode(Effect.self, from: rawData)
            XCTAssertEqual(effect.value.rawValue, 49_999)
            XCTAssertEqual(effect.name.rawValue, "Loving Embrace")
            XCTAssertTrue(effect.isPositive)
        } catch {
            XCTFail("Decoding failed: \(error)")
        }
    }
    
    func testEncoding() {
        let effect = Effect(name: "Warmth", value: 1, isPositive: false)
        do {
            let rawData = try JSONEncoder().encode(effect)
            let rawValue = String(data: rawData, encoding: .utf8)
            XCTAssertEqual("\"Warmth:1:n\"", rawValue)
        } catch {
            XCTFail("Encoding failed: \(error)")
        }
    }
    
    func testDefaultEffectsUniqueNames() {
        var foundIds: [ConstrainedName] = []
        DefaultEffects.allCases.forEach({
            let effect: Effect = ~$0
            XCTAssertFalse(foundIds.contains(effect.name), "More than one effect has name \(effect.name)")
            foundIds.append(effect.name)
        })
    }
}
