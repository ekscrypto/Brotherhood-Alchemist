//
//  SelectionState.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

enum SelectionState: UInt8, Equatable, Codable {
    case cantHave
    case mayHave
    case mustHave
}
