//
//  Effects.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-21.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class Effects {
    
    static var registry: Effects = .init()
    private let registryUrl: URL
    
    init(filePath: String = "Effects.registry", performLoad: Bool = true) {
        registryUrl = Self.registryUrl(path: filePath)
        if performLoad {
            loadRegistry()
        }
    }
    
    static func registryUrl(path filePath: String) -> URL {
        do {
            let documentDirectory: URL = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true)
            return documentDirectory.appendingPathComponent(filePath)
        } catch {
            fatalError("Unable to acquire .documentDirectory URL: \(error)")
        }
    }
    
    private func loadRegistry() {
        if loadRegistryFromDisk() {
            return
        }
        all = DefaultEffects.allCases.map { ~$0 }
    }
    
    private func loadRegistryFromDisk() -> Bool {
        do {
            let registryData: Data = try Data(contentsOf: registryUrl)
            let effects: [Effect] = try JSONDecoder().decode([Effect].self, from: registryData)
            try effects.forEach { try register($0) }
            return true
        } catch {
            print("Failed to load Effects registry from disk: \(error)")
            return false
        }
    }
    
    func register(_ effect: Effect) throws {
        enum Errors: Error {
            case duplicateName
        }
        
        guard all.allSatisfy({ $0.name != effect.name }) else {
            throw Errors.duplicateName
        }
        
        all.append(effect)
    }
    
    func effect(named name: ConstrainedName) -> Effect? {
        all.first(where: { $0.name == name })
    }
    
    func saveToDisk() -> Bool {
        do {
            let jsonData = try JSONEncoder().encode(all)
            try jsonData.write(to: registryUrl, options: .completeFileProtectionUntilFirstUserAuthentication)
            return true
        } catch {
            return false
        }
    }
    
    @Published private(set) var all: [Effect] = []
}
