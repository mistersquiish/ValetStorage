//
//  AdditionalInfoCell.swift
//  ValetStorage
//
//  Created by Henry Vuong on 5/2/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class AdditionalInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButtonOutlet: UIButton!
    @IBOutlet weak var noButtonOutlet: UIButton!
    var hasSelected: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // rounding edges of cell
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 0.5
    }
    
    @IBAction func yesButton(_ sender: Any) {
        yesButtonOutlet.setImage(UIImage(named: "yes-selected"), for: UIControlState.normal)
        noButtonOutlet.setImage(UIImage(named: "no-unselected"), for: UIControlState.normal)
        hasSelected = true
    }
    
    @IBAction func noButton(_ sender: Any) {
        yesButtonOutlet.setImage(UIImage(named: "yes-unselected"), for: UIControlState.normal)
        noButtonOutlet.setImage(UIImage(named: "no-selected"), for: UIControlState.normal)
        hasSelected = true
    }
    
    
}
