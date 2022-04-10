//
//  Concoction.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

struct Concoction: Identifiable {
    let id: UUID = .init()
    let effects: [Effect]
    let ingredients: [Ingredient]
    let estimatedValue: UInt
}
