//
//  SignupViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/7/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    @IBOutlet weak var formFeedbackLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signupButtonOutlet.backgroundColor = ColorScheme.valet_blue
        formFeedbackLabel.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signupButton(_ sender: Any) {
        
        LoginService.signup(email: emailTextField.text!, password: passwordTextField.text!, full_name: nameTextField.text!)
        if (KeychainWrapper.standard.string(forKey: TokenKeychain.accessTokenKey) != nil) {
            self.performSegue(withIdentifier: "HomeViewSegue", sender: nil)
        }
        
        updateFormFeedback()
    }
    
    func updateFormFeedback() {
        switch LoginService.formError {
        case LoginService.error.enterFullName:
            formFeedbackLabel.alpha = 1
            formFeedbackLabel.text = "Please enter your full name"
        case LoginService.error.invalidEmail:
            formFeedbackLabel.alpha = 1
            formFeedbackLabel.text = "Please enter a valid email"
        case LoginService.error.emailInUse:
            formFeedbackLabel.alpha = 1
            formFeedbackLabel.text = "Email in use"
        case LoginService.error.shortPassword:
            formFeedbackLabel.alpha = 1
            formFeedbackLabel.text = "Password must be at least 8 characters"
        default:
            formFeedbackLabel.alpha = 1
            formFeedbackLabel.text = "Please enter your name, email, password"
        }
    }
    
}
