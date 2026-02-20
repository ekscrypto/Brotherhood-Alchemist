//
//  Brotherhood_AlchemistApp.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-04-18.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@main
struct Brotherhood_AlchemistApp: App {

    @StateObject var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appViewModel)
                .environmentObject(OrientationInfo())
        }
    }
}
