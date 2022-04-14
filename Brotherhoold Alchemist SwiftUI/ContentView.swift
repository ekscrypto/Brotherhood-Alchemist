//
//  ContentView.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-06.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    private let viewModel: ViewModel = .init()
    
    @State private var tabButtonsWidth: CGFloat = .zero
    @State private var tabbarOrigin: CGFloat = .zero
    @State private var listHeight: CGFloat = .zero
    @State var selectedTab: Tab = .recipes
    @State private var viewWidth: CGFloat = .zero
    
    @ObservedObject var seekedEffect: ViewModel.SeekedEffect
    @ObservedObject var seekedIngredient: ViewModel.SeekedIngredient

    private var listBottomPadding: CGFloat {
        listHeight - tabbarOrigin
    }
    
    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    init() {
        seekedEffect = viewModel.seekedEffect
        seekedIngredient = viewModel.seekedIngredient
    }
    
    func onTabRequest(_ tab: Tab) {
        if !isPad {
            withAnimation {
                selectedTab = tab
            }
        }
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
                    listBottomPadding: 0)
                .id("IngredientList")
                .overlay(HeightCoordinator(via: $listHeight))
                
                RecipesList(
                    viewModel: viewModel,
                    listBottomPadding: 0)
                .id("Recipes")
                .frame(minWidth: 300, idealWidth: max(360, viewWidth * 0.4), maxWidth: 500.0)

                EffectsList(
                    viewModel: viewModel,
                    listBottomPadding: 0)
                .id("EffectsList")
            }
        }
        .overlay(MinWidthCoordinator(via: $viewWidth))
    }

    private var iPhoneLayout: some View {
        ZStack(alignment: .bottom) {
            IngredientsList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding)
            .id("IngredientList")
            .overlay(HeightCoordinator(via: $listHeight))
            .offset(x: tabOffset(for: .ingredients))
            
            RecipesList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding)
            .id("Recipes")
            .offset(x: tabOffset(for: .recipes))

            EffectsList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding)
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
        .onReceive(seekedEffect.$value, perform: { _ in onTabRequest(.effects) })
        .onReceive(seekedIngredient.$value, perform: { _ in onTabRequest(.ingredients) })
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
