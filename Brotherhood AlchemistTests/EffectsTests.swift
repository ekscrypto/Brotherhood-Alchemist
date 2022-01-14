//
//  EffectsTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-01-13.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class EffectsTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testCanLoadDefaults() throws {
        enum Errors: Error {
            case fileNotFound
        }
        guard let defaultEffectsJsonUrl = Bundle(for: Self.self).url(forResource: "DefaultEffects", withExtension: "json") else {
            throw Errors.fileNotFound
        }
        let defaultEffectsJsonData = try Data(contentsOf: defaultEffectsJsonUrl)
        let effects = try JSONDecoder().decode([Effect].self, from: defaultEffectsJsonData)
        XCTAssertGreaterThan(effects.count, 0)
    }
    
    func testEffectNameFromString_empty_throws() {
        XCTAssertThrowsError( _ = try Effect.Name(string: "") )
        XCTAssertThrowsError( _ = try Effect.Name(string: " \t\n ") )
    }
    
    func testEffectNameFromString_singleCharacter_accepted() throws {
        XCTAssertEqual(try Effect.Name(string: "x").value, "x")
        XCTAssertEqual(try Effect.Name(string: " x\n").value, "x")
        XCTAssertEqual(try Effect.Name(string: "\tx").value, "x")
    }
    
    func testEffectNameFromString_maximumLength_accepted() throws {
        let testString = String(repeating: "x", count: Effect.Name.maximumLength)
        XCTAssertEqual(try Effect.Name(string: testString).value, testString)
    }
    
    func testEffectNameFromString_longerThanMaximum_throws() {
        let testString = String(repeating: "x", count: Effect.Name.maximumLength + 1)
        XCTAssertThrowsError( _ = try Effect.Name(string: testString) )
    }
    
    func testEffectNameFromString_withLeadingSpace_trimmed() {
        XCTAssertEqual(try Effect.Name(string: " Damage Ego").value, "Damage Ego", "Leading space should be trimmed")
        XCTAssertEqual(try Effect.Name(string: "Damage Ego ").value, "Damage Ego", "Trailing space should be trimmed")
    }
    
    func testEffectNameDecoding_empty_throws() {
        XCTAssertThrowsError(try JSONDecoder().decode(Effect.Name.self, from: "".data(using: .utf8)!))
        XCTAssertThrowsError(try JSONDecoder().decode(Effect.Name.self, from: " ".data(using: .utf8)!))
        XCTAssertThrowsError(try JSONDecoder().decode(Effect.Name.self, from: "\n".data(using: .utf8)!))
        XCTAssertThrowsError(try JSONDecoder().decode(Effect.Name.self, from: "\t".data(using: .utf8)!))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
