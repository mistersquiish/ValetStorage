//
//  ConfirmationViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 5/4/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var monthlyTotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var confirmButtonOutlet: UIButton!
    
    var order: Order!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        // UI settings
        confirmButtonOutlet.layer.masksToBounds = false
        confirmButtonOutlet.layer.borderWidth = 0.5
        confirmButtonOutlet.layer.cornerRadius = 12
        confirmButtonOutlet.clipsToBounds = true
        confirmButtonOutlet.backgroundColor = ColorScheme.valet_blue
        
        subtotalLabel.text = formatter.string(from: NSNumber(value: order.initialCost))
        taxLabel.text = formatter.string(from: NSNumber(value: order.tax))
        monthlyTotalLabel.text = formatter.string(from: NSNumber(value: order.monthlyCost))
        totalLabel.text = formatter.string(from: NSNumber(value: order.monthlyCostTotal))
        // assign date
        // dateLabel.text = order.pickupDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
