//
//  EffectDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@MainActor
struct EffectDetails: View {
    @ObservedObject var effect: Effect
    let expanded: Bool
    let seekedIngredient: SeekedIngredient
    
//    @State var isPositive: Bool = false
//    @State var name: String = ""
//    @State var ingredients: [Ingredient] = []
//    @State var value: UInt = 0
//    @State var selection: SelectionState = .mayHave
    
    var body: some View {
        VStack {
            Button(action: {
                rotateSelection()
            }) {
                HStack(spacing: 1) {
                    SelectionIndicator(state: effect.selection)
                    SelectionText(state: effect.selection)
                        .frame(width: 40)
                    Text(~effect.name)
                        .font(.system(.headline))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("itemForeground"))
                }
            }
            
            if expanded {
                additionalInfo
            }
        }
        .background(Color("itemBackground"))
//        .onReceive(effect.$selection) { updatedSelection in
//            selection = updatedSelection
//        }
//        .onReceive(effect.$ingredients) { updatedIngredients in
//            ingredients = updatedIngredients
//        }
//        .onReceive(effect.$isPositive) { updatedIsPositive in
//            isPositive = updatedIsPositive
//        }
//        .onReceive(effect.$name) { updatedName in
//            name = ~updatedName
//        }
//        .onReceive(effect.$value) { updatedValue in
//            value = updatedValue.rawValue
//        }
    }
    
    private var positiveOrNegativeText: String {
        effect.isPositive ? "Good for you :)" : "Please don't use this on yourself!"
    }
    
    private var additionalInfo: some View {
        VStack {
            Text(positiveOrNegativeText)
                .font(Font.system(.caption))
            Text("Base value: \(effect.value.rawValue) septims")
                .font(Font.system(.caption))
                .padding(.bottom)

            if effect.ingredients.count == 0 {
                Text("This effect is not part of any ingredient!")
                    .foregroundColor(Color(UIColor.systemRed))
            } else {
                ingredientsList
            }
        }
        .padding(.bottom)
    }
    
    private var ingredientsList: some View {
        VStack {
            Text("Found in \(effect.ingredients.count) ingredient(s):")
                .font(Font.system(.caption))
                .foregroundColor(Color("selectionText"))
            
            ForEach(effect.ingredients) { ingredient in
                Button(action: {
                    seekedIngredient.ingredient = ingredient
                }) {
                    Text(~ingredient.name)
                }
            }
        }
    }
    
    private func rotateSelection() {
        switch effect.selection {
        case .cantHave:
            Registry.active.select(effect: effect, as: .mayHave)
        case .mayHave:
            Registry.active.select(effect: effect, as: .mustHave)
        case .mustHave:
            Registry.active.select(effect: effect, as: .cantHave)
        }
    }
}

struct EffectDetails_Previews: PreviewProvider {
    static var previews: some View {
        EffectDetails(
            effect: Effect(name: "Fear", value: 100, isPositive: false),
            expanded: false,
            seekedIngredient: .init())
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: Effect(name: "Fear", value: 88, isPositive: false),
            expanded: true,
            seekedIngredient: .init())
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: Effect(name: "Fortify Sneak", value: 17, isPositive: true),
            expanded: true,
            seekedIngredient: .init())
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: Self.emptyEffect,
            expanded: true,
            seekedIngredient: .init())
        .preferredColorScheme(.light)
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: Self.emptyEffect,
            expanded: true,
            seekedIngredient: .init())
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
    
    static var emptyEffect: Effect {
        Effect(
            name: "Empty Effect",
            value: 9,
            isPositive: false)
    }
}
