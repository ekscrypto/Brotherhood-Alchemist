//
//  EffectDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import DomainLogic

@MainActor
struct EffectDetails: View {
    let effect: ViewRep.Effect
    let expanded: Bool
    let seekedIngredient: SeekedIngredient

    @EnvironmentObject var appViewModel: AppViewModel

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    private var selection: SelectionState {
        appViewModel.selectionState(forEffect: effect.id)
    }

    private var ingredientsWithThisEffect: [ViewRep.Ingredient] {
        guard let ingredients = appViewModel.viewRep?.ingredients else { return [] }
        return ingredients.filter { ingredient in
            ingredient.effects.contains { $0.id == effect.id }
        }
    }

    var body: some View {
        VStack {
            Button(action: {
                rotateSelection()
            }) {
                HStack(spacing: 1) {
                    SelectionIndicator(state: selection)
                        .accessibilityHidden(true)
                    SelectionText(state: selection)
                        .frame(width: 40)
                        .accessibilityHidden(true)
                    Text(effect.name)
                        .font(.system(isPad ? .caption : .headline))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("itemForeground"))
                }
            }
            .accessibilityLabel("\(selection.accessibilityDescription) \(effect.name)")
            .accessibilityHint("Tap to toggle between may, must, can't")

            if expanded {
                additionalInfo
            }
        }
        .background(Color("itemBackground"))
    }

    private var positiveOrNegativeText: String {
        effect.isPositiveOutcome ? "Good for you :)" : "Please don't use this on yourself!"
    }

    private var additionalInfo: some View {
        VStack {
            Text(positiveOrNegativeText)
                .font(Font.system(.caption))
            Text("Base value: \(effect.value) septims")
                .font(Font.system(.caption))
                .padding(.bottom)

            if ingredientsWithThisEffect.count == 0 {
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
            Text("Found in \(ingredientsWithThisEffect.count) ingredient(s):")
                .font(Font.system(.caption))
                .foregroundColor(Color("selectionText"))

            ForEach(ingredientsWithThisEffect) { ingredient in
                Button(action: {
                    seekedIngredient.name = ingredient.name
                }) {
                    Text(ingredient.name)
                }
            }
        }
    }

    @MainActor
    private func rotateSelection() {
        appViewModel.toggleEffectSelection(id: effect.id)
    }
}

struct EffectDetails_Previews: PreviewProvider {
    static var previews: some View {
        EffectDetails(
            effect: ViewRep.Effect(
                id: .new,
                name: "Fear",
                value: 100,
                isPositiveOutcome: false),
            expanded: false,
            seekedIngredient: .init())
        .environmentObject(AppViewModel())
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: ViewRep.Effect(
                id: .new,
                name: "Fear",
                value: 88,
                isPositiveOutcome: false),
            expanded: true,
            seekedIngredient: .init())
        .environmentObject(AppViewModel())
        .previewLayout(.sizeThatFits)

        EffectDetails(
            effect: ViewRep.Effect(
                id: .new,
                name: "Fortify Sneak",
                value: 17,
                isPositiveOutcome: true),
            expanded: true,
            seekedIngredient: .init())
        .environmentObject(AppViewModel())
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
