//
//  StringCapitalizeFirstLetter.swift
//  Assure Light
//
//  Created by Dave Poirier on 2017-09-19.
//  Copyright © 2017 ID Fusion Software Inc. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
