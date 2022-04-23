//
//  Effects.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-21.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

@MainActor
final class Effects {
    
    @Published private(set) var all: [Effect] = []
    
    static let active: Effects = .init()
    
    fileprivate func finishLoading(using effects: [Effect]) {
        all = effects
    }
    
    func remove(effect: Effect) {
        all.removeAll(where: { $0.id == effect.id })
    }
    
    enum Errors: Error {
        case nameAlreadyExists
    }
    
    func add(effect: Effect) throws {
        let effectName: String = ~effect.name
        guard all.allSatisfy({ ~$0.name != effectName }) else {
            throw Errors.nameAlreadyExists
        }
        all.append(effect)
        all.sort(by: { ~$0.name < ~$1.name })
    }
}

@MainActor
class EffectsSnapshot {
    let effects: Effects
    
    init(with registry: Effects) {
        effects = registry
    }
    
    func capture() -> [Effect.DTO] {
        effects.all.map { $0.dto }
    }
}

final class StoredEffects {
    
    static func load(into registry: Effects) async {
        if let effectsFromDisk = try? await Self.loadRegistryFromDisk(from: Self.registryUrl) {
            await registry.finishLoading(using: effectsFromDisk)
            return
        }
        
        let defaultEffects = await Self.defaultValues()
        await registry.finishLoading(using: defaultEffects)
    }
    
    static func save(sourcing registry: Effects) async throws {
        let effectsDto: [Effect.DTO] = await EffectsSnapshot(with: registry).capture()
        let data = try JSONEncoder().encode(effectsDto)
        try data.write(to: registryUrl, options: [.atomic, .noFileProtection])
    }
    
    static var registryUrl: URL {
        do {
            let documentDirectory: URL = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true)
            return documentDirectory.appendingPathComponent("Effects.registry")
        } catch {
            fatalError("Unable to acquire .documentDirectory URL: \(error)")
        }
    }
    
    private static func loadRegistryFromDisk(from registryUrl: URL) async throws -> [Effect] {
        do {
            let registryData: Data = try Data(contentsOf: registryUrl)
            let effectsDTO: [Effect.DTO] = try JSONDecoder().decode([Effect.DTO].self, from: registryData)
            try UniqueEffectsValidator.validate(using: effectsDTO)
            
            var effects: [Effect] = []
            for dto in effectsDTO {
                let effect = await Effect(dto: dto)
                effects.append(effect)
            }
            return effects
        } catch {
            print("Unable to load Effects registry: \(error)")
            throw error
        }
    }
    
    private static func defaultValues() async -> [Effect] {
        var effects: [Effect] = []
        for dto in DefaultEffects.all {
            let effect = await Effect(dto: dto)
            effects.append(effect)
        }
        return effects
    }
}

final class UniqueEffectsValidator {
    enum Errors: Error {
        case duplicatedName
    }
    
    static func validate(using dto: [Effect.DTO]) throws {
        let uniqueNames: Set<String> = Set(dto.map { ~$0.name })
        if uniqueNames.count < dto.count {
            throw Errors.duplicatedName
        }
    }
    
}
