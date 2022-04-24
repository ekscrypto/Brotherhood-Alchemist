//
//  IngredientDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-08.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@MainActor
struct IngredientDetails: View {
    @ObservedObject var ingredient: Ingredient
    let expanded: Bool
    let seekedEffect: SeekedEffect
    
    var body: some View {
        Self._printChanges()
        return VStack {
            Button(action: { rotateSelection() }) {
                HStack(spacing: 1) {
                    SelectionIndicator(state: ingredient.selection)
                    SelectionText(state: ingredient.selection)
                        .frame(width: 40)
                    Text(~ingredient.name)
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
    }
    
    private func rotateSelection() {
        switch ingredient.selection {
        case .mayHave:
            ingredient.selection = .mustHave
        case .mustHave:
            ingredient.selection = .cantHave
        case .cantHave:
            ingredient.selection = .mayHave
        }
    }
    
    private var additionalInfo: some View {
        VStack {
            
            if ingredient.effects.count == 0 {
                
                Text("This ingredient has no effects defined!")
                    .foregroundColor(Color(UIColor.systemRed))
                
            } else {
                
                Text("Effects:")
                    .font(Font.system(.caption))
                    .foregroundColor(Color("selectionText"))
                
                ForEach(ingredient.effects) { effect in
                    Button(action: {
                        seekedEffect.effect = effect
                    }) {
                        Text(~effect.name)
                    }
                }
                
            }
        }
        .padding(.bottom)
    }
}


struct IngredientDetails_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetails(
            ingredient: Ingredient(name: "Abecean Longfin", effects: []),
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Can't have - collapsed [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: Ingredient(name: "Nirnroot", effects: []),
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Can't have - collapsed [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)

        IngredientDetails(
            ingredient: Ingredient(name: "Wisp Wrappings", effects: []),
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("May have - collapsed [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: Ingredient(name: "Taproot", effects: []),
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("May have - collapsed [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)

        IngredientDetails(
            ingredient: Ingredient(name: "Ectoplasm", effects: [
                Effect(name: "Restore Magicka", value: 1, isPositive: true),
                Effect(name: "Forify Destruction", value: 1, isPositive: true),
                Effect(name: "Fortify Magicka", value: 1, isPositive: true),
                Effect(name: "Damage Health", value: 1, isPositive: false),
            ]),
            expanded: true,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Must have - expanded [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: Ingredient(name: "Falmer Ear", effects: [
                Effect(name: "Damage Health", value: 1, isPositive: false),
                Effect(name: "Frenzy", value: 1, isPositive: true),
                Effect(name: "Resist Poison", value: 1, isPositive: true),
                Effect(name: "Fortify Lockpicking", value: 1, isPositive: true),
            ]),
            expanded: true,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Must have - expanded [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
    }
}
