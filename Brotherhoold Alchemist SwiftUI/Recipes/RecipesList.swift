//
//  RecipesList.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct RecipesList: View {
    @ObservedObject var viewModel: ViewModel
    
    let listBottomPadding: CGFloat
    let onSeekEffect: (Effect) -> Void
    let onSeekIngredient: (Ingredient) -> Void
    
    enum SortBy {
        case value
        case ingredientsFewerFirst
        case effectsMostFirst
    }
    @State var sortBy: SortBy = .value
    
    enum IngredientsLimit {
        case two
        case three
        case noPreference
    }
    @State var ingredientLimit: IngredientsLimit = .noPreference
    
    enum EffectsLimit {
        case positive
        case negative
        case oneOrTheOther
        case noPreference
    }
    @State var effectsLimit: EffectsLimit = .noPreference
    
    private var effectsFilteredConcoctions: [Concoction] {
        if effectsLimit == .noPreference {
            return viewModel.state.selectedConcoctions
        }
        
        return viewModel.state.selectedConcoctions
            .filter({ concoction in
                let effects = viewModel.effects(for: concoction).keys
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

    var body: some View {
        VStack {
            header
            
            if viewModel.state.updatingConcoctions {
                VStack {
                    Text("Updating…")
                        .padding()
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
    }
    
    private var effectsLimitText: String {
        switch effectsLimit {
        case .positive:
            return "positive only"
        case .negative:
            return "negative only"
        case .oneOrTheOther:
            return "either, not both"
        case .noPreference:
            return "no preference"
        }
    }
    
    private var ingredientsLimitText: String {
        switch ingredientLimit {
        case .two:
            return "2 ingredients only"
        case .three:
            return "3 ingredients only"
        case .noPreference:
            return "no preference"
        }
    }
    
    private var sortOptionText: String {
        switch sortBy {
        case .value:
            return "Value ↓, Ingredients ↑"
        case .ingredientsFewerFirst:
            return "Ingredients ↑, Effects ↓"
        case .effectsMostFirst:
            return "Effects ↓, Ingredients ↑"
        }
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 1.0) {
                Text("Sort options ↑↓: \(sortOptionText)")
                Text("Effects filter ⧩: \(effectsLimitText)")
                Text("Ingredients filter ⧩: \(ingredientsLimitText)")
            }
            .font(Font.system(.caption))
            .foregroundColor(Color("itemForeground"))
            .padding([.leading, .trailing])
            
            Button(action: {
                print("edit options")
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
    
    private func concoctionInfo(_ concoction: Concoction) -> some View {
        RecipeDetails(
            concoction: concoction,
            effects: viewModel.effects(for: concoction),
            ingredients: viewModel.ingredients(for: concoction),
            onSeekEffect: onSeekEffect,
            onSeekIngredient: onSeekIngredient)
    }
}

struct RecipesList_Previews: PreviewProvider {
    static var previews: some View {
        RecipesList(
            viewModel: ViewModel(),
            listBottomPadding: 0,
            onSeekEffect: { _ in /* ignored */ },
            onSeekIngredient: { _ in /* ignored */ })
    }
}
