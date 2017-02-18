//
//  UserService.swift
//  taiga-client-ios
//
//  Created by Dominik on 18.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya

enum UserService {
    case getMe()
    case getUserById(userid: Int)
}

extension UserService : TargetType {
    var baseURL: URL {
        return URL(string: TaigaSettings.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .getMe:
            return "/users/me"
        case .getUserById(let userid):
            return "/users/\(userid)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserById, .getMe:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getMe, .getUserById:
            return [:]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getMe, .getUserById:
            return URLEncoding.default
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
        default:
            return .request
        }
    }
    
    var validate: Bool {
        switch self {
        case .getMe, .getUserById:
            return true
        }
    }
}
