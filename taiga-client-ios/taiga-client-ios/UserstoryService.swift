//
//  UserstoryService.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 27/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya

enum UserstoryService {
    case getUserstoriesOfProject(projectId: Int)
    case getTimelineOfProject(projectId: Int)
}

extension UserstoryService: TargetType {
    var baseURL: URL {
        return URL(string: TaigaSettings.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .getUserstoriesOfProject:
            return "/userstories"
        case .getTimelineOfProject(let projectId):
            return "/timeline/project/\(projectId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserstoriesOfProject, .getTimelineOfProject:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getUserstoriesOfProject(let projectId):
            return ["project" : projectId]
            
        case .getTimelineOfProject:
            return [:]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getUserstoriesOfProject, .getTimelineOfProject:
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
        case .getUserstoriesOfProject, .getTimelineOfProject:
            return true
        }
    }
}
