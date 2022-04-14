//
//  RecipesList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct RecipesList: View {
    let viewModel: ViewModel
    let listBottomPadding: CGFloat
    
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
    
    private var effectsFilteredConcoctions: [Concoction] {
        if effectsLimit == .noPreference {
            return viewModel.state.selectedConcoctions
        }
        
        return viewModel.state.selectedConcoctions
            .filter({ concoction in
                let effects = concoction.effects
                switch effectsLimit {
                case .positive:
                    return effects.allSatisfy({ $0.isPositive })
                case .negative:
                    return effects.allSatisfy({ $0.isPositive == false })
                case .oneOrTheOther:
                    let hasPositive = effects.reduce(false, { $1.isPositive || $0 })
                    let hasNegative = effects.reduce(false, { !$1.isPositive || $0 })
                    return hasNegative != hasPositive
                case .noPreference:
                    return true
                }
            })
    }
    
    private var ingreditsLimitedConcoctions: [Concoction] {
        switch ingredientLimit {
        case .two:
            return effectsFilteredConcoctions
                .filter({ $0.ingredients.count == 2 })
        case .three:
            return effectsFilteredConcoctions
                .filter({ $0.ingredients.count == 3 })
        case .noPreference:
            return effectsFilteredConcoctions
        }
    }
    
    private var sortedConcoctions: [Concoction] {
        let concoctions = ingreditsLimitedConcoctions
        switch sortBy {
        case .value:
            return concoctions.sorted(by: {
                if $0.estimatedValue != $1.estimatedValue {
                    return $0.estimatedValue > $1.estimatedValue
                }
                
                return $0.ingredients.count < $1.ingredients.count
            })
            
        case .ingredientsFewerFirst:
            return concoctions.sorted(by: {
                if $0.ingredients.count != $1.ingredients.count {
                    return $0.ingredients.count < $1.ingredients.count
                }
                
                if $0.effects.count != $1.effects.count {
                    return $0.effects.count > $1.effects.count
                }
                
                return $0.estimatedValue > $1.estimatedValue
            })
            
        case .effectsMostFirst:
            return concoctions
                .sorted(by: {
                    if $0.effects.count != $1.effects.count {
                        return $0.effects.count > $1.effects.count
                    }
                    
                    if $0.ingredients.count != $1.ingredients.count {
                        return $0.ingredients.count < $1.ingredients.count
                    }
                    
                    return $0.estimatedValue > $1.estimatedValue
                })
        }
    }
    
    // MARK: -
    var body: some View {
        ZStack {
            VStack {
                header
                
                if viewModel.state.updatingConcoctions {
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
                    
                    if viewModel.state.selectedConcoctions.count == 0 {
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
    
    private func concoctionInfo(_ concoction: Concoction) -> some View {
        RecipeDetails(
            concoction: concoction,
            effects: viewModel.effects(for: concoction),
            ingredients: viewModel.ingredients(for: concoction),
            onSeekEffect: { viewModel.seekedEffect.value = $0 },
            onSeekIngredient: { _ in /* ignored */ })
    }
    
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
                    ForEach(sortedConcoctions) { concoction in
                        concoctionInfo(concoction)
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
            viewModel: ViewModel(),
            listBottomPadding: 0)
    }
}
