//
//  RootViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit
import SideMenu

class RootViewController: UIViewController {
    @IBOutlet var appIconLaunchImageView: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Effect.populateList()
        Ingredient.populateList()

        hideLaunchAssets()
        setupSideMenus()
        customizeNavigationBarStyle()
        customizeStatusBarAppearance()
    }

    func hideLaunchAssets() {
        UIView.animate(withDuration: 1.0, animations: {
            self.appIconLaunchImageView.alpha = 0.0
        }, completion: { (_) in
            self.appIconLaunchImageView.isHidden = true
        })
    }

    private func setupSideMenus() {
        let leftMenu = UISideMenuNavigationController(rootViewController: IngredientsViewController.fromNib()!)
        leftMenu.leftSide = true
        let rightMenu = UISideMenuNavigationController(rootViewController: EffectsViewController.fromNib()!)
        rightMenu.leftSide = false

        SideMenuManager.menuLeftNavigationController = leftMenu
        SideMenuManager.menuRightNavigationController = rightMenu

        SideMenuManager.menuAddPanGestureToPresent(toView: self.view)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.view)
    }

    private func customizeStatusBarAppearance() {
        let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView
        statusBar?.backgroundColor = UIColor(hex: "#444444")
        UIApplication.shared.statusBarStyle = .lightContent
    }

    private func customizeNavigationBarStyle() {
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = false
        appearance.barTintColor = UIColor.darkGray
    }
}
