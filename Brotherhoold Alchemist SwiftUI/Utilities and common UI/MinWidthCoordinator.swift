//
//  MinWidthCoordinator.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct MinWidthCoordinator: View {
    @Binding var via: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            checkMinimumWidth(proxy.size.width)
        }
    }
    
    private func checkMinimumWidth(_ width: CGFloat) -> Color {
        DispatchQueue.main.async {
            if width > via {
                via = width
            }
        }
        return Color.clear
    }
}

