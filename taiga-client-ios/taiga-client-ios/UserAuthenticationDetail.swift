//
//  UserAuthenticationDetail.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class UserAuthenticationDetail {
    var auth_token: String
    var full_name: String
    var total_private_projects: String
    var total_public_projects: String
    
    init(json: JSON) {
        auth_token = json["auth_token"].stringValue
        full_name = json["full_name"].stringValue
        total_private_projects = json["total_private_projects"].stringValue
        total_public_projects = json["total_public_projects"].stringValue
    }
}
