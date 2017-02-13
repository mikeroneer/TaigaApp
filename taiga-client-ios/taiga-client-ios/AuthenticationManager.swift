//
//  AuthenticationManager.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya

class AuthenticationManager {
    static let provider = MoyaProvider<AuthenticationService>()
    
    static func authenticateUser(username: String, password: String, completion: @escaping (_ authToken: String) -> ()) {
        provider.request(.authenticateUser(username: username, password: password)) { result in
            switch result {
            case let .success(moyaResponse):
                //let json = JSON(data: (moyaResponse.data))
                print("Login successful")
            default:
                print("Request failed")
            }
            
        }
    }
}
