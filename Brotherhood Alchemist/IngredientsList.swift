//
//  IngredientsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import DomainLogic

@MainActor
struct IngredientsList: View {

    let listBottomPadding: CGFloat
    let seekedEffect: SeekedEffect
    let seekedIngredient: SeekedIngredient

    @EnvironmentObject var appViewModel: AppViewModel

    @State var controlButtonsWidth: CGFloat = .zero
    @State var expanded: Bool = false
    @State var filter: String = ""
    @State var showResetModal: Bool = false

    private var filteredIngredients: [ViewRep.Ingredient] {
        guard let ingredients = appViewModel.viewRep?.ingredients else { return [] }
        let trimmed = filter.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmed.isEmpty { return ingredients }
        if trimmed.hasPrefix("=") {
            let expected = String(trimmed.dropFirst())
            return ingredients.filter { $0.name.lowercased() == expected }
        }
        return ingredients.filter { $0.name.localizedCaseInsensitiveContains(trimmed) }
    }

    // MARK: -
    var body: some View {
        return ZStack {
            VStack(spacing: 1) {
                Color((UIColor.systemBackground))
                    .frame(height: 1)

                ListHeader(
                    expanded: $expanded,
                    showResetModal: $showResetModal,
                    title: "Ingredients")

                FilterControl(filter: $filter)

                listOfIngredients
            }
            .blur(radius: showResetModal ? 4 : 0)
            .allowsHitTesting(!showResetModal)

            if showResetModal {
                ResetModal(
                    queryText: "Set all ingredients as:",
                    resetAction: {
                        appViewModel.resetAllIngredients(to: $0)
                    },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
        .onReceive(seekedIngredient.$name) { nameOrNil in
            guard let name = nameOrNil else { return }
            filter = "=\(name)"
            expanded = true
        }
    }

    // MARK: -

    private var listOfIngredients: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { scrollView in

                LazyVStack(spacing: 1) {
                    ForEach(filteredIngredients) { ingredient in
                        IngredientDetails(
                            ingredient: ingredient,
                            expanded: expanded,
                            seekedEffect: seekedEffect)
                    }
                }

                Color.clear
                    .frame(height: listBottomPadding)
            }
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct IngredientsList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsList(
            listBottomPadding: 0,
            seekedEffect: .init(),
            seekedIngredient: .init())
        .environmentObject(AppViewModel())

        IngredientsList(
            listBottomPadding: 0,
            seekedEffect: .init(),
            seekedIngredient: .init())
        .environmentObject(AppViewModel())
    }
}
