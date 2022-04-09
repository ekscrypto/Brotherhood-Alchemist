//
//  EffectsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct EffectsList: View {
    
    @ObservedObject var viewModel: EffectsListViewModel = .init()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            titleAndSelectors
            textfield
            list
        }
    }
    
    private var titleAndSelectors: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                disableAllControl
                    .frame(width: 90.0)
                    .background(Color(UIColor.systemGray4))
                    .padding(.trailing, 2.0)

//                enableAllControl
//                    .frame(width: 60.0)
//                    .padding([.leading, .trailing], 3.0)
//                    .background(Color(UIColor.systemGray2))

                Text("Effects")
                    .frame(width: geometry.size.width - 92.0)
                    .background(Color(UIColor.systemGray4))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 24.0)
    }
    
    private var disableAllControl: some View {
        Button(action: {
            viewModel.disableAllEffects()
        }) { Text("TOGGLE") }
    }
    
    private var enableAllControl: some View {
        Button(action: {
            viewModel.enableAllEffects()
        }) { Text("ALL") }
    }
    
    private var textfield: some View {
        TextField("Search effect by name…", text: $viewModel.filter)
            .lineLimit(1)
            .modifier(TextFieldClearButton(text: $viewModel.filter))
    }
    
    private var list: some View {
        LazyVStack(alignment: .leading, spacing: 2.0) {
            ForEach(viewModel.state.effects) { effect in
                viewModel.effectDetails(effect)
            }
        }
    }
}

struct EffectsList_Previews: PreviewProvider {
    
    static var previews: some View {
        EffectsList()
    }
}
