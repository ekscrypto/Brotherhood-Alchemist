//
//  EffectTracker.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class EffectTracker: NSObject {

    static var active: [Effect.EffectType] = []
    static let updatedNotification: NSNotification.Name = NSNotification.Name(rawValue: "EffectTracker.Active.Updated")
    static var notificationTimer: Timer!

    class func markActive(effect: Effect.EffectType) {
        if active.contains(effect) == false {
            active.append(effect)
            postUpdateNotification()
        }
    }

    class func markInactive(effect: Effect.EffectType) {
        guard let effectIndex = active.index(of: effect) else { return }
        active.remove(at: effectIndex)
        postUpdateNotification()
    }

    class func markAllInactive() {
        if active.count > 0 {
            active.removeAll()
            postUpdateNotification()
        }
    }

    class func markAllActive() {
        if active.count < Effect.all.count {
            var updatedList: [Effect.EffectType] = []
            for effect in Effect.all {
                updatedList.append(effect.type)
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
                NotificationCenter.default.post(name: EffectTracker.updatedNotification, object: EffectTracker.active)
            }
            EffectTracker.notificationTimer = nil
        })
    }
}
