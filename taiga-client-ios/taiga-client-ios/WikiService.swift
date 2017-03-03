//
//  WikiService.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya

enum WikiService {
    case getWikiLinks(projectId: Int)
    case getWikiPage(pageId: Int)
}

extension WikiService: TargetType {
    var baseURL: URL {
        return URL(string: TaigaSettings.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .getWikiLinks:
            return "/wiki-links"
        case .getWikiPage(let pageId):
            return "/wiki/\(pageId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWikiLinks, .getWikiPage:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getWikiLinks(let projectId):
            return ["project" : projectId]
        case .getWikiPage:
            return [:]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getWikiLinks, .getWikiPage:
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
        case .getWikiLinks, .getWikiPage:
            return true
        }
    }
}
