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
    
    let listBottomPadding: CGFloat

    private var filteredIngredients: [Ingredient] {
        viewModel.state.ingredients.filter(byName: filter)
    }

    // MARK: -
    var body: some View {
        ZStack {
            VStack(spacing: 1) {
                Color((UIColor.systemBackground))
                    .frame(height: 1)
                
                header
                filterControl
                listOfIngredients
            }
            .blur(radius: showResetModal ? 4 : 0)
            .allowsHitTesting(!showResetModal)

            if showResetModal {
                ResetModal(
                    queryText: "Set all ingredients as:",
                    resetAction: { viewModel.resetIngredients(to: $0) },
                    visibility: $showResetModal)
            }
        }
        .background(Color("itemBackground"))
    }
    
    // MARK: -
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
    
    private var filterControl: some View {
        TextField("Filter…", text: $filter)
            .padding(.leading)
            .modifier(TextFieldClearButton(text: $filter))
            .frame(height: 28)
            .background(Color(UIColor.systemBackground))
    }
    
    private var header: some View {
        HStack(spacing: 1) {
            ingredientsTitle
            expandButton
            resetButton
        }
        .frame(maxWidth: .infinity)
        .frame(height: 28)
        .background(Color(UIColor.systemBackground))
    }
    
    private func ingredientInfo(_ ingredient: Ingredient) -> some View {
        IngredientDetails(
            ingredient: ingredient,
            effects: viewModel.effects(for: ingredient),
            expanded: expanded,
            selectionState: viewModel.selection(for: ingredient))
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
    
    private var listOfIngredients: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 1) {
                ForEach(filteredIngredients) { ingredient in
                    ingredientInfo(ingredient)
                }
            }
            
            Color.clear
                .frame(height: listBottomPadding)
        }
        .background(Color(UIColor.systemBackground))
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
