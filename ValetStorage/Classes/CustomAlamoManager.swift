//
//  CustomAlamoManager.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/26/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import Foundation
import Alamofire

// Challenges SSL Authentication and allows communciation with the Valet Storage API
// Should be removed when pushed to production as Apple will not allow authentication challenges
class CustomAlamoManager {
    public static var Manager: Alamofire.SessionManager = {
        
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            
            "valet.storage": .disableEvaluation,
            "api.valet.storage": .disableEvaluation
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
    
    // Don't think we need this anymore but it's here just in case
    // function handles the authentication challenge
    public static func handleAuthChallenge() {
        let delegate: Alamofire.SessionDelegate = CustomAlamoManager.Manager.delegate
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
                    credential = CustomAlamoManager.Manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }
 

}
