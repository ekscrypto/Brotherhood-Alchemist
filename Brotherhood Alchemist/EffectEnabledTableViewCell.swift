//
//  EffectEnabledTableViewCell.swift
//  Brotherhood Alchemist
//
//  Created by Dave Poirier on 2017-10-02.
//  Copyright © 2017 Soft.io. All rights reserved.
//

import UIKit

class EffectEnabledTableViewCell: UITableViewCell {

    @IBOutlet var effectNameLabel: UILabel!

    class func nib() -> UINib {
        return UINib(nibName: "EffectEnabledTableViewCell", bundle: nil)
    }
    static let identifier: String = "effectCell"

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //        if false == hasGradient {
        //            let gradient = CAGradientLayer()
        //            gradient.frame = contentView.bounds
        //            gradient.colors = [UIColor(hex: "#000000")!, UIColor(hex: "#333333")!]
        //            contentView.backgroundColor = UIColor.clear
        //            self.backgroundView?.layer.insertSublayer(gradient, at: 0)
        //            hasGradient = true
        //        }
    }

    func update(using effect: Effect) {
        effectNameLabel?.text = effect.name
    }
}
