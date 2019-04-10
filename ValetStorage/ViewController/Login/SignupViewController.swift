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
    @IBOutlet weak var signinButtonOutlet: UIButton!
    // Contraints for animations
    @IBOutlet weak var TopConstraintLogo: NSLayoutConstraint!
    @IBOutlet weak var BottomConstraintLogo: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI settings
        signupButtonOutlet.backgroundColor = ColorScheme.valet_blue
        formFeedbackLabel.alpha = 0
        signinButtonOutlet.tintColor = ColorScheme.valet_orange
        emailTextField.layer.masksToBounds = false
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 12
        emailTextField.clipsToBounds = true
        passwordTextField.layer.masksToBounds = false
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.clipsToBounds = true
        nameTextField.layer.masksToBounds = false
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.cornerRadius = 12
        nameTextField.clipsToBounds = true
        signupButtonOutlet.layer.masksToBounds = false
        signupButtonOutlet.layer.borderWidth = 0.5
        signupButtonOutlet.layer.cornerRadius = 12
        signupButtonOutlet.clipsToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // dismiss keyboard if view is tapped
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
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
    
    @IBAction func signinButton(_ sender: Any) {
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
    
    // methods for keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        self.TopConstraintLogo.constant = 15
        self.BottomConstraintLogo.constant = 15
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.TopConstraintLogo.constant = 60
        self.BottomConstraintLogo.constant = 30
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}
