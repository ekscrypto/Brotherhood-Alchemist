//
//  IngredientsList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct IngredientsList: View {
    
    @ObservedObject var viewModel: IngredientsListViewModel = .init()
    @State var expanded: Bool = false
    @State var expandButtonText: String = "MORE"
    @State var controlButtonsWidth: CGFloat = .zero
    @State var showResetModal: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 1) {
                VStack(spacing: 0) {
                    Color("itemBackground")
                        .frame(height: 1)
                    header
                    Color("itemBackground")
                        .frame(height: 1)
                    TextField("Filter…", text: $viewModel.filter)
                        .padding(.leading)
                        .modifier(TextFieldClearButton(text: $viewModel.filter))
                        .frame(height: 28)
                }
                ScrollView(showsIndicators: false) {
                    listOfIngredients
                }
            }
            .blur(radius: showResetModal ? 4 : 0)
            .allowsHitTesting(!showResetModal)

            if showResetModal {
                resetModal
            }
        }
    }
    
    private var resetCantHaveButton: some View {
        Button("Can't have", action: {
            viewModel.resetAll(to: .cantHave)
            dismissResetModal()
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("itemBackground"))
        .cornerRadius(6.0)
    }
    
    private var resetMayHaveButton: some View {
        Button("May have", action: {
            viewModel.resetAll(to: .mayHave)
            dismissResetModal()
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("itemBackground"))
        .cornerRadius(6.0)
    }
    
    private var resetCancelButton: some View {
        Button("Cancel", action: {
            dismissResetModal()
        })
        .foregroundColor(Color.red)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("itemBackground"))
        .cornerRadius(6.0)
    }
    
    private func dismissResetModal() {
        DispatchQueue.main.async {
            withAnimation {
                showResetModal = false
            }
        }

    }
    
    private var resetModal: some View {
        VStack {
            Spacer()

            VStack {
                VStack {
                    Text("Set all ingredients as:")
                    resetCantHaveButton
                    resetMayHaveButton
                    resetCancelButton
                }
                .padding()
            }
            .frame(maxWidth: 300)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(20.0)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                .overlay(DetermineWidth())
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
                .overlay(DetermineWidth())
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
        .onPreferenceChange(DetermineWidth.Key.self) {
            controlButtonsWidth = $0
        }
    }
    
    private var listOfIngredients: some View {
        LazyVStack(spacing: 1) {
            ForEach(viewModel.state.ingredients) { ingredient in
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
        IngredientsList()
    }
}
