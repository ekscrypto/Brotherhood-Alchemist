//
//  SelectionText.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@MainActor
struct SelectionText: View {
    let state: SelectionState
    
    private var description: String {
        switch state {
        case .cantHave:
            return "can't"
        case .mayHave:
            return "may"
        case .mustHave:
            return "must"
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(description)
            Text("have")
        }
        .font(.system(.caption))
        .foregroundColor(Color("selectionText"))
    }
}

struct SelectionText_Previews: PreviewProvider {
    static var previews: some View {
        SelectionText(state: .mayHave)
            .previewDisplayName("Light")
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)

        SelectionText(state: .mayHave)
            .previewDisplayName("Dark")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
