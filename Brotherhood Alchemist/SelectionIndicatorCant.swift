//
//  SelectionIndicatorCant.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@MainActor
struct SelectionIndicatorCant: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 3.0)
            .foregroundColor(Color.clear)
            .frame(width: 24, height: 24)
            .overlay(
                RoundedRectangle(cornerRadius: 3.0)
                    .stroke(Color("selectionBorder"), lineWidth: 2.0)
            )
            .padding(6.0)
    }
}

struct SelectionIndicatorCant_Previews: PreviewProvider {
    static var previews: some View {
        SelectionIndicatorCant()
            .previewDisplayName("Light")
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)

        SelectionIndicatorCant()
            .previewDisplayName("Dark")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
