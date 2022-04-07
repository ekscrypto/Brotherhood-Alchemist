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
            TextField("Search effect by name…", text: $viewModel.filter)
                .lineLimit(1)
                .modifier(TextFieldClearButton(text: $viewModel.filter))
            
            LazyVStack(alignment: .leading, spacing: 2.0) {
                ForEach(viewModel.state.effects) { effect in
                    viewModel.effectDetails(effect)
                }
            }
        }
    }
}

struct EffectsList_Previews: PreviewProvider {
    
    static var previews: some View {
        EffectsList()
    }
}
