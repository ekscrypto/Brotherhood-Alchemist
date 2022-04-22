//
//  HeightCoordinator.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct HeightCoordinator: View {
    @Binding var via: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            propagateHeight(proxy.size.height)
        }
    }
    
    private func propagateHeight(_ valueToPropagate: CGFloat) -> Color {
        DispatchQueue.main.async {
            if valueToPropagate != via {
                via = valueToPropagate
            }
        }
        return Color.clear
    }
}
