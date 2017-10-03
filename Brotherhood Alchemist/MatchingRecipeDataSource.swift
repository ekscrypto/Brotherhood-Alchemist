//
//  MatchingRecipeDataSource.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-03.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class MatchingRecipeDataSource: NSObject, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchingActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!

    let searchQueue = DispatchQueue(label: "concoction search", qos: .background, attributes: [.concurrent], autoreleaseFrequency: .inherit, target: nil)
    var searchRevision: Int = 0
    var searchResults: [Concoction] = []

    override func awakeFromNib() {
        super.awakeFromNib()

        registerCell()

        _ = NotificationCenter.default.addObserver(forName: IngredientTracker.updatedNotification, object: nil, queue: nil, using: { (_) in
            self.updateSearchResults()
        })
        _ = NotificationCenter.default.addObserver(forName: EffectTracker.updatedNotification, object: nil, queue: nil, using: { (_) in
            self.updateSearchResults()
        })
    }

    private func updateSearchResults() {

        let activeIngredients = IngredientTracker.active
        let activeEffects = EffectTracker.active

        searchRevision += 1
        let referenceSearchRevision = searchRevision
        searchResults = []
        tableView?.reloadData()
        searchingActivityIndicatorView?.startAnimating()
        statusLabel?.isHidden = true

        searchQueue.async {
            var matchingConcoctions: [Concoction] = []
            for concoction in Concoction.all {
                if self.searchRevision != referenceSearchRevision {
//                    print("Search aborted revision \(self.searchRevision) != \(referenceSearchRevision)")
                    return
                }

                var hasAllIngredients: Bool = true
                for ingredient in concoction.ingredients {
                    hasAllIngredients = hasAllIngredients && activeIngredients.contains(ingredient)
                }
                if hasAllIngredients == false {
                    continue
                }

                var matchAtLeastOneDesiredEffect = false
                for effect in concoction.effects {
                    matchAtLeastOneDesiredEffect = matchAtLeastOneDesiredEffect || activeEffects.contains(effect)
                }
                if matchAtLeastOneDesiredEffect == false {
                    continue
                }

                matchingConcoctions.append(concoction)
            }
            DispatchQueue.main.async {
                if self.searchRevision != referenceSearchRevision {
//                    print("Search aborted revision \(self.searchRevision) != \(referenceSearchRevision)")
                    return
                }
                self.statusLabel?.text = "\(matchingConcoctions.count) Recipes"
                self.statusLabel?.isHidden = false
                self.searchResults = matchingConcoctions
                self.tableView?.reloadData()
                self.searchingActivityIndicatorView?.stopAnimating()
            }
        }
    }

    func registerCell() {
        guard tableView != nil else {
//            print("ERROR: tableView undefined, will not be able to register cell identifier")
            return
        }

        let nib = MatchingRecipeTableViewCell.nib()
        tableView?.register(nib, forCellReuseIdentifier: MatchingRecipeTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var recipeCell = tableView.dequeueReusableCell(withIdentifier: MatchingRecipeTableViewCell.identifier) as? MatchingRecipeTableViewCell
        if recipeCell == nil {
            registerCell()
            recipeCell = tableView.dequeueReusableCell(withIdentifier: MatchingRecipeTableViewCell.identifier) as? MatchingRecipeTableViewCell
        }
        let concoction = searchResults[indexPath.row]
        recipeCell?.update(with: concoction)
        return recipeCell ?? UITableViewCell()
    }
}
