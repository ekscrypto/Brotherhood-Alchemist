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
    
    private var additionalInfo: some View {
        Text("Addtional info")
//        VStack {
//            ForEach(effects) { effect in
//                Text(~effect.name)
//            }
//        }
//        .padding(.bottom)
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
            selectionState: Binding(
                get: { .mayHave },
                set: { _ in /* ignored */ }))
    }
}
