//
//  ContentView.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let viewModel: ViewModel = .init()
    
    @State private var tabButtonsWidth: CGFloat = .zero
    @State private var tabbarOrigin: CGFloat = .zero
    @State private var listHeight: CGFloat = .zero
    @State var selectedTab: Tab = .recipes {
        didSet{
            onTabChange()
        }
    }
    @State private var seekedEffect: Effect?
    @State private var seekedIngredient: Ingredient?
    @State private var shownTab: Tab = .recipes
    @State private var viewWidth: CGFloat = .zero
    
    private var listBottomPadding: CGFloat {
        listHeight - tabbarOrigin
    }
    
    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var body: some View {
        if isPad {
            iPadLayout
        } else {
            iPhoneLayout
        }
    }
    
    private var iPadLayout: some View {
        ZStack(alignment: .bottom) {
            HStack {
                IngredientsList(
                    viewModel: viewModel,
                    listBottomPadding: 0,
                    onSeekEffect: { onSeekEffect($0) },
                    seekedIngredient: seekedIngredient)
                .id("IngredientList")
                .overlay(HeightCoordinator(via: $listHeight))
                
                RecipesList(
                    viewModel: viewModel,
                    listBottomPadding: 0,
                    onSeekEffect: onSeekEffect,
                    onSeekIngredient: onSeekIngredient)
                .id("Recipes")
                .frame(minWidth: 300, idealWidth: max(360, viewWidth * 0.4), maxWidth: 500.0)

                EffectsList(
                    viewModel: viewModel,
                    listBottomPadding: 0,
                    onSeekIngredient: { onSeekIngredient($0) },
                    seekedEffect: seekedEffect)
                .id("EffectsList")
            }
        }
        .overlay(MinWidthCoordinator(via: $viewWidth))
    }

    private var iPhoneLayout: some View {
        ZStack(alignment: .bottom) {
            IngredientsList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding,
                onSeekEffect: { onSeekEffect($0) },
                seekedIngredient: seekedIngredient)
            .id("IngredientList")
            .overlay(HeightCoordinator(via: $listHeight))
            .offset(x: tabOffset(for: .ingredients))
            
            RecipesList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding,
                onSeekEffect: onSeekEffect,
                onSeekIngredient: onSeekIngredient)
            .id("Recipes")
            .offset(x: tabOffset(for: .recipes))

            EffectsList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding,
                onSeekIngredient: { onSeekIngredient($0) },
                seekedEffect: seekedEffect)
            .id("EffectsList")
            .offset(x: tabOffset(for: .effects))

            Tabs(selectedTab: Binding(
                get: { selectedTab},
                set: { selectedTab = $0 })
            )
            .id("Tabs")
            .overlay(TabsOriginCoordinator(via: $tabbarOrigin))
        }
        .overlay(MinWidthCoordinator(via: $viewWidth))
    }
    
    private func tabOffset(for tab: Tab) -> CGFloat {
        guard let index = Tab.allCases.firstIndex(of: tab),
              let selectedIndex = Tab.allCases.firstIndex(of: shownTab)
        else {
            return 0.0
        }
        return CGFloat(index - selectedIndex) * viewWidth
    }
    
    private func onTabChange() {
        DispatchQueue.main.async {
            withAnimation {
                shownTab = selectedTab
            }
        }
    }
    
    private func onSeekEffect(_ effect: Effect) {
        seekedEffect = effect
        selectedTab = .effects
        DispatchQueue.main.async {
            seekedEffect = nil
            if isPad {
                selectedTab = .recipes
            }
        }
    }
    
    private func onSeekIngredient(_ ingredient: Ingredient) {
        seekedIngredient = ingredient
        selectedTab = .ingredients
        DispatchQueue.main.async {
            seekedIngredient = nil
            if isPad {
                selectedTab = .recipes
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
        
        ContentView()
            .previewDevice("iPad Air (5th generation)")
    }
}
