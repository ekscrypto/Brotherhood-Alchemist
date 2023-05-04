//
//  ViewRepCache.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-04.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

struct ViewRepCache {
    enum Cache<T> {
        case cached(T)
        case invalidated(UUID)
    }
    
    var effects: Cache<[ViewRep.Effect]>
    var ingredients: Cache<[ViewRep.Ingredient]>
    
    static var invalidated: ViewRepCache {
        .init(effects: .invalidated(UUID()), ingredients: .invalidated(UUID()))
    }
}
