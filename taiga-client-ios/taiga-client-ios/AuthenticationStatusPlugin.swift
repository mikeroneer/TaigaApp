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

public struct AuthenticationStatusPlugin: PluginType {
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        if case .success(let response) = result {
            print(response.statusCode)
        } else {
            
        }
    }
}
