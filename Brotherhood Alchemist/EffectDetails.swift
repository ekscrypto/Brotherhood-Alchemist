//
//  EffectDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct EffectDetails: View {
    let effect: Effect
    let expanded: Bool
    let seekedIngredient: SeekedIngredient
    
    @State var revision: Int = 0
    
    private var ingredients: [Ingredient] {
        effect.ingredients.compactMap { $0.ref }
    }
    
    var body: some View {
        _ = revision
        return VStack {
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
        .onReceive(effect.$selection) { _ in
            revision += 1
        }
        .onReceive(effect.$ingredients) { _ in
            revision += 1
        }
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

            if ingredients.count == 0 {
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
            Text("Found in \(ingredients.count) ingredient(s):")
                .font(Font.system(.caption))
                .foregroundColor(Color("selectionText"))
            
            ForEach(ingredients) { ingredient in
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
            effect.selection = .mayHave
        case .mayHave:
            effect.selection = .mustHave
        case .mustHave:
            effect.selection = .cantHave
        }
    }
}

struct EffectDetails_Previews: PreviewProvider {
    static var previews: some View {
        EffectDetails(
            effect: ~DefaultEffects.fear,
            expanded: false,
            seekedIngredient: .init())
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: ~DefaultEffects.paralysis,
            expanded: true,
            seekedIngredient: .init())
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: ~DefaultEffects.fortifySneak,
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
