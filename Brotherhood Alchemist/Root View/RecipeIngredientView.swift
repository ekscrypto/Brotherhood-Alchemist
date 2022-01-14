//
//  RecipeIngredientView.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-03.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class RecipeIngredientView: UIView {

    @IBOutlet weak var ingredientButton: UIButton!
    @IBOutlet weak var ingredientLabel: UILabel!

    var ingredient: Ingredient!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }

    func update(with ingredient: Ingredient) {
        self.ingredient = ingredient
        ingredientLabel?.text = ingredient.name
//        ingredientButton.setTitle(ingredient.name, for: .normal)
    }

    @IBAction
    func removeThisIngredient(_: Any?) {
        guard ingredient != nil else { return }
        IngredientTracker.markInactive(ingredient: ingredient!.type)

        alertUserIngredientRemovedFeature()
    }

    private func alertUserIngredientRemovedFeature() {
        // TODO: Decide if we need the alert or not to inform about how ingredients management works
//        let ud = UserDefaults.standard
//        let alreadyNotified = ud.bool(forKey: "RecipeIngredientView.Removed.FeatureNotification")
//        if alreadyNotified == false {
//            ud.set(true, forKey: "RecipeIngredientView.Removed.FeatureNotification")
//
//            let title = NSLocalizedString("Ingredient Removed",
//                                          comment: "Title for alert informing user about Remove Ingredient feature")
//            let message = NSLocalizedString("You have just removed an ingredient from the list of active ingredients.  You may use the menu on the left to add it back.",
//                                            comment: "Ingredient removed feature explanation")
//            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK button title"), style: .default, handler: nil))
//            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//        }
    }
}
