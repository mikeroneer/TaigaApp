//
//  UserstoryManager.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 27/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya
import SwiftyJSON
import SwiftKeychainWrapper

class UserstoryManager {
    private static var privateInstance: UserstoryManager?
    
    var provider: MoyaProvider<UserstoryService>
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<UserstoryService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), AuthenticationStatusPlugin()])
    }
    
    class func instance() -> UserstoryManager {
        guard let uwInstance = privateInstance else {
            privateInstance = UserstoryManager()
            return privateInstance!
        }
        return uwInstance
    }
    
    class func destroy() {
        privateInstance = nil
    }
    
    func getUserstoresOfProject(projectId: Int, completion: @escaping (_ userStoryDetails: [UserStoryDetail]) -> ()) {
        provider.request(.getUserstoriesOfProject(projectId: projectId)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    var userStoryDetails: [UserStoryDetail] = []
                    
                    for userStoryJson in json.arrayValue {
                        let entry = UserStoryDetail(json: userStoryJson)
                        userStoryDetails.append(entry)
                    }
                    
                    completion(userStoryDetails)
                }
            case .failure:
                break
            }
        }
    }
    
    func getUserstoryById(userstoryId: Int, completion: @escaping( _ userstoryDetail: UserStoryDetailGET) -> ()) {
        provider.request(.getUserstoryById(userstoryId: userstoryId)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    completion(UserStoryDetailGET(json: json))
                }
            case .failure:
                break
            }
        }
    }
}
