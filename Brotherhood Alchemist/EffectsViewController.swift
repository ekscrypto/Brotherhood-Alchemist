//
//  EffectsViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class EffectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    class func fromNib() -> EffectsViewController? {
        return EffectsViewController(nibName: "EffectsViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        tableView.reloadData()
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func registerCell() {
        let nib = EffectEnabledTableViewCell.nib()
        let objects = nib.instantiate(withOwner: nil, options: nil)
        print("objects: \(objects)")
        tableView.register(nib, forCellReuseIdentifier: EffectEnabledTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Effect.all.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let effectCell = tableView.dequeueReusableCell(withIdentifier: EffectEnabledTableViewCell.identifier, for: indexPath) as? EffectEnabledTableViewCell else {
            return UITableViewCell()
        }
        let effect = Effect.all[indexPath.row]
        effectCell.update(using: effect)
        return effectCell
    }
}
