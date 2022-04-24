//
//  RecipeDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

@MainActor
struct RecipeDetails: View {
    let concoction: Concoction
    let seekedEffect: SeekedEffect
    let seekedIngredient: SeekedIngredient
    
    @EnvironmentObject var orientationInfo: OrientationInfo

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    private var sortedEffects: [Effect] {
        concoction.effects.sorted(by: { ~$0.name < ~$1.name })
    }
    
    private var sortedIngredients: [Ingredient] {
        concoction.ingredients.sorted(by: { ~$0.name < ~$1.name })
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
                Text("\(concoction.estimatedValue)")
                    .font(Font.system(.headline))
                Text("septims")
                    .font(Font.system(.caption))
                    .foregroundColor(Color("selectionText"))
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
                seekedEffect.effect = effect
            }) {
                summaryOfEffect(effect)
            }
            .foregroundColor(Color(UIColor.systemBlue))
            .frame(height: 32)
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(Color("itemBackground"))
            )
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing])
    }
    
    private func summaryOfEffect(_ effect: Effect) -> some View {
        HStack(spacing: 1) {
            SelectionIndicator(state: effect.selection)
                .saturation(0.0)
            SelectionText(state: effect.selection)
                .scaleEffect(0.8)
                .frame(width: 40)
            Text(~effect.name)
                .font(.system(isPad ? .caption : .headline))
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.leading)
        }
    }
    
    private var listOfIngredients: some View {
        ForEach(sortedIngredients) { ingredient in
            Button(action: {
                seekedIngredient.ingredient = ingredient
            }) {
                summaryOfIngredient(ingredient)
            }
            .foregroundColor(Color(UIColor.systemBlue))
            .frame(height: 32)
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(Color("itemBackground"))
            )
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing])
    }
    
    private func summaryOfIngredient(_ ingredient: Ingredient) -> some View {
        HStack(spacing: 1) {
            SelectionIndicator(state: ingredient.selection)
                .saturation(0.0)
            SelectionText(state: ingredient.selection)
                .scaleEffect(0.8)
                .frame(width: 40)
            Text(~ingredient.name)
                .font(.system(isPad ? .caption : .headline))
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
                    Effect(name: "Fear", value: 1, isPositive: false),
                    Effect(name: "Paralysis", value: 1, isPositive: false),
                    Effect(name: "Resist Magic", value: 1, isPositive: true),
                    Effect(name: "Fortify Carry Weight", value: 1, isPositive: true),
                    Effect(name: "Restore Stamina", value: 1, isPositive: true)
                ],
                ingredients: [
                    Ingredient(name: "Gleamblossom", effects: []),
                    Ingredient(name: "Netch Jelly", effects: []),
                    Ingredient(name: "Wisp Wrappings", effects: [])
                ],
                estimatedValue: 689),
            seekedEffect: .init(),
            seekedIngredient: .init())
    }

}
