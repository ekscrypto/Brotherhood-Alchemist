//
//  IngredientTracker.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class IngredientTracker: NSObject {

    static var active: [Ingredient.IngredientType] = []
    static let updatedNotification: NSNotification.Name = NSNotification.Name(rawValue: "IngredientTracker.Active.Updated")
    static var notificationTimer: Timer!

    class func markActive(ingredient: Ingredient.IngredientType) {
        if active.contains(ingredient) == false {
            active.append(ingredient)
            postUpdateNotification()
        }
    }

    class func markInactive(ingredient: Ingredient.IngredientType) {
        guard let ingredientIndex = active.index(of: ingredient) else { return }
        active.remove(at: ingredientIndex)
        postUpdateNotification()
    }

    class func markAllInactive() {
        if active.count > 0 {
            active.removeAll()
            postUpdateNotification()
        }
    }

    class func markAllActive() {
        if active.count < Ingredient.all.count {
            var updatedList: [Ingredient.IngredientType] = []
            for ingredient in Ingredient.all {
                updatedList.append(ingredient.type)
            }
            active.removeAll()
            active.append(contentsOf: updatedList)
            postUpdateNotification()
        }
    }

    class func postUpdateNotification() {
        guard notificationTimer == nil else { return }
        notificationTimer = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: false, block: { (_) in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: IngredientTracker.updatedNotification, object: IngredientTracker.active)
            }
            IngredientTracker.notificationTimer = nil
        })
    }
}
