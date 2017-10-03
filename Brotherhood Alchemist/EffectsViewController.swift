//
//  EffectsViewController.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class EffectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupActiveAndInactiveSwitch: UISwitch!

    static let shouldGroupActiveAndInactiveKey = "GroupActiveAndInactiveEffects"

    fileprivate var sortedEffects: [[Effect]] = []

    class func fromNib() -> EffectsViewController? {
        return EffectsViewController(nibName: "EffectsViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        tableView.reloadData()
        navigationController?.isNavigationBarHidden = true

        _ = NotificationCenter.default.addObserver(forName: EffectTracker.updatedNotification, object: nil, queue: nil, using: { (_) in
            self.filterAndReload()
        })

        groupActiveAndInactiveSwitch.isOn = shouldGroupActiveAndInactive()
        EffectTracker.markAllActive()
        filterAndReload()
    }

    func registerCell() {
        let nib = EffectEnabledTableViewCell.nib()
        tableView?.register(nib, forCellReuseIdentifier: EffectEnabledTableViewCell.identifier)
    }

    private func filterAndReload() {
        if shouldGroupActiveAndInactive() {
            sortedEffects = [Effect.all]
        } else {
            var activeEffects: [Effect] = []
            var inactiveEffects: [Effect] = []
            for effect in Effect.all {
                if EffectTracker.active.contains(effect.type) {
                    activeEffects.append(effect)
                } else {
                    inactiveEffects.append(effect)
                }
            }
            sortedEffects = [activeEffects, inactiveEffects]
        }
        tableView?.reloadData()
    }

    private func shouldGroupActiveAndInactive() -> Bool {
        return UserDefaults.standard.bool(forKey: EffectsViewController.shouldGroupActiveAndInactiveKey)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let effects = sortedEffects[section]
        return effects.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedEffects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let effectCell = tableView.dequeueReusableCell(withIdentifier: EffectEnabledTableViewCell.identifier, for: indexPath) as? EffectEnabledTableViewCell else {
            return UITableViewCell()
        }
        let effects = sortedEffects[indexPath.section]
        let effect = effects[indexPath.row]
        effectCell.update(using: effect)
        return effectCell
    }

    @IBAction
    func groupActiveAndInactiveToggled(_: Any?) {
        let ud = UserDefaults.standard
        ud.set(groupActiveAndInactiveSwitch.isOn, forKey: EffectsViewController.shouldGroupActiveAndInactiveKey)
        ud.synchronize()

        filterAndReload()
        DispatchQueue.main.async {
            let numberOfActiveEffects = self.sortedEffects.first?.count ?? 0
            let firstRowPath =  IndexPath(row: 0, section: numberOfActiveEffects > 0 ? 0 : 1)
            self.tableView?.scrollToRow(at: firstRowPath, at: .top, animated: true)
        }
    }

    @IBAction
    func markAllInactive(_: Any?) {
        EffectTracker.markAllInactive()
    }

    @IBAction
    func markAllActive(_: Any?) {
        EffectTracker.markAllActive()
    }
}
