//
//  EffectsTests.swift
//  Brotherhood AlchemistTests
//
//  Created by Dave Poirier on 2022-04-22.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest

class EffectsTests: XCTestCase {
    
    override func setUp() async throws {
        try? FileManager.default.removeItem(at: StoredEffects.registryUrl)
    }
    
    func loadRegistry() async -> Effects {
        let registry = await Effects()
        await StoredEffects.load(into: registry)
        return registry
    }
    
    func testInit_noStoredFile_receivesDefaultValues() async throws {
        let registry = await loadRegistry()
        let effects: [Effect] = await registry.all
        var effectsDto: [Effect.DTO] = []
        for effect in effects {
            let effectDto = await effect.dto
            effectsDto.append(effectDto)
        }
        effectsDto.sort(by: { ~$0.name < ~$1.name })
        let expectedDto = DefaultEffects.all.sorted(by: { ~$0.name < ~$1.name })
        XCTAssertEqual(effectsDto.count, expectedDto.count)
    }
    
    func testDefaultEffects_allUnique() {
        XCTAssertNoThrow(try UniqueEffectsValidator.validate(using: DefaultEffects.all))
    }
    
    func testUniqueValidator_withDuplicateName_shouldThrow() {
        let effect1: Effect.DTO = .init(stringLiteral: "slow:5:n")
        let effect2: Effect.DTO = .init(stringLiteral: "slow:75:p")
        let duplicatedEffects: [Effect.DTO] = [effect1, effect2]
        XCTAssertThrowsError(try UniqueEffectsValidator.validate(using: duplicatedEffects))
    }
    
    func testSave_noStoredFile_fileExistsAfterSave() async throws {
        let registry = await loadRegistry()
        
        XCTAssertFalse(FileManager.default.fileExists(atPath: StoredEffects.registryUrl.path))
        try await StoredEffects.save(sourcing: registry)
        XCTAssertTrue(FileManager.default.fileExists(atPath: StoredEffects.registryUrl.path))
    }
    
    func registryWithRemovedEffect() async throws -> Effects {
        enum Errors: Error {
            case unableToExtractRandomElementFromRegistry
        }
        
        let registry: Effects = await loadRegistry()
        guard let randomEffect: Effect = await registry.all.randomElement() else {
            throw Errors.unableToExtractRandomElementFromRegistry
        }
        
        await registry.remove(effect: randomEffect)
        let leftOverEffects: [Effect] = await registry.all
        XCTAssertFalse(leftOverEffects.contains(where: { $0.id == randomEffect.id }))
        return registry
    }

    func testRemove_existingEffect_effectRemoved() async throws {
        _ = try await registryWithRemovedEffect()
    }
    
    func testRemoveSaveLoad_removingRandomEffect_effectRemoved() async throws {
        let registry: Effects = try await registryWithRemovedEffect()
        try await StoredEffects.save(sourcing: registry)
        
        let reloadedRegistry: Effects = await loadRegistry()
        let reloadedEffects: [Effect] = await reloadedRegistry.all
        XCTAssertEqual(reloadedEffects.count + 1, DefaultEffects.all.count)
    }
    
    func registryWithAddedEffect(_ dto: Effect.DTO) async throws -> Effects {
        enum Errors: Error {
            case unableToFindAddedEffect
        }
        let registry: Effects = await loadRegistry()
        let newEffect: Effect = await .init(dto: dto)
        try await registry.add(effect: newEffect)
        let allEffects: [Effect] = await registry.all
        for effect in allEffects {
            let name: ConstrainedName = await effect.name
            if ~name == ~dto.name {
                return registry
            }
        }
        throw Errors.unableToFindAddedEffect
    }
    
    func testAdd_newEffect_effectAdded() async throws {
        _ = try await registryWithAddedEffect("Foggy Brain:99:n")
    }
    
    func testAddSaveLoad_addingNewEffect_effectAdded() async throws {
        enum Errors: Error {
            case unableToFindAddedEffect
        }
        
        let registry: Effects = try await registryWithAddedEffect("Clear Brain:199:p")
        try await StoredEffects.save(sourcing: registry)
        
        let reloadedRegistry: Effects = await loadRegistry()
        let reloadedEffects: [Effect] = await reloadedRegistry.all
        XCTAssertEqual(reloadedEffects.count - 1, DefaultEffects.all.count)
        for effect in reloadedEffects {
            let name: ConstrainedName = await effect.name
            if ~name == "Clear Brain" {
                return
            }
        }
        throw Errors.unableToFindAddedEffect
    }
    
    func testAdd_duplicatedName_effectNotAdded() async throws {
        enum Errors: Error {
            case unableToExtractRandomElementFromRegistry
            case failedToPreventDuplicatedName
        }

        let registry: Effects = await loadRegistry()
        guard let randomEffect: Effect = await registry.all.randomElement() else {
            throw Errors.unableToExtractRandomElementFromRegistry
        }
        
        let nameToDuplicate: ConstrainedName = await randomEffect.name
        let effectDto: Effect.DTO = .init(name: nameToDuplicate, value: 999, isPositive: .random())
        let newEffect: Effect = await Effect(dto: effectDto)
        do {
            try await registry.add(effect: newEffect)
        } catch {
            XCTAssertEqual(error as? Effects.Errors, .nameAlreadyExists)
            return
        }
        throw Errors.failedToPreventDuplicatedName
    }
}
