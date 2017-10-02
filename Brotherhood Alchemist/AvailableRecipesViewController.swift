//
//  AvailableRecipesViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class AvailableRecipesViewController: UIViewController {

    class func fromNib() -> AvailableRecipesViewController? {
        return AvailableRecipesViewController(nibName: "AvailableRecipesViewController", bundle: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        customizeNavigationBarAppearance()
    }

    func customizeNavigationBarAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = UIColor.darkGray
        appearance.barTintColor = UIColor.darkGray
        appearance.isTranslucent = false

        appearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
