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
    let ingredients: [Ingredient]
    let expanded: Bool
    let onSeekIngredient: (Ingredient) -> Void
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
    }
    
    private var positiveOrNegativeText: String {
        if effect.isPositive {
            return "Good for you :)"
        }
        
        return "Please don't use this on yourself!"
    }
    
    private var additionalInfo: some View {
        VStack {
            Text(positiveOrNegativeText)
                .font(Font.system(.caption))
                .padding(.bottom)

            if ingredients.count == 0 {
                
                Text("This effect is not part of any ingredient!")
                    .foregroundColor(Color(UIColor.systemRed))
                
            } else {
                
                Text("Found in \(ingredients.count) ingredient(s):")
                    .font(Font.system(.caption))
                    .foregroundColor(Color("selectionText"))

                ForEach(ingredients) { ingredient in
                    Button(action: {
                        onSeekIngredient(ingredient)
                    }) {
                        Text(~ingredient.name)
                    }
                }
                
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

struct EffectDetails_Previews: PreviewProvider {
    static var previews: some View {
        EffectDetails(
            effect: DefaultEffects.all.first!,
            ingredients: DefaultIngredients.all.with(effect: DefaultEffects.all.first!),
            expanded: false,
            onSeekIngredient: { _ in /* ignored */ },
            selectionState: Binding(
                get: { .mayHave },
                set: { _ in /* ignored */ }))
    }
}
