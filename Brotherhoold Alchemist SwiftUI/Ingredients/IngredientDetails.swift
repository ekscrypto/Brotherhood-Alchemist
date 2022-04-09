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
    let effects: [Effect]
    let expanded: Bool
    @Binding var selectionState: SelectionState

    var body: some View {
        VStack {
            Button(action: {
                rotateSelection()
            }) {
                HStack(spacing: 1) {
                    selectionIndicator
                    SelectionText(state: selectionState)
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
            ForEach(effects) { effect in
                Text(~effect.name)
            }
        }
        .padding(.bottom)
    }
    
    private func rotateSelection() {
        switch selectionState {
        case .cantHave:
            selectionState = .mayHave
        case .mayHave:
            selectionState = .mustHave
        case .mustHave:
            selectionState = .cantHave
        }
    }
    
    private var selectionIndicator: some View {
        VStack {
            switch selectionState {
            case .cantHave:
                SelectionIndicatorCant()
            case .mayHave:
                SelectionIndicatorMay()
            case .mustHave:
                SelectionIndicatorMust()
            }
        }
    }
}

struct IngredientDetails_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetails(
            ingredient: Ingredient(id: 1, name: "Powdered Mammoth Tusk", effects: [])!,
            effects: IngredientEffectsAdapter.effects(
                from: DefaultIngredients.all.first!,
                sourcing: DefaultEffects.all),
            expanded: false,
            selectionState: Binding(
                get: { .cantHave },
                set: { _ in /* do nothing */ }))
        .previewDisplayName("Can't have - collapsed")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        
        IngredientDetails(
            ingredient: Ingredient(id: 1, name: "Powdered Mammoth Tusk", effects: [])!,
            effects: IngredientEffectsAdapter.effects(
                from: DefaultIngredients.all.first!,
                sourcing: DefaultEffects.all),
            expanded: false,
            selectionState: Binding(
                get: { .mayHave },
                set: { _ in /* do nothing */ }))
        .previewDisplayName("May have - collapsed")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: Ingredient(id: 1, name: "Powdered Mammoth Tusk", effects: [])!,
            effects: IngredientEffectsAdapter.effects(
                from: DefaultIngredients.all.first!,
                sourcing: DefaultEffects.all),
            expanded: true,
            selectionState: Binding(
                get: { .mustHave },
                set: { _ in /* do nothing */ }))
        .previewDisplayName("Must have - expanded")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
