//
//  RecipeDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct RecipeDetails: View {
    let concoction: Concoction
    let effects: [Effect: SelectionState]
    let ingredients: [Ingredient: SelectionState]

    let onSeekEffect: (Effect) -> Void
    let onSeekIngredient: (Ingredient) -> Void
    
    private var sortedEffects: [Effect] {
        effects.keys.sorted(by: { ~$0.name < ~$1.name })
    }
    
    private var sortedIngredients: [Ingredient] {
        ingredients.keys.sorted(by: { ~$0.name < ~$1.name })
    }

    private func selectionState(_ effect: Effect) -> SelectionState {
        effects[effect] ?? .mayHave
    }
    
    private func selectionState(_ ingredient: Ingredient) -> SelectionState {
        ingredients[ingredient] ?? .mayHave
    }
    
    var body: some View {
        VStack(spacing: 2.0) {
            HStack(alignment: .bottom) {
                Text("Ingredients")
                    .font(Font.system(.caption))
                    .foregroundColor(Color("selectionText"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Estimated value:")
                    .font(Font.system(.caption))
                    .foregroundColor(Color("selectionText"))
                Text("$\(concoction.estimatedValue)")
                    .font(Font.system(.title))
            }
            .padding([.leading, .trailing])
            .padding(.bottom, 3.0)
            
            listOfIngredients

            Text("Effects")
                .font(Font.system(.caption))
                .foregroundColor(Color("selectionText"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            listOfEffects
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)
    }
    
    private var listOfEffects: some View {
        ForEach(sortedEffects) { effect in
            Button(action: {
                onSeekEffect(effect)
            }) {
                summaryOfEffect(effect)
            }
            .foregroundColor(Color(UIColor.systemBlue))
            .frame(height: 28)
            .padding([.leading, .trailing])
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(Color("itemBackground"))
            )
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing])
    }
    
    private func summaryOfEffect(_ effect: Effect) -> some View {
        HStack {
            let state = selectionState(effect)
            SelectionIndicator(state: state)
                .saturation(0.0)
            SelectionText(state: state)
                .frame(width: 40)
            Text(~effect.name)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.leading)
        }
    }
    
    private var listOfIngredients: some View {
        ForEach(sortedIngredients) { ingredient in
            Button(action: {
                onSeekIngredient(ingredient)
            }) {
                summaryOfIngredient(ingredient)
            }
            .foregroundColor(Color(UIColor.systemBlue))
            .frame(height: 28)
            .padding([.leading, .trailing])
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(Color("itemBackground"))
            )
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing])
    }
    
    private func summaryOfIngredient(_ ingredient: Ingredient) -> some View {
        HStack {
            let state = selectionState(ingredient)
            SelectionIndicator(state: state)
                .saturation(0.0)
            SelectionText(state: state)
                .frame(width: 40)
            Text(~ingredient.name)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.leading)
        }
    }
    
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(
            concoction: Concoction(
                effects: [
                    8, 9, 11, 12, 13
                ],
                ingredients: [1,2,3],
                estimatedValue: 689),
            effects: [
                PreviewIngredients.fear: .mayHave,
                PreviewIngredients.paralysis: .mustHave,
                PreviewIngredients.resistMagic: .mayHave,
                PreviewIngredients.fortifyCarryWeight: .mayHave,
                PreviewIngredients.restoreStamina: .mayHave
            ],
            ingredients: [
                PreviewIngredients.gleamblossom: .mayHave,
                PreviewIngredients.netchJelly: .mustHave,
                PreviewIngredients.wispWrappings: .mayHave
            ],
            onSeekEffect: { _ in /* ignored */ },
            onSeekIngredient: { _ in /* ignored */ })
    }

}

fileprivate class PreviewIngredients {
    static var fear: Effect {
        Effect(
            id: 8,
            name: "Fear",
            value: 28,
            isPositive: false)
    }
    static var paralysis: Effect {
        Effect(
            id: 9,
            name: "Paralysis",
            value: 120,
            isPositive: false)
    }
    static var regenerateHealth: Effect {
        Effect(
            id: 10,
            name: "Regenerate Health",
            value: 40,
            isPositive: true)
    }
    static var resistMagic: Effect {
        Effect(
            id: 11,
            name: "Resist Magic",
            value: 20,
            isPositive: true)
    }
    static var fortifyCarryWeight: Effect {
        Effect(
            id: 12,
            name: "Fortify Carry Weight",
            value: 200,
            isPositive: true)
    }
    static var restoreStamina: Effect {
        Effect(
            id: 13,
            name: "Restore Stamina",
            value: 23,
            isPositive: true)
    }
    static var fortifyDestruction: Effect {
        Effect(
            id: 14,
            name: "Fortify Destruction",
            value: 45,
            isPositive: true)
    }
    static var gleamblossom: Ingredient {
        Ingredient(
            id: 1,
            name: "Gleamblossom",
            effects: [8, 9, 10, 11])!
    }

    static var netchJelly: Ingredient {
        Ingredient(
            id: 2,
            name: "Netch Jelly",
            effects: [8, 12, 9, 13])!
    }

    static var wispWrappings: Ingredient {
        Ingredient(
            id: 3,
            name: "Wisp Wrappings",
            effects: [12, 14, 11, 13])!
    }
}
