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
    
    @State var selection: SelectionState
    
    init(effect providedEffect: Effect,
         ingredients providedIngredients: [Ingredient],
         expanded displayExpanded: Bool,
         onSeekIngredient providedOnSeekIngredient: @escaping (Ingredient) -> Void) {
        effect = providedEffect
        ingredients = providedIngredients
        expanded = displayExpanded
        onSeekIngredient = providedOnSeekIngredient
        selection = effect.selection
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
        .onReceive(effect.$selection) { updatedSelection in
            selection = updatedSelection
        }
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
                    onSeekIngredient(ingredient)
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
            ingredients: DefaultIngredients.all.with(effect: ~DefaultEffects.fear),
            expanded: false,
            onSeekIngredient: { _ in /* ignored */ })
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: ~DefaultEffects.paralysis,
            ingredients: DefaultIngredients.all.with(effect: ~DefaultEffects.paralysis),
            expanded: true,
            onSeekIngredient: { _ in /* ignored */ })
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: ~DefaultEffects.fortifySneak,
            ingredients: DefaultIngredients.all.with(effect: ~DefaultEffects.fortifySneak),
            expanded: true,
            onSeekIngredient: { _ in /* ignored */ })
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: Self.emptyEffect,
            ingredients: [],
            expanded: true,
            onSeekIngredient: { _ in /* ignored */ })
        .preferredColorScheme(.light)
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: Self.emptyEffect,
            ingredients: [],
            expanded: true,
            onSeekIngredient: { _ in /* ignored */ })
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
