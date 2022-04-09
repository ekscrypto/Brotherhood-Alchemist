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
    
    var body: some View {
        ZStack(alignment: .bottom) {
            IngredientsList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding,
                onSeekEffect: { onSeekEffect($0) },
                seekedIngredient: seekedIngredient)
            .id("IngredientList")
            .overlay(HeightCoordinator(via: $listHeight))
            .offset(x: tabOffset(for: .ingredients))
            
            VStack {
                Text("Recipes")
                Spacer()
            }
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
        }
    }
    
    private func onSeekIngredient(_ ingredient: Ingredient) {
        seekedIngredient = ingredient
        selectedTab = .ingredients
        DispatchQueue.main.async {
            seekedIngredient = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
