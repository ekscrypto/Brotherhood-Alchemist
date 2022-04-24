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

    @State var name: String
    @State var effects: [Effect]
    @State var selection: SelectionState

    init(ingredient providedIngredient: Ingredient,
         expanded displayExpanded: Bool,
         onSeekEffect providedOnSeekAction: @escaping (Effect) -> Void) {
        ingredient = providedIngredient
        expanded = displayExpanded
        onSeekEffect = providedOnSeekAction
        selection = ingredient.selection
        name = ~ingredient.name
        effects = ingredient.effects
    }
    
    var body: some View {
        VStack {
            Button(action: {
                rotateSelection()
            }) {
                HStack(spacing: 1) {
                    SelectionIndicator(state: selection)
                    SelectionText(state: selection)
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
        .onReceive(ingredient.$selection) { updatedSelection in
            selection = updatedSelection
        }
        .onReceive(ingredient.$name) { updatedName in
            name = ~updatedName
        }
        .onReceive(ingredient.$effects) { updatedEffects in
            effects = updatedEffects
        }
    }
    
    private var additionalInfo: some View {
        VStack {
            
            if effects.count == 0 {
                
                Text("This ingredient has no effects defined!")
                    .foregroundColor(Color(UIColor.systemRed))
                
            } else {
                
                Text("Effects:")
                    .font(Font.system(.caption))
                    .foregroundColor(Color("selectionText"))
                
                ForEach(effects) { effect in
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
        switch ingredient.selection {
        case .cantHave:
            ingredient.selection = .mayHave
        case .mayHave:
            ingredient.selection = .mustHave
        case .mustHave:
            ingredient.selection = .cantHave
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
