//
//  EffectsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import Combine
import DomainLogic

@MainActor
struct EffectsList: View {

    let listBottomPadding: CGFloat
    let seekedEffect: SeekedEffect
    let seekedIngredient: SeekedIngredient

    @EnvironmentObject var appViewModel: AppViewModel

    @State private var expanded: Bool = false
    @State private var filter: String = ""
    @State private var showResetModal: Bool = false

    private var filteredEffects: [ViewRep.Effect] {
        guard let effects = appViewModel.viewRep?.effects else { return [] }
        let trimmed = filter.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmed.isEmpty { return effects }
        if trimmed.hasPrefix("=") {
            let expected = String(trimmed.dropFirst())
            return effects.filter { $0.name.lowercased() == expected }
        }
        return effects.filter { $0.name.localizedCaseInsensitiveContains(trimmed) }
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
                        appViewModel.resetAllEffects(to: $0)
                    },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
        .onReceive(seekedEffect.$name, perform: { nameOrNil in
            guard let name = nameOrNil else { return }
            filter = "=\(name)"
            expanded = true
        })
    }

    private var listOfEffects: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { scrollView in
                LazyVStack(spacing: 1) {
                    ForEach(filteredEffects) { effect in
                        EffectDetails(
                            effect: effect,
                            expanded: expanded,
                            seekedIngredient: seekedIngredient)
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
        .environmentObject(AppViewModel())
        .preferredColorScheme(.light)

        EffectsList(
            listBottomPadding: 0,
            seekedEffect: .init(),
            seekedIngredient: .init())
        .environmentObject(AppViewModel())
        .preferredColorScheme(.dark)
    }
}
