//
//  AppDelegate.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit
import iRate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        iRate.sharedInstance().usesUntilPrompt = 10
        iRate.sharedInstance().daysUntilPrompt = 3

        return true
    }

}
