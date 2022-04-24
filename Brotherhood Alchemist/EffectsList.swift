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

    @State private var expanded: Bool = false
    @State private var filter: String = ""
    @State private var showResetModal: Bool = false
    @State private var filteredEffects: [Effect] = []

    @MainActor
    func updateFilteredEffects() {
            filteredEffects = Registry.active.effects(filteredBy: filter)
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
                    resetAction: {
                            Registry.active.resetEffects(to: $0)
                    },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
        .onChange(of: filter, perform: { _ in
            updateFilteredEffects()
        })
        .onReceive(seekedEffect.$effect, perform: { effectOrNil in
            guard let effect = effectOrNil else { return }
            filter = "=\(~effect.name)"
            expanded = true
        })
        .onReceive(Registry.active.$effects) { _ in
            updateFilteredEffects()
        }
    }
    
    @MainActor
    private func onReset(_ selection: SelectionState) {
        Registry.active.resetEffects(to: selection)
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
