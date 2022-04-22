//
//  IngredientDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-08.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct IngredientDetails: View {
    let ingredient: Ingredient
    let expanded: Bool
    let seekedEffect: SeekedEffect
    
    @State var revision: Int = 0
    
    private var effects: [Effect] {
        ingredient.effects.compactMap { $0.ref }
    }

    var body: some View {
        _ = revision
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
        .onReceive(ingredient.$selection) { _ in
            revision += 1
        }
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
                
                ForEach(effects) { effect in
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
            ingredient: DefaultIngredients.abeceanLongfin,
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Can't have - collapsed [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: DefaultIngredients.nirnroot,
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Can't have - collapsed [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)

        IngredientDetails(
            ingredient: DefaultIngredients.wispWrappings,
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("May have - collapsed [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: DefaultIngredients.taproot,
            expanded: false,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("May have - collapsed [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)

        IngredientDetails(
            ingredient: DefaultIngredients.ectoplasm,
            expanded: true,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Must have - expanded [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: DefaultIngredients.falmerEar,
            expanded: true,
            seekedEffect: .init())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Must have - expanded [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
    }
}
