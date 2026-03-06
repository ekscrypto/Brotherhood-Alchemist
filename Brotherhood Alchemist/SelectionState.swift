//
//  SelectionState.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-07.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

import DomainLogic

enum SelectionState: UInt8, Equatable, Codable {
    case cantHave
    case mayHave
    case mustHave

    var domainLogic: DomainLogic.SelectionState {
        switch self {
        case .cantHave: return .cantHave
        case .mayHave: return .mayHave
        case .mustHave: return .mustHave
        }
    }

    var accessibilityDescription: String {
        switch self {
        case .cantHave: return "can't have"
        case .mayHave: return "may have"
        case .mustHave: return "must have"
        }
    }
}
