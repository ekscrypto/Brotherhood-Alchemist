//
//  IngredientsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@MainActor
struct IngredientsList: View {

    let listBottomPadding: CGFloat
    let seekedEffect: SeekedEffect
    let seekedIngredient: SeekedIngredient

    @State var controlButtonsWidth: CGFloat = .zero
    @State var expanded: Bool = false
    @State var filter: String = "" {
        didSet { updateFilteredIngredients() }
    }
    @State var showResetModal: Bool = false
    @State var filteredIngredients: [Ingredient] = []
    
    @MainActor
    private func updateFilteredIngredients() {
        filteredIngredients = Registry.active.ingredients(filteredBy: filter)
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
                        Registry.active.resetIngredients(to: $0)
                    },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
        .onChange(of: filter, perform: { _ in
            updateFilteredIngredients()
        })
        .onReceive(Registry.active.$ingredients) { _ in updateFilteredIngredients()
        }
        .onReceive(seekedIngredient.$ingredient) { ingredientOrNil in
            guard let ingredient = ingredientOrNil else { return }
            filter = "=\(~ingredient.name)"
            expanded = true
        }
    }
    
//    private func onReset(_ selection: SelectionState) {
//        Registry.active.resetIngredients(to: selection)
//    }
    
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
//            .preferredColorScheme(.light)
//            .previewDisplayName("Light")
//            .previewDevice("iPhone 14")

        IngredientsList(
            listBottomPadding: 0,
            seekedEffect: .init(),
            seekedIngredient: .init())
//            .preferredColorScheme(.dark)
//            .previewDisplayName("Dark")
//            .previewDevice("iPhone 14")
    }
}
