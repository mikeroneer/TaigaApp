//
//  AuthenticationManager.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya
import SwiftyJSON
import SwiftKeychainWrapper

class AuthenticationManager {
    static let KEY_KEYCHAIN_AUTH_TOKEN = "keychainAuthToken"
    static let KEY_KEYCHAIN_USERNAME_TOKEN = "keychainUsername"
    static let KEY_KEYCHAIN_PASSWORD_TOKEN = "keychainPassword"
    
    static let provider = MoyaProvider<AuthenticationService>()
    
    class func authenticateUser(username: String, password: String, completion: @escaping (_ userAuthenticationDetail: UserAuthenticationDetail?) -> ()) {
        provider.request(.authenticateUser(username: username, password: password)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    let userAuth = UserAuthenticationDetail(json: json)
                    completion(userAuth)
                } else {
                    completion(nil)
                }
            default:
                print("Request failed")
            }
        }
    }
    
    class func invalidateUser() {
        KeychainWrapper.standard.removeObject(forKey: AuthenticationManager.KEY_KEYCHAIN_USERNAME_TOKEN)
        KeychainWrapper.standard.removeObject(forKey: AuthenticationManager.KEY_KEYCHAIN_PASSWORD_TOKEN)
        KeychainWrapper.standard.removeObject(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)
        
        IssueManager.destroy()
        ProjectManager.destroy()
        UserManager.destroy()
        UserstoryManager.destroy()
        WikiManager.destroy()
    }
}
