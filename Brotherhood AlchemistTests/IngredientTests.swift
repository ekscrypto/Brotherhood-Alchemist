//
//  IngredientTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-01-19.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class IngredientTests: XCTestCase {
    
    func testInit_emptyEffects_allowed() {
        XCTAssertNotNil(Ingredient(id: 1, name: ConstrainedName(rawValue: "Tulip")!, effects: []))
    }
    
    func testMaximumEffects() {
        XCTAssertEqual(Ingredient.maximumEffects, 4, "The game does not allow more than 4 effets per ingredient")
    }
    
    func testInit_maximumEffects_allowed() {
        XCTAssertNotNil(Ingredient(id: 1, name: ConstrainedName(rawValue: "Bones")!, effects: [1,2,3,4]))
    }
    
    func testInit_repeatingEffets_rejected() {
        XCTAssertNil(Ingredient(id: 1, name: ConstrainedName(rawValue: "Mother")!, effects: [1,2,1,300]))
    }
    
    func testInit_tooManyEffects_rejected() {
        XCTAssertNil(Ingredient(id: 1, name: ConstrainedName(rawValue: "Giant Toe")!, effects: [8,9,10,18,300]))
    }
    
    func testUniqueId() {
        var foundIds: [Ingredient.Id] = []
        Ingredient.defaultIngredients.forEach({
            XCTAssertFalse(foundIds.contains($0.id), "More than one ingredient has id \($0.id)")
            foundIds.append($0.id)
        })
    }
    
    func testUniqueNames() {
        var foundNames: [String] = []
        Ingredient.defaultIngredients.forEach({
            XCTAssertFalse(foundNames.contains($0.name.rawValue), "More than one ingredient has name \($0.name.rawValue)")
            foundNames.append($0.name.rawValue)
        })
    }

}
