//
//  UserDetail.swift
//  taiga-client-ios
//
//  Created by Dominik on 18.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class UserDetail {
    let id: Int
    let username: String
    let full_name: String
    let gravatar_id: String
    let total_private_projects: Int
    let total_public_projects: Int
    var projects_with_me = [ProjectsWithMe]()
    
    init(json: JSON) {
        id = json["id"].intValue
        username = json["username"].stringValue
        full_name = json["full_name"].stringValue
        gravatar_id = json["gravatar_id"].stringValue
        total_private_projects = json["total_private_projects"].intValue
        total_public_projects = json["total_public_projects"].intValue
        let projectArrayJson = json["projects_with_me"].array
        
        for projectJson in projectArrayJson! {
            projects_with_me.append(ProjectsWithMe(json: projectJson))
        }
    }
    
    
    class ProjectsWithMe {
        let id: Int
        let name: String
        let slug: String
        
        init(json: JSON) {
            id = json["id"].intValue
            name = json["name"].stringValue
            slug = json["slug"].stringValue
        }
    }
}
