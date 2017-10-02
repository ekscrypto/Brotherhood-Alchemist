//
//  IngredientsViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    class func fromNib() -> IngredientsViewController? {
        return IngredientsViewController(nibName: "IngredientsViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()

        print("available ingredients: \(Ingredient.all)")

        tableView.reloadData()
    }

    func registerCell() {
        tableView.register(IngredientAvailableTableViewCell.nib(), forCellReuseIdentifier: IngredientAvailableTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ingredient.all.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt: \(indexPath.row)")
        guard let ingredientCell = tableView.dequeueReusableCell(withIdentifier: IngredientAvailableTableViewCell.identifier, for: indexPath) as? IngredientAvailableTableViewCell else {
            return UITableViewCell()
        }
        let ingredient = Ingredient.all[indexPath.row]
        ingredientCell.update(using: ingredient)
        return ingredientCell
    }
}
