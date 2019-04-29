//
//  InputAddressViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/28/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class InputAddressViewController: UIViewController {
    
    @IBOutlet weak var phoneNum: UITextField!
    
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var otherAddress: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var specialInstructions: UITextField!
    
    @IBOutlet weak var inputError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if (phoneNum.text?.count)! >= 12 || (phoneNum.text?.count)! == 0{
            inputError.text = "Enter a valid phone number."
        }
        if (zipCode.text?.count)! > 9 && (zipCode.text?.prefix(4) != "787"){
            inputError.text = "Enter a valid Austin zip code."
        }
        if (streetAddress.text?.count) == 0{
            inputError.text = "Please Input an Address."
        }
        
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
