//
//  RecipeOptions.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-10.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct RecipesListOptions: View {
    let listBottomPadding: CGFloat
    @Binding var effectsLimit: RecipesList.EffectsLimit
    @Binding var ingredientsLimit: RecipesList.IngredientsLimit
    @Binding var sortBy: RecipesList.SortBy
    @Binding var showOptions: Bool

    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Group {
                    GroupBox("Sort options") {
                        VStack(spacing: 1) {
                            ForEach(RecipesList.SortBy.allCases, id: \.rawValue) { option in
                                Button(action: {
                                    sortBy = option
                                }) {
                                    HStack {
                                        if sortBy == option {
                                            RoundedRectangle(cornerRadius: 3.0)
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 8.0)
                                        } else {
                                            RoundedRectangle(cornerRadius: 3.0)
                                                .stroke(Color("itemForeground"))
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 8.0)
                                        }
                                        
                                        Text(option.rawValue)
                                        
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(6.0)

                                    }
                                }
                                .foregroundColor(Color("itemForeground"))
                            }
                        }
                    }
                    GroupBox("Ingredients Limit") {
                        VStack(spacing: 1) {
                            ForEach(RecipesList.IngredientsLimit.allCases, id: \.rawValue) { option in
                                Button(action: {
                                    ingredientsLimit = option
                                }) {
                                    HStack {
                                        if ingredientsLimit == option {
                                            RoundedRectangle(cornerRadius: 3.0)
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 8.0)
                                        } else {
                                            RoundedRectangle(cornerRadius: 3.0)
                                                .stroke(Color("itemForeground"))
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 8.0)
                                        }
                                        
                                        Text(option.rawValue)
                                        
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(6.0)

                                    }
                                }
                                .foregroundColor(Color("itemForeground"))
                            }
                        }
                    }
                    GroupBox("Effects Limit") {
                        VStack(spacing: 1) {
                            ForEach(RecipesList.EffectsLimit.allCases, id: \.rawValue) { option in
                                Button(action: {
                                    effectsLimit = option
                                }) {
                                    HStack {
                                        if effectsLimit == option {
                                            RoundedRectangle(cornerRadius: 3.0)
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 8.0)
                                        } else {
                                            RoundedRectangle(cornerRadius: 3.0)
                                                .stroke(Color("itemForeground"))
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 8.0)
                                        }
                                        
                                        Text(option.rawValue)
                                        
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(6.0)
                                        
                                    }
                                }
                                .foregroundColor(Color("itemForeground"))
                            }
                        }
                    }
                    GroupBox("All set?") {
                        Button(action: {
                            showOptions = false
                        }) {
                            Text("Close")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: 300)
            
            Spacer()
            
            Color.clear
                .frame(height: listBottomPadding)

        }
    }
}

struct RecipesListOptions_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListOptions(
            listBottomPadding: 0,
            effectsLimit: Binding(
                get: { .positive },
                set: { _ in /* ignored */ }),
            ingredientsLimit: Binding(
                get: { .two },
                set: { _ in /* ignored */ }),
            sortBy: Binding(
                get: { .effectsMostFirst },
                set: { _ in /* ignored */ }),
            showOptions: Binding(
                get: { true },
                set: { _ in /* ignored */ })
        )
    }
}
