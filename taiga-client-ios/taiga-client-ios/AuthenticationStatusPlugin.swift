//
//  AuthenticationStatusPlugin.swift
//  taiga-client-ios
//
//  Created by Dominik on 04.03.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Foundation
import Moya
import Result
import SwiftKeychainWrapper

public struct AuthenticationStatusPlugin: PluginType {
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        if case .success(let response) = result {
            // Check for status-code 401 - unauthorized
            if response.statusCode == 401 {
                AuthenticationManager.invalidateUser()
                
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let loginView: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                UIApplication.shared.keyWindow?.rootViewController = loginView
            }
        }
    }
}
