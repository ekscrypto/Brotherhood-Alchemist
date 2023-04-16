//
//  MixtureSorter.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-16.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

final actor MixtureSorter {
    
    enum SortPreference: Codable, Sendable {
        case fewerIngredientsHighestValue
    }
}
