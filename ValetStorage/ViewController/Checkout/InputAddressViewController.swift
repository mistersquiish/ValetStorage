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
        
        // UI settings
        nextButtonOutlet.layer.masksToBounds = false
        nextButtonOutlet.layer.borderWidth = 0.5
        nextButtonOutlet.layer.cornerRadius = 12
        nextButtonOutlet.clipsToBounds = true
        nextButtonOutlet.backgroundColor = ColorScheme.valet_orange
        phoneNumTextField.layer.masksToBounds = false
        phoneNumTextField.layer.borderWidth = 0.5
        phoneNumTextField.layer.cornerRadius = 12
        phoneNumTextField.clipsToBounds = true
        zipCodeTextField.layer.masksToBounds = false
        zipCodeTextField.layer.borderWidth = 0.5
        zipCodeTextField.layer.cornerRadius = 12
        zipCodeTextField.clipsToBounds = true
        otherAddressTextField.layer.masksToBounds = false
        otherAddressTextField.layer.borderWidth = 0.5
        otherAddressTextField.layer.cornerRadius = 12
        otherAddressTextField.clipsToBounds = true
        streetAddressTextField.layer.masksToBounds = false
        streetAddressTextField.layer.borderWidth = 0.5
        streetAddressTextField.layer.cornerRadius = 12
        streetAddressTextField.clipsToBounds = true
        specialInstructionsTextField.layer.masksToBounds = false
        specialInstructionsTextField.layer.borderWidth = 0.5
        specialInstructionsTextField.layer.cornerRadius = 12
        specialInstructionsTextField.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if (phoneNumTextField.text?.count)! >= 12 || (phoneNumTextField.text?.count)! == 0 {
            inputError.text = "Please enter a valid phone number."}
        else if (zipCodeTextField.text?.count)! > 9 || (zipCodeTextField.text?.prefix(3)) != "787"{
            inputError.text = "Please Enter a Valid Austin Zipcode."}
        else if (streetAddressTextField.text?.count) == 0{
            inputError.text = "Please Input an Address."}
        
        else {self.performSegue(withIdentifier: "AdditionalInfoSegue", sender: nil)
        }
    }

}

