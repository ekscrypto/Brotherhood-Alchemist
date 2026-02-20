//
//  RecipesList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import DomainLogic

@MainActor
struct RecipesList: View {

    let listBottomPadding: CGFloat
    let seekedEffect: SeekedEffect
    let seekedIngredient: SeekedIngredient

    @EnvironmentObject var appViewModel: AppViewModel

    @State var showOptions: Bool = false

    enum SortBy: String, CaseIterable {
        case value =  "value ↓, ingredients ↑"
        case ingredientsFewerFirst = "ingredients ↑, effects ↓"
        case effectsMostFirst = "effects ↓, ingredients ↑"
    }
    @State var sortBy: SortBy = .value

    enum IngredientsLimit: String, CaseIterable {
        case two = "two ingredients only"
        case three = "three ingredients only"
        case noPreference = "no preference"
    }
    @State var ingredientLimit: IngredientsLimit = .noPreference

    enum EffectsLimit: String, CaseIterable {
        case positive = "positive effects only"
        case negative = "negative effects only"
        case oneOrTheOther = "either, not both"
        case noPreference = "no preference"
    }
    @State var effectsLimit: EffectsLimit = .oneOrTheOther

    private var isBrewing: Bool {
        appViewModel.viewRep?.mixtures.brewing ?? true
    }

    private var effectsFilteredMixtures: [ViewRep.Mixture] {
        guard let mixtures = appViewModel.viewRep?.mixtures.mixtures else { return [] }

        if effectsLimit == .noPreference {
            return mixtures
        }

        return mixtures.filter { mixture in
            let details = mixture.effectDetails
            switch effectsLimit {
            case .positive:
                return details.allSatisfy { $0.isPositiveOutcome }
            case .negative:
                return details.allSatisfy { !$0.isPositiveOutcome }
            case .oneOrTheOther:
                let hasPositive = details.contains { $0.isPositiveOutcome }
                let hasNegative = details.contains { !$0.isPositiveOutcome }
                return hasNegative != hasPositive
            case .noPreference:
                return true
            }
        }
    }

    private var ingredientsLimitedMixtures: [ViewRep.Mixture] {
        switch ingredientLimit {
        case .two:
            return effectsFilteredMixtures.filter { $0.ingredients.count == 2 }
        case .three:
            return effectsFilteredMixtures.filter { $0.ingredients.count == 3 }
        case .noPreference:
            return effectsFilteredMixtures
        }
    }

    private var sortedMixtures: [ViewRep.Mixture] {
        let mixtures = ingredientsLimitedMixtures
        switch sortBy {
        case .value:
            return mixtures.sorted(by: {
                if $0.value != $1.value {
                    return $0.value > $1.value
                }
                return $0.ingredients.count < $1.ingredients.count
            })

        case .ingredientsFewerFirst:
            return mixtures.sorted(by: {
                if $0.ingredients.count != $1.ingredients.count {
                    return $0.ingredients.count < $1.ingredients.count
                }
                if $0.effects.count != $1.effects.count {
                    return $0.effects.count > $1.effects.count
                }
                return $0.value > $1.value
            })

        case .effectsMostFirst:
            return mixtures.sorted(by: {
                if $0.effects.count != $1.effects.count {
                    return $0.effects.count > $1.effects.count
                }
                if $0.ingredients.count != $1.ingredients.count {
                    return $0.ingredients.count < $1.ingredients.count
                }
                return $0.value > $1.value
            })
        }
    }

    // MARK: -
    var body: some View {
        ZStack {
            VStack {
                header

                if isBrewing {
                    VStack {
                        Text("Brewing…")
                            .padding(.top, 80)
                            .padding(.bottom)
                        Text("Attempting not to blow up my fingers")
                            .font(Font.system(.caption))
                            .foregroundColor(Color("selectionText"))
                        Spacer()
                    }
                } else {

                    if sortedMixtures.count == 0 {
                        VStack {
                            Text("No match :(")
                                .padding()
                            Spacer()
                        }
                    } else {
                        listOfRecipes
                    }
                }
            }
            .blur(radius: showOptions ? 4 : 0)
            .allowsHitTesting(!showOptions)

            if showOptions {
                RecipesListOptions(
                    listBottomPadding: listBottomPadding,
                    effectsLimit: $effectsLimit,
                    ingredientsLimit: $ingredientLimit,
                    sortBy: $sortBy,
                    showOptions: $showOptions)
            }
        }
    }

    // MARK: -

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 1.0) {
                Text("Sort options ↑↓: \(sortBy.rawValue)")
                Text("Effects filter ⧩: \(effectsLimit.rawValue)")
                Text("Ingredients filter ⧩: \(ingredientLimit.rawValue)")
            }
            .font(Font.system(.caption))
            .foregroundColor(Color("itemForeground"))
            .padding([.leading, .trailing])

            Button(action: {
                showOptions = true
            }) {
                Image(systemName: "square.and.pencil")
            }
        }
    }

    private var listOfRecipes: some View {
        ScrollView {
            ScrollViewReader { scrollview in
                LazyVStack {
                    ForEach(sortedMixtures) { mixture in
                        RecipeDetails(
                            mixture: mixture,
                            seekedEffect: seekedEffect,
                            seekedIngredient: seekedIngredient)
                    }
                }

                Color.clear
                    .frame(height: listBottomPadding)
            }
        }
    }
}

struct RecipesList_Previews: PreviewProvider {
    static var previews: some View {
        RecipesList(
            listBottomPadding: 0,
            seekedEffect: .init(),
            seekedIngredient: .init())
        .environmentObject(AppViewModel())
    }
}
