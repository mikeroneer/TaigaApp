//
//  TaigaAccessTokenPlugin.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Foundation
import Result
import Moya


public protocol AccessTokenAuthorizable {
    
    /// Declares whether or not `AccessTokenPlugin` should add an authorization header
    /// to requests.
    var shouldAuthorize: Bool { get }
}

public struct TaigaAccessTokenPlugin: PluginType {
    
    /// The access token to be applied in the header.
    public let token: String
    
    private var authVal: String {
        return "Bearer ".appending(token)
    }
    
    /**
     Initialize a new `AccessTokenPlugin`.
     
     - parameters:
     - token: The token to be applied in the pattern `Authorization: Bearer <token>`
     */
    public init(token: String) {
        self.token = token
    }
    
    /**
     Prepare a request by adding an authorization header if necessary.
     
     - parameters:
     - request: The request to modify.
     - target: The target of the request.
     - returns: The modified `URLRequest`.
     */
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let authorizable = target as? AccessTokenAuthorizable, authorizable.shouldAuthorize == false {
            return request
        }
        
        var request = request
        request.addValue(authVal, forHTTPHeaderField: "Authorization")
        
        return request
    }
}
