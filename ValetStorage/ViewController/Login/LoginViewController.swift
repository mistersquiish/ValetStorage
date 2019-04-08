//
//  LoginViewController.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/6/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signupOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonOutlet.backgroundColor = ColorScheme.valet_blue
        signupOutlet.tintColor = ColorScheme.valet_orange
        TokenKeychain.clearAccessToken()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            LoginService.login(email: emailTextField.text!, password: passwordTextField.text!)
            if (KeychainWrapper.standard.string(forKey: TokenKeychain.accessTokenKey) != nil) {
                self.performSegue(withIdentifier: "HomeViewSegue", sender: nil)
            }
        }
       
    }
    
    @IBAction func signupButton(_ sender: Any) {
        
    }
    

}
