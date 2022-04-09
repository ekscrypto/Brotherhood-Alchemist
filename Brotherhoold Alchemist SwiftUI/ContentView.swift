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
    @State private var shownTab: Tab = .recipes
    @State private var viewWidth: CGFloat = .zero
    
    
    private var listBottomPadding: CGFloat {
        listHeight - tabbarOrigin
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            IngredientsList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding)
            .overlay(HeightCoordinator(via: $listHeight))
            .offset(x: tabOffset(for: .ingredients))
            
            VStack {
                Text("Recipes")
                Spacer()
            }
            .offset(x: tabOffset(for: .recipes))

            EffectsList(
                viewModel: viewModel,
                listBottomPadding: listBottomPadding)
            .offset(x: tabOffset(for: .effects))

            Tabs(selectedTab: Binding(
                get: { selectedTab},
                set: { selectedTab = $0 })
            )
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
