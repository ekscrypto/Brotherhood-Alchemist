//
//  IngredientsViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {

    class func fromNib() -> IngredientsViewController? {
        let nib = UINib(nibName: "IngredientsViewController", bundle: nil)
        let nibObjects = nib.instantiate(withOwner: nil, options: [:])
        for nibObject in nibObjects where nibObject is IngredientsViewController {
            let ingredientsVc = nibObject as? IngredientsViewController
            return ingredientsVc
        }
        return nil
    }
}
