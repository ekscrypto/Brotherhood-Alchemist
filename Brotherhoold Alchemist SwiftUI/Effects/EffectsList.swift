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
    @ObservedObject var seekedEffect: ViewModel.SeekedEffect

    init(viewModel providedViewModel: ViewModel,
         listBottomPadding desiredBottomPadding: CGFloat) {
        viewModel = providedViewModel
        listBottomPadding = desiredBottomPadding
        seekedEffect = viewModel.seekedEffect
    }
    
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
        .onReceive(seekedEffect.$value, perform: { effectOrNil in
            guard let effect = effectOrNil else { return }
            filter = "=\(~effect.name)"
            expanded = true
            seekedEffect.value = nil
        })
    }
    
    private func effectInfo(_ effect: Effect) -> some View {
        EffectDetails(
            effect: effect,
            ingredients: expanded ? viewModel.ingredients(for: effect) : [],
            expanded: expanded,
            onSeekIngredient: { viewModel.seekedIngredient.value = $0 },
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
