//
//  EffectsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import Combine

struct EffectsList: View {
    
    let viewModel: ViewModel
    let listBottomPadding: CGFloat

    @State private var expanded: Bool = false
    @State private var filter: String = ""
    @State private var showResetModal: Bool = false

    init(viewModel providedViewModel: ViewModel,
         listBottomPadding desiredBottomPadding: CGFloat) {
        viewModel = providedViewModel
        listBottomPadding = desiredBottomPadding
    }
    
    private var filteredEffects: [Effect] {
        viewModel.effects.filter(byName: filter)
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
                    resetAction: { _ in /* viewModel.resetEffects(to: $0)*/ },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
        .onReceive(viewModel.$seekedEffect, perform: { effectOrNil in
            guard let effect = effectOrNil else { return }
            filter = "=\(~effect.name)"
            expanded = true
        })
    }
    
    private func effectInfo(_ effect: Effect) -> some View {
        EffectDetails(
            effect: effect,
            ingredients: expanded ? viewModel.ingredients.with(effect: effect) : [],
            expanded: expanded,
            onSeekIngredient: { viewModel.seekedIngredient = $0 })
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
            }
            
            if filter.isEmpty {
                Credits()
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
            listBottomPadding: 0)
        .preferredColorScheme(.light)

        EffectsList(
            viewModel: ViewModel(),
            listBottomPadding: 0)
        .preferredColorScheme(.dark)
    }
}
