//
//  DetermineWidth.swift
//  Brotherhoold Alchemist SwiftUI
//
//  Created by Dave Poirier on 2022-04-08.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import SwiftUI

struct DetermineWidth: View
{
    typealias Key = MaximumWidthPreferenceKey
    var body: some View
    {
        GeometryReader
        {
            proxy in
            Color.clear
                .anchorPreference(key: Key.self, value: .bounds)
                {
                    anchor in proxy[anchor].size.width
                }
        }
    }
    
    struct MaximumWidthPreferenceKey: PreferenceKey
    {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
        {
            value = max(value, nextValue())
        }
    }
}
