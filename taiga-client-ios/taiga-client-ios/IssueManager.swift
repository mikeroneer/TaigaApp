//
//  IssueManager.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 28/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya
import SwiftyJSON
import SwiftKeychainWrapper

class IssueManager {
    static let instance = IssueManager()
    
    var provider: MoyaProvider<UserstoryService>
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<UserstoryService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), NetworkLoggerPlugin()])
    }
    
    func getIssuesOfProject(projectId: Int, completion: @escaping (_ issueDetails: [IssueDetail]) -> ()) {
        provider.request(.getIssuesOfProject(projectId: projectId)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    var issueDetails: [IssueDetail] = []
                    
                    for issueJson in json.arrayValue {
                        let entry = IssueDetail(json: issueJson)
                        issueDetails.append(entry)
                    }
                    
                    completion(issueDetails)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
