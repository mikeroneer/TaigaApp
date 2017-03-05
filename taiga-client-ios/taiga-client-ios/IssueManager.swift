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
    private static var privateInstance : IssueManager?
    
    var provider: MoyaProvider<IssueService>
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<IssueService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), AuthenticationStatusPlugin()])
    }
    
    class func instance() -> IssueManager {
        guard let uwInstance = privateInstance else {
            privateInstance = IssueManager()
            return privateInstance!
        }
        return uwInstance
    }
    
    class func destroy() {
        privateInstance = nil
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
            case .failure:
                break
            }
        }
    }
    
    func getDetailsOfIssue(issueId: Int, completion: @escaping(_ issueDetails: IssueDetailGET) -> ())  {
        provider.request(.getDetailsOfIssue(issueId: issueId)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    completion(IssueDetailGET(json: json))
                }
            case .failure:
                break
            }
        }
    }
}
