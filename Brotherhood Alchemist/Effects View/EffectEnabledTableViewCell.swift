//
//  EffectEnabledTableViewCell.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017-2022 Dave Poirier. All rights reserved.
//

import UIKit

class EffectEnabledTableViewCell: UITableViewCell {

    @IBOutlet weak var effectNameLabel: UILabel!
    @IBOutlet weak var statusView: UIView!

    weak var effect: Effect!

    class func nib() -> UINib {
        return UINib(nibName: "EffectEnabledTableViewCell", bundle: nil)
    }
    static let identifier: String = "effectCell"

    override func awakeFromNib() {
        super.awakeFromNib()

        statusView?.layer.masksToBounds = true
        statusView?.layer.borderColor = UIColor.darkGray.cgColor
        statusView?.layer.borderWidth = 2.0
        statusView?.layer.cornerRadius = statusView!.bounds.width * 0.25
    }

    func update(using effect: Effect) {
        self.effect = effect
        effectNameLabel?.text = effect.name
        let selected = EffectTracker.active.contains(effect.type)
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
        guard effect != nil else { return }
        let selected = EffectTracker.active.contains(effect.type)
        if selected {
            EffectTracker.markInactive(effect: effect.type)
        } else {
            EffectTracker.markActive(effect: effect.type)
        }
    }
}
