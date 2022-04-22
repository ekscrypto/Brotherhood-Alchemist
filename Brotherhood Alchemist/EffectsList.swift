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
    
    let listBottomPadding: CGFloat
    let seekedEffect: SeekedEffect
    let seekedIngredient: SeekedIngredient

    @State var effects: [Effect] = Effects.registry.all
    @State private var expanded: Bool = false
    @State private var filter: String = ""
    @State private var showResetModal: Bool = false
    
    private var filteredEffects: [Effect] {
        EffectsFilter(filter: filter, sourceEffects: effects).effects
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
                    resetAction: onReset,
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
        .onReceive(seekedEffect.$effect, perform: { effectOrNil in
            guard let effect = effectOrNil else { return }
            filter = "=\(~effect.name)"
            expanded = true
        })
        .onReceive(Effects.registry.$all) { updatedEffects in
            effects = updatedEffects
        }
    }
    
    private func onReset(_ selection: SelectionState) {
        effects.forEach { $0.selection = selection }
    }
    
    private func effectInfo(_ effect: Effect) -> some View {
        EffectDetails(
            effect: effect,
            expanded: expanded,
            seekedIngredient: seekedIngredient)
    }
    
    private var listOfEffects: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { scrollView in
                LazyVStack(spacing: 1) {
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
        .background(Color(UIColor.systemBackground))
    }
}

struct EffectsList_Previews: PreviewProvider {
    
    static var previews: some View {
        EffectsList(
            listBottomPadding: 0,
            seekedEffect: .init(),
            seekedIngredient: .init())
        .preferredColorScheme(.light)

        EffectsList(
            listBottomPadding: 0,
            seekedEffect: .init(),
            seekedIngredient: .init())
        .preferredColorScheme(.dark)
    }
}
