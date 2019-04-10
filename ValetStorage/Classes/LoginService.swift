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
    }
    static var formError: error = error.incompleteForm
    private static var Manager: Alamofire.SessionManager = {
        
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            
            "stage.valet.storage": .disableEvaluation
        ]
        
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return manager
    }()
    
    
    
    /**
     Calls the Login Web Service to authenticate the user
     */
    public static func login(email:String, password: String, completion: @escaping () -> Void){
        
        if email == "" || password == "" {
            self.formError = error.incompleteForm
            completion()
        } else {
            // Handle Authentication challenge
            
            let delegate: Alamofire.SessionDelegate = LoginService.Manager.delegate
            delegate.sessionDidReceiveChallenge = { session, challenge in
                var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
                var credential: URLCredential?
                if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                    disposition = URLSession.AuthChallengeDisposition.useCredential
                    credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                } else {
                    if challenge.previousFailureCount > 0 {
                        disposition = .cancelAuthenticationChallenge
                    } else {
                        credential = LoginService.Manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                        if credential != nil {
                            disposition = .useCredential
                        }
                    }
                }
                return (disposition, credential)
            }
            
            //Web service Request
            let parameters = [
                "email": email,
                "password": password,
                ]
            let header: HTTPHeaders = ["Accept": "application/json"]
            LoginService.Manager.request("https://apistaging.valet.storage/signin", method: .post, parameters: parameters, encoding: JSONEncoding(options: []),headers :header).responseJSON { response in
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
            // Handle Authentication challenge
            
            let delegate: Alamofire.SessionDelegate = LoginService.Manager.delegate
            delegate.sessionDidReceiveChallenge = { session, challenge in
                var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
                var credential: URLCredential?
                if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                    disposition = URLSession.AuthChallengeDisposition.useCredential
                    credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                } else {
                    if challenge.previousFailureCount > 0 {
                        disposition = .cancelAuthenticationChallenge
                    } else {
                        credential = LoginService.Manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                        if credential != nil {
                            disposition = .useCredential
                        }
                    }
                }
                return (disposition, credential)
            }
            
            //Web service Request
            let parameters = [
                "email": email,
                "password": password,
                "username": full_name
            ]
            let header: HTTPHeaders = ["Accept": "application/json"]
            LoginService.Manager.request("https://apistaging.valet.storage/signup", method: .post, parameters: parameters, encoding: JSONEncoding(options: []),headers :header).responseJSON { response in
                if response.result.isSuccess {
                    let data = response.result.value as? [String: Any]
                    TokenKeychain.updateAccessToken(accessToken: data!["token"] as! String)
                } else {
                    self.formError = error.emailInUse
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