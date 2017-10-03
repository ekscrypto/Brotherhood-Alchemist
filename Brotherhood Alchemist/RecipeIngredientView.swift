//
//  RecipeIngredientView.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-03.
//  Copyright © 2017 Soft.io. All rights reserved.
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
    }
}
