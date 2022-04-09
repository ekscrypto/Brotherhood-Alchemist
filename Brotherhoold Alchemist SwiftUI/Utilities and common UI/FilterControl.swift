//
//  FilterControl.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct FilterControl: View {
    @Binding var filter: String
    
    var body: some View {
        TextField("Filter…", text: $filter)
            .padding(.leading)
            .modifier(TextFieldClearButton(text: $filter))
            .frame(height: 28)
            .background(Color(UIColor.systemBackground))
    }
}

struct FilterControl_Previews: PreviewProvider {
    static var previews: some View {
        FilterControl(filter: Binding(
            get: { "" },
            set: { _ in }))
    }
}
