//
//  RecipeIngredientView.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-03.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class RecipeIngredientView: UIView {

    @IBOutlet weak var nameLabel: UILabel!

    var ingredient: Ingredient!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func update(with ingredient: Ingredient) {
        self.ingredient = ingredient
        nameLabel?.text = ingredient.name
    }

    @IBAction
    func removeThisIngredient(_: Any?) {
        guard ingredient != nil else { return }
        IngredientTracker.markInactive(ingredient: ingredient!.type)
    }
}
