//
//  IssueService.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya

enum IssueService {
    case getIssuesOfProject(projectId: Int)
    case getDetailsOfIssue(issueId: Int)
}

extension IssueService: TargetType {
    var baseURL: URL {
        return URL(string: TaigaSettings.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .getIssuesOfProject:
            return "/issues"
        case .getDetailsOfIssue(let issueId):
            return "/issues/\(issueId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getIssuesOfProject, .getDetailsOfIssue:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getIssuesOfProject(let projectId):
            return ["project" : projectId]
        case .getDetailsOfIssue:
            return [:]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getIssuesOfProject, .getDetailsOfIssue:
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
        case .getIssuesOfProject, .getDetailsOfIssue:
            return true
        }
    }
}
