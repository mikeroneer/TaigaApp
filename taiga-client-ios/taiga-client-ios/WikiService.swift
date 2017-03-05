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
    case getWikiPageBySlug(slug: String)
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
        case .getWikiPageBySlug:
            return "wiki/by_slug"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWikiLinks, .getWikiPage, .getWikiPageBySlug:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getWikiLinks(let projectId):
            return ["project" : projectId]
        case .getWikiPage:
            return [:]
        case .getWikiPageBySlug(let slug):
            return ["project" : TaigaSettings.SELECTED_PROJECT_ID, "slug" : slug]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default:
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
        default:
            return true
        }
    }
}
