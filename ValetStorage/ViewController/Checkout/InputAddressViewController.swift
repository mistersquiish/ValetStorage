//
//  InputAddressViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/28/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class InputAddressViewController: UIViewController {
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var otherAddressTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var specialInstructionsTextField: UITextField!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var inputError: UILabel!
    
    var order: Order!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if (phoneNumTextField.text?.count)! >= 12 || (phoneNumTextField.text?.count)! == 0 {
            inputError.text = "Enter a valid phone number."
        } else if (zipCodeTextField.text?.count)! > 9 && (zipCodeTextField.text?.prefix(4) != "787") {
            inputError.text = "Enter a valid Austin zip code."
        } else if (streetAddressTextField.text?.count) == 0{
            inputError.text = "Please Input an Address."
        }
    }

}
