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
    let onTapHeader: () -> Void
    let onTapShowIngredients: () -> Void
 
    @Binding var enabled: Bool
    @Binding var showExpandedInfo: Bool
    @Binding var knownMatchingIngredients: [Ingredient]?
    
    private var matchingIngredientsCount: String {
        if let knownIngredients = knownMatchingIngredients {
            return "\(knownIngredients.count)"
        }
        return "…"
    }
    
    var body: some View {
        VStack {
            
            nameAndToggle
            
            if showExpandedInfo {
                expandedInfo
            }
        }
    }
    
    private var nameAndToggle: some View {
        HStack {
            Toggle("", isOn: $enabled)
            
            Button(action: {
                withAnimation {
                    onTapHeader()
                }
            }) {
                Text(~effect.name)
                    .padding(.leading, 4)
                Spacer()
            }
            .foregroundColor(effect.isPositive ? Color.green : Color.red)
            .layoutPriority(.infinity)
        }
    }
    
    private var expandedInfo: some View {
        VStack {
            Text("Positive Effect: \(String(effect.isPositive))")
            Button(action: {
                onTapShowIngredients()
            }) {
                Text("Ingredients with this effect: \(matchingIngredientsCount)")
            }
        }
        .padding()
    }
                   

}

struct EffectDetails_Previews: PreviewProvider {
    static var previews: some View {
        EffectDetails(
            effect: Effect(
                id: 1,
                name: "Tree Root",
                value: 75,
                isPositive: true),
            onTapHeader: { },
            onTapShowIngredients: { },
            enabled: Binding(get: { true }, set: { _ in }),
            showExpandedInfo: Binding(get: { true }, set: { _ in }),
            knownMatchingIngredients: Binding(get: { nil }, set: { _ in }))
    }
}
