//
//  IngredientAvailableTableViewCell.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class IngredientAvailableTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientNameLabel: UILabel!
    @IBOutlet weak var statusView: UIView!

    weak var ingredient: Ingredient!

    class func nib() -> UINib {
        return UINib(nibName: "IngredientAvailableTableViewCell", bundle: nil)
    }
    static let identifier: String = "ingredientCell"

    override func awakeFromNib() {
        super.awakeFromNib()

        statusView?.layer.masksToBounds = true
        statusView?.layer.borderColor = UIColor.darkGray.cgColor
        statusView?.layer.borderWidth = 2.0
        statusView?.layer.cornerRadius = statusView!.bounds.width * 0.25
    }

    func update(using ingredient: Ingredient) {
        self.ingredient = ingredient
        ingredientNameLabel?.text = ingredient.name
        let selected = IngredientTracker.active.contains(ingredient.type)
        if selected {
            statusView.backgroundColor = UIColor.green
            statusView?.layer.borderColor = UIColor.white.cgColor
        } else {
            statusView.backgroundColor = UIColor.clear
            statusView?.layer.borderColor = UIColor.darkGray.cgColor
        }
    }

    @IBAction
    func toggleStatus(_: Any?) {
        guard ingredient != nil else { return }
        let selected = IngredientTracker.active.contains(ingredient.type)
        if selected {
            IngredientTracker.markInactive(ingredient: ingredient.type)
        } else {
            IngredientTracker.markActive(ingredient: ingredient.type)
        }
    }
}
