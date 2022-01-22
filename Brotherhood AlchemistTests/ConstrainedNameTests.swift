//
//  ConstrainedNameTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-01-19.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class ConstrainedNameTests: XCTestCase {

    func testInitFromString_empty_nil() {
        XCTAssertNil(ConstrainedName(rawValue: ""), "Empty names should not be allowed")
        XCTAssertNil(ConstrainedName(rawValue: " \t\n "), "Names with only whitespace characters should not be allowed")
    }
    
    func testInitFromString_singleCharacter_accepted() {
        XCTAssertEqual(ConstrainedName(rawValue: "x")?.rawValue, "x", "A name containing a single alphabetical character should be allowed")
        XCTAssertEqual(ConstrainedName(rawValue: " x\n")?.rawValue, "x", "Name should be trimmed of whitespaces")
        XCTAssertEqual(ConstrainedName(rawValue: "\tx")?.rawValue, "x", "Name should be trimmed of whitespaces")
    }
    
    func testMaximumNameLengthIs48() {
        XCTAssertEqual(ConstrainedName.maximumLength, 48, "The maximum length is expected to be 48")
    }
    
    func testMinimumNameLengthIs1() {
        XCTAssertEqual(ConstrainedName.minimumLength, 1, "The minimum length is expected to be 1")
    }
    
    func testInitFromString_maximumLength_accepted() throws {
        let testString = String(repeating: "x", count: ConstrainedName.maximumLength)
        XCTAssertEqual(ConstrainedName(rawValue: testString)?.rawValue, testString, "Strings of exactly maximum length characters should be allowed")
    }
    
    func testInitFromString_longerThanMaximum_throws() {
        let testString = String(repeating: "x", count: ConstrainedName.maximumLength + 1)
        XCTAssertNil(ConstrainedName(rawValue: testString), "Strings longer than maximum length should not be allowed")
    }
    
    func testInitFromString_withLeadingSpace_trimmed() {
        XCTAssertEqual(ConstrainedName(rawValue: " Damage Ego")?.rawValue, "Damage Ego", "Leading space should be trimmed")
        XCTAssertEqual(ConstrainedName(rawValue: "Damage Ego ")?.rawValue, "Damage Ego", "Trailing space should be trimmed")
    }
    
    func testInitDecoding_empty_throws() {
        XCTAssertThrowsError(try JSONDecoder().decode(ConstrainedName.self, from: "".data(using: .utf8)!))
        XCTAssertThrowsError(try JSONDecoder().decode(ConstrainedName.self, from: " ".data(using: .utf8)!))
        XCTAssertThrowsError(try JSONDecoder().decode(ConstrainedName.self, from: "\n".data(using: .utf8)!))
        XCTAssertThrowsError(try JSONDecoder().decode(ConstrainedName.self, from: "\t".data(using: .utf8)!))
    }

}
