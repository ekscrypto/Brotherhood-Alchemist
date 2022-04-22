//
//  Ingredients.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-22.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class Ingredients {

    static var registry: Ingredients = .init()
    private let registryUrl: URL
    
    init(filePath: String = "Ingredients.registry", performLoad: Bool = true) {
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
        all = DefaultIngredients.all
    }
    
    private func loadRegistryFromDisk() -> Bool {
        do {
            let registryData: Data = try Data(contentsOf: registryUrl)
            let ingredients: [Ingredient] = try JSONDecoder().decode([Ingredient].self, from: registryData)
            try ingredients.forEach { try register($0) }
            return true
        } catch {
            print("Failed to load Ingredients registry from disk: \(error)")
            return false
        }
    }
    
    func register(_ ingredient: Ingredient) throws {
        enum Errors: Error {
            case duplicateName
        }
        
        guard all.allSatisfy({ $0.name != ingredient.name }) else {
            throw Errors.duplicateName
        }
        
        all.append(ingredient)
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
    
    @Published private(set) var all: [Ingredient] = []
}
