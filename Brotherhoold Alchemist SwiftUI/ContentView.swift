//
//  ContentView.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel: ViewModel = .init()
    
    var body: some View {
        ZStack {
            //        EffectsList()
            IngredientsList(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
