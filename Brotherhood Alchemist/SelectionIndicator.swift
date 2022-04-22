//
//  SelectionIndicator.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct SelectionIndicator: View {
    let state: SelectionState
    
    var body: some View {
        VStack {
            switch state {
            case .cantHave:
                SelectionIndicatorCant()
            case .mayHave:
                SelectionIndicatorMay()
            case .mustHave:
                SelectionIndicatorMust()
            }
        }
    }
}

struct SelectionIndicator_Previews: PreviewProvider {
    static var previews: some View {
        SelectionIndicator(state: .cantHave)
            .previewDisplayName("Can't - Light")
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
        
        SelectionIndicator(state: .cantHave)
            .previewDisplayName("Can't - Dark")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        
        SelectionIndicator(state: .mayHave)
            .previewDisplayName("May - Light")
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
        
        SelectionIndicator(state: .mayHave)
            .previewDisplayName("May - Dark")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        
        SelectionIndicator(state: .mustHave)
            .previewDisplayName("Must - Light")
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
        
        SelectionIndicator(state: .mustHave)
            .previewDisplayName("Must - Dark")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
