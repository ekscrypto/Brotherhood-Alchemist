//
//  ResetModal.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-09.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct ResetModal: View {
    
    let queryText: String
    let resetAction: (SelectionState.State) -> Void
    @Binding var visibility: Bool

    var body: some View {
        VStack {
            Spacer()

            VStack {
                VStack {
                    Text(queryText)
                    resetCantHaveButton
                    resetMayHaveButton
                    resetCancelButton
                }
                .padding()
            }
            .frame(maxWidth: 300)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(20.0)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var resetCantHaveButton: some View {
        Button(action: {
            resetAction(.cantHave)
            dismissResetModal()
        }) {
            Text("Can't have")
                .frame(maxWidth: .infinity)
                .frame(height: 32)
        }
        .padding()
        .background(Color("itemBackground"))
        .cornerRadius(6.0)
    }
    
    private var resetMayHaveButton: some View {
        Button(action: {
            resetAction(.mayHave)
            dismissResetModal()
        }) {
            Text("May have")
                .frame(maxWidth: .infinity)
                .frame(height: 32)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("itemBackground"))
        .cornerRadius(6.0)
    }
    
    private var resetCancelButton: some View {
        Button(action: {
            dismissResetModal()
        }) {
            Text("Cancel")
                .frame(maxWidth: .infinity)
                .frame(height: 32)
        }
        .foregroundColor(Color.red)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("itemBackground"))
        .cornerRadius(6.0)
    }
    
    private func dismissResetModal() {
        DispatchQueue.main.async {
            withAnimation {
                visibility = false
            }
        }

    }
}

struct ResetModal_Previews: PreviewProvider {
    static var previews: some View {
        ResetModal(
            queryText: "Set all ingredients as:",
            resetAction: { _ in /* ignored */ },
            visibility: Binding(
                get: { true },
                set: { _ in /* ignored */ }
            ))
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Light")
        .preferredColorScheme(.light)

        ResetModal(
            queryText: "Set all effects as:",
            resetAction: { _ in /* ignored */ },
            visibility: Binding(
                get: { true },
                set: { _ in /* ignored */ }
            ))
        .previewDevice("iPhone 13 Pro")
        .previewDisplayName("Dark")
        .preferredColorScheme(.dark)
    }
}
