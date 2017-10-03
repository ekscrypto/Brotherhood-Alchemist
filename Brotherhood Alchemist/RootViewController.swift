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
    @IBOutlet var dataSource: MatchingRecipeDataSource!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        EffectGenerator.execute()
        IngredientGenerator.execute()
        print("identifying recipes..")
        ConcoctionGenerator.execute()
        let mostValuable = Concoction.all.first
        let leastValuable = Concoction.all.last
        print("identified a total of \(Concoction.all.count) recipes ranging in value from \(leastValuable!.estimatedValue) to \(mostValuable!.estimatedValue)")

        registerUserDefaults()
        hideLaunchAssets()
        setupSideMenus()
        customizeNavigationBarStyle()
        customizeStatusBarAppearance()
    }

    private func registerUserDefaults() {
        let ud = UserDefaults.standard
        ud.register(defaults: [EffectsViewController.shouldGroupActiveAndInactiveKey: true])
        ud.synchronize()
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
