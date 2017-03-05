//
//  TimelineManager.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 28/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya
import SwiftyJSON
import SwiftKeychainWrapper

class TimelineManager {
    static let instance = TimelineManager()
    
    var provider: MoyaProvider<UserstoryService>
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<UserstoryService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), AuthenticationStatusPlugin()])
    }
    
    func getProjectTimeline(projectId: Int, completion: @escaping (_ timelineDetails: [TimelineEntryDetail]) -> ()) {
        provider.request(.getTimelineOfProject(projectId: projectId)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    var timelineDetails: [TimelineEntryDetail] = []
                    
                    for issueJson in json.arrayValue {
                        let entry = TimelineEntryDetail(json: issueJson)
                        timelineDetails.append(entry)
                    }
                    
                    completion(timelineDetails)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
