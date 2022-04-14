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
    let onSeekEffect: (Effect) -> Void

    var body: some View {
        VStack {
            Button(action: {
                rotateSelection()
            }) {
                HStack(spacing: 1) {
                    SelectionIndicator(state: ingredient.selection.state)
                    SelectionText(state: ingredient.selection.state)
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
                        onSeekEffect(effect)
                    }) {
                        Text(~effect.name)
                    }
                }
                
            }
        }
        .padding(.bottom)
    }
    
    private func rotateSelection() {
        switch ingredient.selection.state {
        case .cantHave:
            ingredient.selection.state = .mayHave
        case .mayHave:
            ingredient.selection.state = .mustHave
        case .mustHave:
            ingredient.selection.state = .cantHave
        }
    }
}

struct IngredientDetails_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetails(
            ingredient: DefaultIngredients.abeceanLongfin,
            expanded: false,
            onSeekEffect: { _ in /* ignored */ })
        .previewDisplayName("Can't have - collapsed [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        
        IngredientDetails(
            ingredient: DefaultIngredients.nirnroot,
            expanded: false,
            onSeekEffect: { _ in /* ignored */ })
        .previewDisplayName("Can't have - collapsed [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
        
        IngredientDetails(
            ingredient: DefaultIngredients.wispWrappings,
            expanded: false,
            onSeekEffect: { _ in /* ignored */ })
        .previewDisplayName("May have - collapsed [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        
        IngredientDetails(
            ingredient: DefaultIngredients.taproot,
            expanded: false,
            onSeekEffect: { _ in /* ignored */ })
        .previewDisplayName("May have - collapsed [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)

        IngredientDetails(
            ingredient: DefaultIngredients.ectoplasm,
            expanded: true,
            onSeekEffect: { _ in /* ignored */ })
        .previewDisplayName("Must have - expanded [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        
        IngredientDetails(
            ingredient: DefaultIngredients.falmerEar,
            expanded: true,
            onSeekEffect: { _ in /* ignored */ })
        .previewDisplayName("Must have - expanded [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
    }
}
