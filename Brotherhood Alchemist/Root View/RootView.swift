//
//  RootView.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2022-01-08.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import UIKit

class RootView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
