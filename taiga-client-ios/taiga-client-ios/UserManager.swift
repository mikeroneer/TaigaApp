//
//  UserManager.swift
//  taiga-client-ios
//
//  Created by Dominik on 18.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya
import SwiftyJSON
import SwiftKeychainWrapper

class UserManager {
    var provider: MoyaProvider<UserService>
    static let instance = UserManager()
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<UserService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), NetworkLoggerPlugin()])
    }
    
    func getMe(completion: @escaping (_ userDetail: UserDetail) -> ()) {
        provider.request(.getMe()) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    completion(UserDetail(json: json))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getUserById(userid: Int, completion: @escaping (_ userDetail: UserDetail) -> ()) {
        provider.request(.getUserById(userid: userid)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    completion(UserDetail(json: json))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}