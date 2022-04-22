//
//  ListHeader.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct ListHeader: View {
    @Binding var expanded: Bool
    @Binding var showResetModal: Bool
    
    let title: String
    @State private var expandButtonText: String = "MORE"
    @State var controlButtonsWidth: CGFloat = .zero

    // MARK: -
    var body: some View {
        HStack(spacing: 1) {
            titleText
            expandButton
            resetButton
        }
        .frame(maxWidth: .infinity)
        .frame(height: 28)
        .background(Color(UIColor.systemBackground))
        .onChange(of: expanded) { nowExpanded in
            if nowExpanded, expandButtonText == "MORE" {
                expandButtonText = "LESS"
            }
            if nowExpanded == false, expandButtonText == "LESS" {
                expandButtonText = "MORE"
            }
        }
    }

    // MARK: -
    private var expandButton: some View {
        Button(action: {
            expandButtonText = expanded ? "MORE" : "LESS"
            DispatchQueue.main.async {
                withAnimation {
                    expanded = !expanded
                }
            }
        }) {
            Text(expandButtonText)
                .font(.system(.callout))
                .frame(minWidth: controlButtonsWidth,
                       maxHeight: .infinity)
                .overlay(MinWidthCoordinator(via: $controlButtonsWidth))
                .padding([.leading, .trailing])
                .background(Color("itemBackground"))
        }
    }
    
    private var titleText: some View {
        Text(title)
            .font(.system(.headline))
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
            .padding(.leading)
            .background(Color("itemBackground"))
    }
    
    private var resetButton: some View {
        Button(action: {
            withAnimation {
                showResetModal = true
            }
        }) {
            Text("RESET")
                .font(.system(.callout))
                .frame(minWidth: controlButtonsWidth,
                       maxHeight: .infinity)
                .overlay(MinWidthCoordinator(via: $controlButtonsWidth))
                .padding([.leading, .trailing])
                .background(Color("itemBackground"))
        }
    }
}

struct ListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ListHeader(
            expanded: Binding(
                get: { false },
                set: { _ in /* ignored */ }),
            showResetModal: Binding(
                get: { false },
                set: { _ in /* ignored */ }),
            title: "Ingredients")
        .preferredColorScheme(.light)
        .previewDevice("iPhone 13 Pro")
        .previewLayout(.sizeThatFits)
        
        ListHeader(
            expanded: Binding(
                get: { false },
                set: { _ in /* ignored */ }),
            showResetModal: Binding(
                get: { false },
                set: { _ in /* ignored */ }),
            title: "Ingredients")
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 13 Pro")
        .previewLayout(.sizeThatFits)
    }
}
