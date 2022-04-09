//
//  SelectionControls.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-08.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct SelectionControls: View {
    
    @Binding var selected: SelectionState
    
    var body: some View {
        VStack(spacing: 0) {
            button(.mustHave)
            button(.mayHave)
            button(.cantHave)
        }
    }
    
    private func button(_ selection: SelectionState) -> some View {
        Button(action: {
            selected = selection
        }) {
            image(selection)
        }
    }
    
    private func image(_ selection: SelectionState) -> some View {
        let imageName: String
        switch selection {
        case .cantHave:
            imageName = "cant-have"
        case .mayHave:
            imageName = "may-have"
        case .mustHave:
            imageName = "must-have"
        }
        return Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40, alignment: .center)
            .opacity(selected == selection ? 1.0 : 0.25)
    }
    
}

struct SelectionControls_Previews: PreviewProvider {
    static var previews: some View {
        SelectionControls(
            selected: Binding(
                get: { .mustHave },
                set: { _ in /* do nothing */ }))
    }
}
