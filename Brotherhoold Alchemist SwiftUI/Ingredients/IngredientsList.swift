//
//  IngredientsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct IngredientsList: View {
    
    let viewModel: ViewModel
    let listBottomPadding: CGFloat

    @State var expanded: Bool = false
    @State var expandButtonText: String = "MORE"
    @State var controlButtonsWidth: CGFloat = .zero
    @State var showResetModal: Bool = false
    @State var filter: String = ""
    @State var ingredients: [Ingredient] = []
    
    private var filteredIngredients: [Ingredient] {
        viewModel.ingredients.filter(byName: filter)
    }
    
    init(viewModel providedViewModel: ViewModel,
         listBottomPadding desiredBottomPadding: CGFloat) {
        viewModel = providedViewModel
        listBottomPadding = desiredBottomPadding
    }
    
    // MARK: -
    var body: some View {
        ZStack {
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
                    resetAction: { _ in /*viewModel.resetIngredients(to: $0)*/ },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
        .onReceive(viewModel.$ingredients, perform: { updatedIngredients in
            ingredients = updatedIngredients
        })
        .onReceive(viewModel.$seekedIngredient, perform: { ingredientOrNil in
            guard let ingredient = ingredientOrNil else { return }
            filter = "=\(~ingredient.name)"
            expanded = true
        })
    }
    
    // MARK: -
    
    private func ingredientInfo(_ ingredient: Ingredient) -> some View {
        IngredientDetails(
            ingredient: ingredient,
            expanded: expanded,
            onSeekEffect: { viewModel.seekedEffect = $0 })
    }
    
    private var listOfIngredients: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { scrollView in
                
                LazyVStack(spacing: 1) {
                    ForEach(filteredIngredients) { ingredient in
                        ingredientInfo(ingredient)
                            .id(ingredient.id)
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
            viewModel: ViewModel(),
            listBottomPadding: 0)
            .preferredColorScheme(.light)
            .previewDisplayName("Light")
            .previewDevice("iPhone 13 Pro")

        IngredientsList(
            viewModel: ViewModel(),
            listBottomPadding: 0)
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark")
            .previewDevice("iPhone 13 Pro")
    }
}
