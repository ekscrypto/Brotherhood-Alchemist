//
//  IngredientAvailableTableViewCell.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class IngredientAvailableTableViewCell: UITableViewCell {

    @IBOutlet var ingredientNameLabel: UILabel!

    class func nib() -> UINib {
        return UINib(nibName: "IngredientAvailableTableViewCell", bundle: nil)
    }
    static let identifier: String = "ingredientCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(using ingredient: Ingredient) {
        ingredientNameLabel?.text = ingredient.name
    }

}
