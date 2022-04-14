//
//  SelectionState.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class SelectionState: ObservableObject {
    
    enum State {
        case cantHave
        case mayHave
        case mustHave
    }
    
    @Published var state: State = .mayHave
}
