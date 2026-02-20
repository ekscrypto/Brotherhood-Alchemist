//
//  RecipeDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import DomainLogic

@MainActor
struct RecipeDetails: View {
    let mixture: ViewRep.Mixture
    let seekedEffect: SeekedEffect
    let seekedIngredient: SeekedIngredient

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
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
                Text("\(mixture.value)")
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
        ForEach(mixture.effectDetails, id: \.name) { detail in
            Button(action: {
                seekedEffect.name = detail.name
            }) {
                summaryOfEffect(detail)
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

    private func summaryOfEffect(_ detail: ViewRep.EffectDetail) -> some View {
        HStack(spacing: 4) {
            Text(detail.name)
                .font(.system(isPad ? .caption : .headline))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            if detail.magnitude > 0 {
                Text("mag:\(detail.magnitude)")
                    .font(.system(.caption2))
                    .foregroundColor(Color("selectionText"))
            }
            if detail.duration > 0 {
                Text("dur:\(detail.duration)s")
                    .font(.system(.caption2))
                    .foregroundColor(Color("selectionText"))
            }
            Text("\(detail.goldValue)g")
                .font(.system(.caption2))
                .foregroundColor(Color("selectionText"))
                .padding(.trailing, 8)
        }
    }

    private var listOfIngredients: some View {
        ForEach(mixture.ingredients, id: \.self) { ingredientName in
            Button(action: {
                seekedIngredient.name = ingredientName
            }) {
                Text(ingredientName)
                    .font(.system(isPad ? .caption : .headline))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
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
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(
            mixture: ViewRep.Mixture.preview(
                ingredients: ["Gleamblossom", "Netch Jelly", "Wisp Wrappings"],
                effects: ["Fear", "Paralysis", "Resist Magic", "Fortify Carry Weight", "Restore Stamina"],
                value: 689),
            seekedEffect: .init(),
            seekedIngredient: .init())
        .environmentObject(AppViewModel())
    }
}
