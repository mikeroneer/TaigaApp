//
//  AuthenticationService.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya

enum AuthenticationService {
    case authenticateUser(username: String, password: String)
}

extension AuthenticationService : TargetType {
    var baseURL: URL {
        return URL(string: TaigaSettings.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .authenticateUser:
            return "/auth/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .authenticateUser:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .authenticateUser(let username, let password):
            return ["username" : username, "password" : password, "type" : "normal"]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .authenticateUser:
            return JSONEncoding.default
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .authenticateUser:
            return .request
        }
    }
    
    var validate: Bool {
        return false
    }
}

