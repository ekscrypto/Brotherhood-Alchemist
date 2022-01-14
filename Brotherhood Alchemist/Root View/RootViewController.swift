//
//  RootViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    override func loadView() {
        self.view = RootView()
    }
    
//    @IBOutlet var appIconLaunchImageView: UIImageView!
//    @IBOutlet var dataSource: MatchingRecipeDataSource!

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)

//        EffectGenerator.execute()
//        IngredientGenerator.execute()
//        ConcoctionGenerator.execute()
//
//        registerUserDefaults()
//        hideLaunchAssets()
//        customizeNavigationBarStyle()
//        customizeStatusBarAppearance()
//    }

//    private func registerUserDefaults() {
//        let ud = UserDefaults.standard
//        ud.register(defaults: [
//            EffectsViewController.shouldGroupActiveAndInactiveKey: true,
//            IngredientsViewController.shouldGroupActiveAndInactiveKey: true
//        ])
//        ud.synchronize()
//    }
//
//    func hideLaunchAssets() {
//        UIView.animate(withDuration: 1.0, animations: {
//            self.appIconLaunchImageView.alpha = 0.0
//        }, completion: { (_) in
//            self.appIconLaunchImageView.isHidden = true
//        })
//    }
//
//    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
//
//    private func customizeStatusBarAppearance() {
//        let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView
//        statusBar?.backgroundColor = UIColor(named: "StatusBarColor")
//    }
//
//    private func customizeNavigationBarStyle() {
//        let appearance = UINavigationBar.appearance()
//        appearance.isTranslucent = false
//        appearance.barTintColor = UIColor.darkGray
//    }
}
