//
//  TabsOriginCoordinator.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@MainActor
struct TabsOriginCoordinator: View {
    @Binding var via: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            propagateOrigin(proxy.frame(in: .global).origin.y - proxy.size.height)
        }
    }
    
    private func propagateOrigin(_ origin: CGFloat) -> Color {
        DispatchQueue.main.async {
            if origin != via {
                via = origin
            }
        }
        return Color.clear
    }
}
