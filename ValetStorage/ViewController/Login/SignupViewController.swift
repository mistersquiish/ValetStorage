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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signupButtonOutlet.backgroundColor = ColorScheme.valet_blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signupButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" && nameTextField.text != "" {
            LoginService.signup(email: emailTextField.text!, password: passwordTextField.text!, full_name: nameTextField.text!)
            if (KeychainWrapper.standard.string(forKey: TokenKeychain.accessTokenKey) != "") {
                self.performSegue(withIdentifier: "HomeViewSegue", sender: nil)
            }
        }
    }
    
}
