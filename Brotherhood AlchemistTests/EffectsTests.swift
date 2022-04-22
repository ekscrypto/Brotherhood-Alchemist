//
//  EffectsTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-04-22.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class EffectsTests: XCTestCase {
    
    let documentDirectory: URL = try! FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: true)
    var registryFileName: String = ""
    
    override func setUp() {
        registryFileName = UUID().uuidString
    }
    
    override func tearDown() {
        let registryUrl = documentDirectory.appendingPathComponent(registryFileName)
        try? FileManager.default.removeItem(at: registryUrl)
    }

    func testDuplicate_exactLiteral_expectsError() {
        let stringLiteral = "Miniaturization:750:p"
        let effect1: Effect = .init(stringLiteral: stringLiteral)
        let effect2: Effect = .init(stringLiteral: stringLiteral)
        precondition(effect1.name == effect2.name)
        
        let registry = Effects(performLoad: false)
        
        XCTAssertNoThrow( try registry.register(effect1) )
        XCTAssertThrowsError( try registry.register(effect2) )
    }
    
    func testDuplicate_sameNameOnly_expectsError() {
        let effect1: Effect = "Slow:1:n"
        let effect2: Effect = "Slow:8838:p"
        precondition(effect1.name == effect2.name)
        
        let registry = Effects(performLoad: false)
        
        XCTAssertNoThrow( try registry.register(effect1) )
        XCTAssertThrowsError( try registry.register(effect2) )
    }
    
    func testDuplicate_differentNames_expectsNoError() {
        let effect1: Effect = "Slow:1:n"
        let effect2: Effect = "Slower:8838:p"
        precondition(effect1.name != effect2.name)
        
        let registry = Effects(performLoad: false)
        
        XCTAssertNoThrow( try registry.register(effect1) )
        XCTAssertNoThrow( try registry.register(effect2) )
    }
    
    func testLoad_noFileOnDisk_findsAllDefaultEffects() {
        let registry = Effects(filePath: UUID().uuidString, performLoad: true)
        DefaultEffects.allCases.forEach {
            let effect: Effect = ~$0
            let matchingEffect = registry.effect(named: effect.name)
            XCTAssertNotNil(matchingEffect)
            XCTAssertEqual(matchingEffect?.name, effect.name)
        }
    }
    
    func testSaveRestore_noForcedError_expectsSameEffects() throws {
        let effect1: Effect = "Slow:1:n"
        let effect2: Effect = "Slower:8838:p"
        let registry: Effects = .init(filePath: registryFileName, performLoad: false)
        try registry.register(effect1)
        try registry.register(effect2)
        XCTAssertTrue(registry.saveToDisk())
        
        let restoredRegistry: Effects = .init(filePath: registryFileName, performLoad: true)
        XCTAssertEqual(restoredRegistry.all.count, 2)
        XCTAssertTrue(restoredRegistry.all.contains(effect1))
        XCTAssertTrue(restoredRegistry.all.contains(effect2))
    }
}
