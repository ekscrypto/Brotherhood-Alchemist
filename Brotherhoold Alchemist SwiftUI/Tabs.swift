//
//  Tabs.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case ingredients = "Ingredients"
    case recipes = "Recipes"
    case effects = "Effects"
}

struct Tabs: View {
    @State var buttonsWidth: CGFloat = .zero
    @Binding var selectedTab: Tab
    @Environment(\.colorScheme) var colorScheme
    
    private var shadowColor: Color {
        if colorScheme == .dark {
            return Color.white
        }
        return Color.black
    }

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                tabButton(tab)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .foregroundColor(Color(UIColor.systemBackground))
        )
        .shadow(color: shadowColor, radius: 12.0)
    }

    private func selectTab(_ tab: Tab) {
        selectedTab = tab
    }
    
    private func tabButton(_ tab: Tab) -> some View {
        Button(action: {
            selectTab(tab)
        }) {
            Text(tab.rawValue)
        }
        .foregroundColor(tabColor(tab))
        .frame(minWidth: buttonsWidth)
        .overlay(MinWidthCoordinator(via: $buttonsWidth))
    }
    
    private func tabColor(_ tab: Tab) -> Color {
        if tab == selectedTab {
            return Color(UIColor.systemBlue)
        }
        return Color("itemForeground")
    }
    
    private func tabDecorator(_ tab: Tab) -> some View {
        VStack {
            if tab != selectedTab {
                Color.clear
            } else {
                Color(UIColor.systemBlue)
                    .frame(width: buttonsWidth, height: 1.0)
                    .id("tabDecorator")
            }
        }
    }

}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Tabs(selectedTab: Binding(
                get: { .recipes},
                set: { _ in /* ignored */ }))
        }
        .background(Color("itemBackground"))
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Dark")
        .preferredColorScheme(.dark)

        ZStack {
            Tabs(selectedTab: Binding(
                get: { .recipes},
                set: { _ in /* ignored */ }))
        }
        .background(Color("itemBackground"))
        .previewDisplayName("Light")
        .preferredColorScheme(.light)
        .previewDevice("iPhone 13 Pro")
    }
}
