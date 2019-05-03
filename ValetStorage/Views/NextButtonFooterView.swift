//
//  NextButtonFooterView.swift
//  ValetStorage
//
//  Created by Henry Vuong on 5/3/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

protocol nextButtonDelegate {
    func nextButton()
}

class NextButtonFooterView: UICollectionReusableView {
    
    var nextDelegate: AdditionalInfoViewController!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        nextDelegate.nextButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // UI settings
        nextButtonOutlet.layer.masksToBounds = false
        nextButtonOutlet.layer.borderWidth = 0.5
        nextButtonOutlet.layer.cornerRadius = 12
        nextButtonOutlet.clipsToBounds = true
        nextButtonOutlet.backgroundColor = ColorScheme.valet_orange
    }
}
