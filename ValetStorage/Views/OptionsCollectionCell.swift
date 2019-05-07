//
//  OptionsCollectionCell.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/23/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class OptionsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var optionsNameLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var optionImage: UIImageView!
    
    @IBOutlet weak var optionDesc: UILabel!
    
    @IBOutlet weak var space: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // rounding edges of cell
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
        self.clipsToBounds = true

    }
    
    override var isHighlighted: Bool {
        didSet {
            shrink(down: isHighlighted)
        }
    }
    
    // shrinking animation
    func shrink(down: Bool) {
        UIView.animate(withDuration: 0.6) {
            if down {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            } else {
                    self.transform = .identity
                }
            }
    }
}
