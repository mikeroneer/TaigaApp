//
//  WikiManager.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Moya
import SwiftyJSON
import SwiftKeychainWrapper

class WikiManager {
    private static var privateInstance: WikiManager?
    
    var provider: MoyaProvider<WikiService>
    
    private init() {
        let authPlugin = TaigaAccessTokenPlugin(token: KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)!)
        provider = MoyaProvider<WikiService>(plugins: [authPlugin, PaginationPlugin(paginationEnabled: false), AuthenticationStatusPlugin()])
    }
    
    class func instance() -> WikiManager {
        guard let uwInstance = privateInstance else {
            privateInstance = WikiManager()
            return privateInstance!
        }
        return uwInstance
    }
    
    class func destroy() {
        privateInstance = nil
    }
    
    func getWikiLinksForProject(projectId: Int, completion: @escaping (_ wikiLinks: [WikiLink]) -> ()) {
        provider.request(.getWikiLinks(projectId: projectId)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    var wikiLinks: [WikiLink] = []
                    
                    for wikiLink in json.arrayValue {
                        let entry = WikiLink(json: wikiLink)
                        wikiLinks.append(entry)
                    }
                    
                    completion(wikiLinks)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getWikiPage(pageId: Int, completion: @escaping (_ wikiPage: WikiPage) -> ()) {
        provider.request(.getWikiPage(pageId: pageId)) { result in
            switch result {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    let json = JSON(data: (moyaResponse.data))
                    
                    completion(WikiPage(json: json))
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
