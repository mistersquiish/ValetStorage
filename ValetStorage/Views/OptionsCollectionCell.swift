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
        
        // Shadow effect
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.shadowRadius = self.contentView.layer.cornerRadius
    }
}
