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
                    selectionText
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
    
    private var selectionIndicator: some View {
        VStack {
            switch selectionState {
            case .cantHave:
                selectionCant
            case .mayHave:
                selectionMay
            case .mustHave:
                selectionMust
            }
        }
    }
    
    private var selectionText: some View {
        let description: String
        switch selectionState {
        case .cantHave:
            description = "can't"
        case .mayHave:
            description = "may"
        case .mustHave:
            description = "must"
        }
        
        return VStack(spacing: 0) {
            Text(description)
            Text("have")
        }
        .font(.system(.caption))
        .foregroundColor(Color("selectionText"))
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
    
    private var selectionCant: some View {
        RoundedRectangle(cornerRadius: 3.0)
            .foregroundColor(Color.clear)
            .frame(width: 24, height: 24)
            .overlay(
                RoundedRectangle(cornerRadius: 3.0)
                    .stroke(Color("selectionBorder"), lineWidth: 2.0)
            )
            .padding(6.0)
    }
    
    private var selectionMay: some View {
        RoundedRectangle(cornerRadius: 3.0)
            .foregroundColor(Color.clear)
            .frame(width: 24, height: 24)
            .overlay(
                RoundedRectangle(cornerRadius: 3.0)
                    .stroke(Color("selectionBorder"), lineWidth: 2.0)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6.0)
                    .scaleEffect(x: 0.5, y: 0.5, anchor: UnitPoint.center)
                    .foregroundColor(Color("selectionMust"))
            )
            .padding(6.0)
    }
    
    private var additionalInfo: some View {
        VStack {
            ForEach(effects) { effect in
                Text(~effect.name)
            }
        }
        .padding(.bottom)
    }
    
    private var selectionMust: some View {
        RoundedRectangle(cornerRadius: 3.0)
            .foregroundColor(Color("selectionMust"))
            .frame(width: 24, height: 24)
            .overlay(
                RoundedRectangle(cornerRadius: 3.0)
                    .stroke(Color("selectionBorder"), lineWidth: 2.0)
            )
            .padding(6.0)
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
        .preferredColorScheme(.dark)
    }
}
