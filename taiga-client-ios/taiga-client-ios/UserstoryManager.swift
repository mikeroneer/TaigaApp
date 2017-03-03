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
    var provider: MoyaProvider<UserstoryService>
    static let instance = UserstoryManager()
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<UserstoryService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), NetworkLoggerPlugin()])
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
            case let .failure(error):
                print(error)
            }
        }
    }
}
