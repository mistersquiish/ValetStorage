//
//  InputAddressViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/28/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit

class InputAddressViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var otherAddressTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var specialInstructionsTextField: UITextField!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var inputError: UILabel!
    @IBOutlet weak var contentViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var frameExtended: Bool = false
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
        
        // add oberserver methods to allow keyboard to dismiss
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // dismiss keyboard if view is tapped
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        // UITextFieldDelegate to dismiss keyboard on return and next textfield
        specialInstructionsTextField.delegate = self
        specialInstructionsTextField.returnKeyType = .go
        streetAddressTextField.delegate = self
        streetAddressTextField.returnKeyType = .next
        otherAddressTextField.delegate = self
        otherAddressTextField.returnKeyType = .next
        streetAddressTextField.tag = 0
        otherAddressTextField.tag = 1
        specialInstructionsTextField.tag = 2
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdditionalInfoSegue" {
            let additionalInfoViewController = segue.destination as! AdditionalInfoViewController
            additionalInfoViewController.order = order
        }
        
    }
    
    // methods for keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if !frameExtended {
            contentViewConstraint.constant = contentViewConstraint.constant + 245
             self.view.layoutIfNeeded()
            frameExtended = true
        }
        
       
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if frameExtended {
            contentViewConstraint.constant = contentViewConstraint.constant - 245
            self.view.layoutIfNeeded()
            frameExtended = false
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
            let yChange = nextField.frame.minY - 32
            if nextField == specialInstructionsTextField {
                scrollView.setContentOffset(CGPoint(x: 0, y: yChange - 100), animated: true)
            } else {
                scrollView.setContentOffset(CGPoint(x: 0, y: yChange), animated: true)
            }
        } else {
            // Not found, so remove keyboard.
            specialInstructionsTextField.resignFirstResponder()
            // perform next button function
            if (phoneNumTextField.text?.count)! <= 6 || (phoneNumTextField.text?.count)! >= 12 || (phoneNumTextField.text?.count)! == 0 {
                inputError.text = "Please enter a valid phone number."}
            else if (zipCodeTextField.text?.count)! > 9 || (zipCodeTextField.text?.prefix(3)) != "787"{
                inputError.text = "Please Enter a Valid Austin Zipcode."}
            else if (streetAddressTextField.text?.count) == 0{
                inputError.text = "Please Input an Address."}
                
            else {self.performSegue(withIdentifier: "AdditionalInfoSegue", sender: nil)
            }
        }
        // Do not add a line break
        return false
    }

}

