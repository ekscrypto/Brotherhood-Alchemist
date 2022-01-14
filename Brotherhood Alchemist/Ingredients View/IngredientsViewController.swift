//
//  IngredientsViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-01.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupActiveAndInactiveSwitch: UISwitch!

    static let shouldGroupActiveAndInactiveKey = "GroupActiveAndInactiveIngredients"

    fileprivate var sortedIngredients: [[Ingredient]] = []

    class func fromNib() -> IngredientsViewController? {
        return IngredientsViewController(nibName: "IngredientsViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        navigationController?.isNavigationBarHidden = true

        _ = NotificationCenter.default.addObserver(forName: IngredientTracker.updatedNotification, object: nil, queue: nil, using: { (_) in
            self.filterAndReload()
        })

        groupActiveAndInactiveSwitch.isOn = shouldGroupActiveAndInactive()
        filterAndReload()
    }

    private func filterAndReload() {
        if shouldGroupActiveAndInactive() {
            sortedIngredients = [Ingredient.all]
        } else {
            var activeIngredients: [Ingredient] = []
            var inactiveIngredients: [Ingredient] = []
            for ingredient in Ingredient.all {
                if IngredientTracker.active.contains(ingredient.type) {
                    activeIngredients.append(ingredient)
                } else {
                    inactiveIngredients.append(ingredient)
                }
            }
            sortedIngredients = [activeIngredients, inactiveIngredients]
        }
        tableView?.reloadData()
    }

    private func shouldGroupActiveAndInactive() -> Bool {
        return UserDefaults.standard.bool(forKey: IngredientsViewController.shouldGroupActiveAndInactiveKey)
    }

    func registerCell() {
        tableView?.register(IngredientAvailableTableViewCell.nib(), forCellReuseIdentifier: IngredientAvailableTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ingredientsInSection = sortedIngredients[section]
        return ingredientsInSection.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedIngredients.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let ingredientCell = tableView.dequeueReusableCell(withIdentifier: IngredientAvailableTableViewCell.identifier) as? IngredientAvailableTableViewCell else {
            return UITableViewCell()
        }
        let ingredients = sortedIngredients[indexPath.section]
        let ingredient = ingredients[indexPath.row]
        ingredientCell.update(using: ingredient)
        return ingredientCell
    }

    @IBAction
    func groupActiveAndInactiveToggled(_: Any?) {
        let ud = UserDefaults.standard
        ud.set(groupActiveAndInactiveSwitch.isOn, forKey: IngredientsViewController.shouldGroupActiveAndInactiveKey)
        ud.synchronize()

        filterAndReload()

        DispatchQueue.main.async {
            let numberOfActiveIngredients = self.sortedIngredients.first?.count ?? 0
            let firstRowPath =  IndexPath(row: 0, section: numberOfActiveIngredients > 0 ? 0 : 1)
            self.tableView?.scrollToRow(at: firstRowPath, at: .top, animated: true)
        }
    }

    @IBAction
    func markAllInactive(_: Any?) {
        IngredientTracker.markAllInactive()
    }

    @IBAction
    func markAllActive(_: Any?) {
        IngredientTracker.markAllActive()
    }
}
