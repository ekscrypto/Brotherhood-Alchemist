//
//  SelectionIndicatorMay.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct SelectionIndicatorMay: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 3.0)
            .foregroundColor(Color.clear)
            .frame(width: 24, height: 24)
            .overlay(
                RoundedRectangle(cornerRadius: 3.0)
                    .stroke(Color("selectionBorder"), lineWidth: 2.0)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6.0)
                    .scaleEffect(x: 0.5, y: 0.5, anchor: UnitPoint.center)
                    .foregroundColor(Color("selectionMust"))
            )
            .padding(6.0)
    }
}

struct SelectionIndicatorMay_Previews: PreviewProvider {
    static var previews: some View {
        SelectionIndicatorMay()
            .previewDisplayName("Light")
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)

        SelectionIndicatorMay()
            .previewDisplayName("Dark")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
