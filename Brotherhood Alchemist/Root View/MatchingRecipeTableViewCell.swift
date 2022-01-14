//
//  MatchingRecipeTableViewCell.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-03.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class MatchingRecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var concoctionEffectsLabel: UILabel!
    @IBOutlet weak var estimatedValueLabel: UILabel!
    @IBOutlet weak var ingredient1View: RecipeIngredientView!
    @IBOutlet weak var ingredient2View: RecipeIngredientView!
    @IBOutlet weak var ingredient3View: RecipeIngredientView!
    @IBOutlet weak var backRoundedView: UIView!
    @IBOutlet weak var hideIngredient3LayoutConstraint: NSLayoutConstraint!

    var concoction: Concoction!

    class func nib() -> UINib {
        return UINib(nibName: "MatchingRecipeTableViewCell", bundle: nil)
    }
    static let identifier: String = "recipeCell"

    override func awakeFromNib() {
        super.awakeFromNib()

        backRoundedView?.layer.cornerRadius = 4.0
        backRoundedView?.layer.masksToBounds = true
    }

    func update(with concoction: Concoction) {
        self.concoction = concoction

        guard concoction.ingredients.count >= 2 else { return }

        let effectsDescription = stringFromEffects(concoction.effects)
        concoctionEffectsLabel?.text = effectsDescription

        let estimatedValue = estimateTotalValue(concoction.effects)
        estimatedValueLabel?.text = "$\(estimatedValue)"

        guard let ingredient1 = Ingredient.matchingType(concoction.ingredients[0]) else { return }
        ingredient1View?.update(with: ingredient1)

        guard let ingredient2 = Ingredient.matchingType(concoction.ingredients[1]) else { return }
        ingredient2View?.update(with: ingredient2)

        if concoction.ingredients.count == 3 {
            guard let ingredient3 = Ingredient.matchingType(concoction.ingredients[2]) else { return }
            ingredient3View?.update(with: ingredient3)
            hideIngredient3LayoutConstraint.priority = UILayoutPriority(rawValue: 1)
            ingredient3View?.isHidden = false
        } else {
            hideIngredient3LayoutConstraint.priority = UILayoutPriority(rawValue: 999)
            ingredient3View?.isHidden = true
        }
    }

    private func estimateTotalValue(_ effects: [Effect.EffectType] ) -> Int {
        var estimatedValue: Int = 0

        for effectType in effects {
            let effect = Effect.matchingType(effectType)
            estimatedValue += effect?.value ?? 0
        }
        return estimatedValue
    }

    private func stringFromEffects(_ effects: [Effect.EffectType]) -> String {
        var descriptions: [String] = []
        for effectType in effects {
            guard let effect = Effect.matchingType(effectType) else { return "" }
            if effect.isPositive {
                descriptions.append("+ \(effect.name)")
            } else {
                descriptions.append("- \(effect.name)")
            }
        }
        descriptions = descriptions.sorted(by: { (str1, str2) -> Bool in
            return str1.localizedCompare(str2) == .orderedAscending
        })
        return descriptions.joined(separator: "\n")
    }
}
