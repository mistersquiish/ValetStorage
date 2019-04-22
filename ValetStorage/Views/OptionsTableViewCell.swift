//
//  OptionsTableViewCell.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/22/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var optionsNameLabel: UILabel!

    @IBOutlet weak var optionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
