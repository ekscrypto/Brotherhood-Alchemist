//
//  Registries.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-22.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class RegistriesLoader {
    
    @Published var loaded: Bool = false
    
    init() {
        DispatchQueue.global().async {
            let effects = Effects.registry
            let ingredients = Ingredients.registry
            
            DispatchQueue.main.async {
                self.loaded = true
            }

            _ = effects.saveToDisk()
            _ = ingredients.saveToDisk()
        }
    }
}
