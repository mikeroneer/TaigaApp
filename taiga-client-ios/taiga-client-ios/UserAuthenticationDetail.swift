//
//  UserAuthenticationDetail.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class UserAuthenticationDetail {
    var id: Int
    var authToken: String
    var fullName: String
    var totalPrivateProjects: String
    var totalPublicProjects: String
    
    init(json: JSON) {
        id = json["id"].intValue
        authToken = json["auth_token"].stringValue
        fullName = json["full_name"].stringValue
        totalPrivateProjects = json["total_private_projects"].stringValue
        totalPublicProjects = json["total_public_projects"].stringValue
    }
}
