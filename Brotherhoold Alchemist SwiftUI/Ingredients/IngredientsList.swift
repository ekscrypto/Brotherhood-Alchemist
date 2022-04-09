//
//  IngredientsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct IngredientsList: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State var expanded: Bool = false
    @State var expandButtonText: String = "MORE"
    @State var controlButtonsWidth: CGFloat = .zero
    @State var showResetModal: Bool = false
    @State var filter: String = ""

    var filteredIngredients: [Ingredient] {
        viewModel.state.ingredients.filter(byName: filter)
    }

    var body: some View {
        ZStack {
            VStack(spacing: 1) {
                VStack(spacing: 0) {
                    Color((UIColor.systemBackground))
                        .frame(height: 1)
                    header
                        .background(Color(UIColor.systemBackground))
                    
                    TextField("Filter…", text: $filter)
                        .padding(.leading)
                        .modifier(TextFieldClearButton(text: $filter))
                        .frame(height: 28)
                        .background(Color(UIColor.systemBackground))
                }

                ScrollView(showsIndicators: false) {
                    listOfIngredients
                }
                .background(Color(UIColor.systemBackground))
            }
            .blur(radius: showResetModal ? 4 : 0)
            .allowsHitTesting(!showResetModal)

            if showResetModal {
                ResetModal(
                    viewModel: viewModel,
                    queryText: "Set all ingredients as:",
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
    }
    
    private var ingredientsTitle: some View {
        Text("Ingredients")
            .font(.system(.headline))
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
            .padding(.leading)
            .background(Color("itemBackground"))
    }
    
    private var expandButton: some View {
        Button(action: {
            expandButtonText = expanded ? "MORE" : "LESS"
            DispatchQueue.main.async {
                withAnimation {
                    expanded = !expanded
                }
            }
        }) {
            Text(expandButtonText)
                .font(.system(.callout))
                .frame(minWidth: controlButtonsWidth,
                       maxHeight: .infinity)
                .overlay(MinWidthCoordinator(via: $controlButtonsWidth))
                .padding([.leading, .trailing])
                .background(Color("itemBackground"))
        }
    }
    
    private var resetButton: some View {
        Button(action: {
            withAnimation {
                showResetModal = true
            }
        }) {
            Text("RESET")
                .font(.system(.callout))
                .frame(minWidth: controlButtonsWidth,
                       maxHeight: .infinity)
                .overlay(MinWidthCoordinator(via: $controlButtonsWidth))
                .padding([.leading, .trailing])
                .background(Color("itemBackground"))
        }
    }
    
    private var header: some View {
        HStack(spacing: 1) {
            ingredientsTitle
            expandButton
            resetButton
        }
        .frame(maxWidth: .infinity)
        .frame(height: 28)
    }
    
    private var listOfIngredients: some View {
        LazyVStack(spacing: 1) {
            ForEach(filteredIngredients) { ingredient in
                ingredientInfo(ingredient)
            }
        }
    }
    
    private func ingredientInfo(_ ingredient: Ingredient) -> some View {
        IngredientDetails(
            ingredient: ingredient,
            effects: viewModel.effects(for: ingredient),
            expanded: expanded,
            selectionState: viewModel.selection(for: ingredient))
    }
}

struct IngredientsList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsList(viewModel: ViewModel())
    }
}
