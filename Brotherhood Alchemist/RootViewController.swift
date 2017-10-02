//
//  RootViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit
import SidebarOverlay

class RootViewController: SOContainerViewController {
    @IBOutlet var appIconLaunchImageView: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Effect.populateList()
        Ingredient.populateList()

        hideLaunchAssets()
    }

    func hideLaunchAssets() {
        UIView.animate(withDuration: 0.3, animations: {
            self.appIconLaunchImageView.alpha = 0.0
        }, completion: { (_) in
            self.appIconLaunchImageView.isHidden = true
            self.setupSidebar()
        })
    }

    private func setupSidebar() {
        if UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
            self.menuSide = .left
        } else {
            self.menuSide = .right
        }

        self.sideViewController = IngredientsViewController.fromNib()
        self.topViewControllerDimColor = UIColor(white: 0.0, alpha: 0.1)
        self.topViewController = AvailableRecipesViewController.fromNib()
    }
}
