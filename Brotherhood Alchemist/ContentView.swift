//
//  ContentView.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import Combine

@MainActor
struct ContentView: View {
    
    let seekedEffect: SeekedEffect = .init()
    let seekedIngredient: SeekedIngredient = .init()
    
    @State private var tabButtonsWidth: CGFloat = .zero
    @State private var tabbarOrigin: CGFloat = .zero
    @State private var listHeight: CGFloat = .zero
    @State var selectedTab: Tab = .recipes
    @State private var viewWidth: CGFloat = .zero
    
    @State var registriesLoaded: Bool = false

    private var listBottomPadding: CGFloat {
        listHeight - tabbarOrigin
    }
    
    private func loadRegistryOnce() {
        Task {
            await RegistryStorage.active.load(into: Registry.active)
            registriesLoaded = true
        }
    }

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    func onTabRequest(_ tab: Tab) {
        if !isPad {
            withAnimation {
                selectedTab = tab
            }
        }
    }

    var body: some View {
        if false == registriesLoaded {
            loadingRegistriesView
        } else {
            deviceLayout
        }
    }
    
    var loadingRegistriesView: some View {
        Text("Pickpocketing nirnroot…")
            .onAppear {
                loadRegistryOnce()
            }
    }

    var deviceLayout: some View {
        VStack {
            if isPad {
                iPadLayout
            } else {
                iPhoneLayout
            }
        }
    }

    private var iPadLayout: some View {
        ZStack(alignment: .bottom) {
            HStack {
                IngredientsList(
                    listBottomPadding: listBottomPadding,
                    seekedEffect: seekedEffect,
                    seekedIngredient: seekedIngredient)
                .id("IngredientList")
                .overlay(HeightCoordinator(via: $listHeight))

                RecipesList(
                    listBottomPadding: 0,
                    seekedEffect: seekedEffect,
                    seekedIngredient: seekedIngredient)
                .id("Recipes")
                .frame(minWidth: 300, idealWidth: max(360, viewWidth * 0.4), maxWidth: 500.0)

                EffectsList(
                    listBottomPadding: 0,
                    seekedEffect: seekedEffect,
                    seekedIngredient: seekedIngredient)
                .id("EffectsList")
            }
        }
        .overlay(MinWidthCoordinator(via: $viewWidth))
    }

    private var iPhoneLayout: some View {
        ZStack(alignment: .bottom) {
            IngredientsList(
                listBottomPadding: listBottomPadding,
                seekedEffect: seekedEffect,
                seekedIngredient: seekedIngredient)
            .id("IngredientList")
            .overlay(HeightCoordinator(via: $listHeight))
            .offset(x: tabOffset(for: .ingredients))

            RecipesList(
                listBottomPadding: listBottomPadding,
                seekedEffect: seekedEffect,
                seekedIngredient: seekedIngredient)
            .id("Recipes")
            .offset(x: tabOffset(for: .recipes))

            EffectsList(
                listBottomPadding: listBottomPadding,
                seekedEffect: seekedEffect,
                seekedIngredient: seekedIngredient)
            .id("EffectsList")
            .offset(x: tabOffset(for: .effects))

            Tabs(selectedTab: Binding(
                get: { selectedTab },
                set: { onTabRequest($0) })
            )
            .id("Tabs")
            .overlay(TabsOriginCoordinator(via: $tabbarOrigin))
        }
        .overlay(MinWidthCoordinator(via: $viewWidth))
        .onReceive(seekedEffect.$effect) { effectOrNil in
            if effectOrNil != nil {
                selectedTab = .effects
            }
        }
        .onReceive(seekedIngredient.$ingredient) { ingredientOrNil in
            if ingredientOrNil != nil {
                selectedTab = .ingredients
            }
        }
    }

    private func tabOffset(for tab: Tab) -> CGFloat {
        guard let index = Tab.allCases.firstIndex(of: tab),
              let selectedIndex = Tab.allCases.firstIndex(of: selectedTab)
        else {
            return 0.0
        }
        return CGFloat(index - selectedIndex) * viewWidth
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
