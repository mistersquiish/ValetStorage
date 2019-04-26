//
//  LoginService.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/6/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

class LoginService{
    
    // enum to inform user of what form error
    enum error {
        case wrongPassword
        case incompleteForm
        case emailInUse
        case shortPassword
        case invalidEmail
        case enterFullName
        case connectionError
    }
    static var formError: error = error.incompleteForm
    
    /**
     Calls the Login Web Service to authenticate the user
     */
    public static func login(email:String, password: String, completion: @escaping () -> Void){
        
        if email == "" || password == "" {
            self.formError = error.incompleteForm
            completion()
        } else {
            
            //Web service Request
            let parameters = [
                "email": email,
                "password": password,
                ]
            let header: HTTPHeaders = ["Accept": "application/json"]
            CustomAlamoManager.Manager.request("https://api.valet.storage/signin", method: .post, parameters: parameters, encoding: JSONEncoding(options: []),headers :header).responseJSON { response in
                if response.result.isSuccess {
                    let data = response.result.value as? [String: Any]
                    TokenKeychain.updateAccessToken(accessToken: data!["token"] as! String)
                } else {
                    self.formError = error.wrongPassword
                }
                completion()
            }
        }
        
    }
    public static func signup(email:String, password: String, full_name: String, completion: @escaping () -> Void) {
        
        if email == "" || password == "" || full_name == "" {
            self.formError = error.incompleteForm
            completion()
        } else if !full_name.contains(" ") {
            self.formError = error.enterFullName
            completion()
        } else if !isValidEmail(testStr: email) {
            self.formError = error.invalidEmail
            completion()
        } else if password.count < 8 {
            self.formError = error.shortPassword
            completion()
        } else {
            
            //Web service Request
            let parameters = [
                "email": email,
                "password": password,
                "username": full_name
            ]
            let header: HTTPHeaders = ["Accept": "application/json"]
            CustomAlamoManager.Manager.request("https://api.valet.storage/signup", method: .post, parameters: parameters, encoding: JSONEncoding(options: []),headers :header).responseJSON { response in
                if response.result.isSuccess {
                    let data = response.result.value as? [String: Any]
                    if (data!["error"] as? String) != nil {
                        self.formError = error.emailInUse
                    } else {
                        TokenKeychain.updateAccessToken(accessToken: data!["token"] as! String)
                    }
                
                } else {
                    self.formError = error.connectionError
                }
                completion()
            }
        }
    }
    
    private static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
