//
//  IngredientDetails.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-08.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import DomainLogic

@MainActor
struct IngredientDetails: View {
    let ingredient: ViewRep.Ingredient
    let expanded: Bool
    let seekedEffect: SeekedEffect

    @EnvironmentObject var appViewModel: AppViewModel

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    private var selection: SelectionState {
        appViewModel.selectionState(forIngredient: ingredient.id)
    }

    var body: some View {
        VStack {
            Button(action: { rotateSelection() }) {
                HStack(spacing: 1) {
                    SelectionIndicator(state: selection)
                        .accessibilityHidden(true)
                    SelectionText(state: selection)
                        .frame(width: 40)
                        .accessibilityHidden(true)
                    Text(ingredient.name)
                        .font(.system(isPad ? .caption : .headline))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("itemForeground"))
                }
            }
            .accessibilityLabel("\(selection.accessibilityDescription) \(ingredient.name)")
            .accessibilityHint("Tap to toggle between may, must, can't")

            if expanded {
                additionalInfo
            }
        }
        .background(Color("itemBackground"))
    }

    @MainActor
    private func rotateSelection() {
        appViewModel.toggleIngredientSelection(id: ingredient.id)
    }

    private var additionalInfo: some View {
        VStack {

            if ingredient.effects.count == 0 {

                Text("This ingredient has no effects defined!")
                    .foregroundColor(Color(UIColor.systemRed))

            } else {

                Text("Effects:")
                    .font(Font.system(.caption))
                    .foregroundColor(Color("selectionText"))

                ForEach(ingredient.effects) { effect in
                    Button(action: {
                        seekedEffect.name = effect.name
                    }) {
                        Text(effect.name)
                    }
                }

            }
        }
        .padding(.bottom)
    }
}


struct IngredientDetails_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetails(
            ingredient: ViewRep.Ingredient(
                id: .new,
                name: "Abecean Longfin",
                effects: []),
            expanded: false,
            seekedEffect: .init())
        .environmentObject(AppViewModel())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Collapsed [Dark]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

        IngredientDetails(
            ingredient: ViewRep.Ingredient(
                id: .new,
                name: "Ectoplasm",
                effects: [
                    .init(id: .new, name: "Restore Magicka", isPositiveOutcome: true),
                    .init(id: .new, name: "Fortify Destruction", isPositiveOutcome: true),
                    .init(id: .new, name: "Fortify Magicka", isPositiveOutcome: true),
                    .init(id: .new, name: "Damage Health", isPositiveOutcome: false),
                ]),
            expanded: true,
            seekedEffect: .init())
        .environmentObject(AppViewModel())
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Expanded [Light]")
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
    }
}
