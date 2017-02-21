//
//  ProjectService.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya

enum ProjectService {
    case getProjectsForUser(userid: Int)
}

extension ProjectService : TargetType {
    var baseURL: URL {
        return URL(string: TaigaSettings.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .getProjectsForUser:
            return "/projects"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProjectsForUser:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getProjectsForUser(let userid):
            return ["member" : userid]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getProjectsForUser:
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
        case .getProjectsForUser:
            return .request
        }
    }
    
    var validate: Bool {
        switch self {
        case .getProjectsForUser:
            return true
        }
    }
}
