//
//  TokenKeychain.swift
//  ValetStorage
//
//  Created by Henry Vuong on 4/6/19.
//  Copyright © 2019 Team7MIS374. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

// dependency manager to update authentication tokens in KeychainWrapper
class TokenKeychain {

    static let accessTokenKey: String! = "accessToken"
    
    static func updateAccessToken(accessToken: String) {
        KeychainWrapper.standard.set(accessToken, forKey: accessTokenKey)
    }
    
    static func clearAccessToken() {
        KeychainWrapper.standard.removeObject(forKey: accessTokenKey)
    }
    
    static func hasToken() -> Bool {
        return KeychainWrapper.standard.string(forKey: TokenKeychain.accessTokenKey) != nil ? true : false
    }
}
