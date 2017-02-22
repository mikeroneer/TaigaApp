//
//  ProjectManager.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya
import SwiftyJSON
import SwiftKeychainWrapper

class ProjectManager {
    var provider: MoyaProvider<ProjectService>
    static let instance = ProjectManager()
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<ProjectService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), NetworkLoggerPlugin()])
    }
    
    func getProjectsForUser(userid: Int, completion: @escaping (_ projectListEntries: [ProjectListEntry]) -> ()) {
        provider.request(.getProjectsForUser(userid: userid)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    var projectListEntries: [ProjectListEntry] = []
                    
                    for projectJson in json.arrayValue {
                        let entry = ProjectListEntry(json: projectJson)
                        projectListEntries.append(entry)
                    }
                    
                    completion(projectListEntries)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func createProject(project: ProjectCreate, completion: @escaping (_ projectDetails: ProjectDetail?) ->()) {
        provider.request(.createProject(project: project)) { result in
            switch result {
            case let .success(moyaResponse):
                let json = JSON(data: moyaResponse.data)
                let projectDetails = ProjectDetail(json: json)
                if moyaResponse.statusCode == 201 {
                    completion(projectDetails)
                } else {
                    completion(nil)
                }
            case let .failure(error):
                print(error)
                completion(nil)
            }
        }
    }
}
