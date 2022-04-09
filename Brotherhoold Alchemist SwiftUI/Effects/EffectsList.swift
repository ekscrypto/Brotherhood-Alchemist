//
//  EffectsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct EffectsList: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var expanded: Bool = false
    @State private var filter: String = ""
    @State private var showResetModal: Bool = false
    
    let listBottomPadding: CGFloat
    let onSeekIngredient: (Ingredient) -> Void
    let seekedEffect: Effect?

    private var filteredEffects: [Effect] {
        viewModel.state.effects.filter(byName: filter)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 1) {
                Color((UIColor.systemBackground))
                    .frame(height: 1)
                
                ListHeader(
                    expanded: $expanded,
                    showResetModal: $showResetModal,
                    title: "Effects")
                
                FilterControl(filter: $filter)
                
                listOfEffects
            }
            .blur(radius: showResetModal ? 4 : 0)
            .allowsHitTesting(!showResetModal)

            if showResetModal {
                ResetModal(
                    queryText: "Set all effects as:",
                    resetAction: { viewModel.resetEffects(to: $0) },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
    }
    
    private func effectInfo(_ effect: Effect) -> some View {
        EffectDetails(
            effect: effect,
            ingredients: expanded ? viewModel.ingredients(for: effect) : [],
            expanded: expanded,
            onSeekIngredient: onSeekIngredient,
            selectionState: viewModel.selection(for: effect))
    }
    
    private var listOfEffects: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { scrollView in
                LazyVStack {
                    ForEach(filteredEffects) { effect in
                        effectInfo(effect)
                            .id(effect.id)
                    }
                }
                .onChange(of: seekedEffect, perform: { newValue in
                    if let desiredEffect = newValue {
                        filter = "=\(~desiredEffect.name)"
                        expanded = true
                    }
                })
            }
            
            Color.clear
                .frame(height: listBottomPadding)
        }
    }
}

struct EffectsList_Previews: PreviewProvider {
    
    static var previews: some View {
        EffectsList(
            viewModel: ViewModel(),
            listBottomPadding: 0,
            onSeekIngredient: { _ in /* ignored */ },
            seekedEffect: nil)
    }
}
