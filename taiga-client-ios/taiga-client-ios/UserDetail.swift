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
    let fullName: String
    let gravatarId: String
    let totalPrivateProjects: Int
    let totalPublicProjects: Int
    var projectsWithMe = [ProjectsWithMe]()
    
    init(json: JSON) {
        id = json["id"].intValue
        username = json["username"].stringValue
        fullName = json["full_name"].stringValue
        gravatarId = json["gravatar_id"].stringValue
        totalPrivateProjects = json["total_private_projects"].intValue
        totalPublicProjects = json["total_public_projects"].intValue
        let projectArrayJson = json["projects_with_me"].array
        
        for projectJson in projectArrayJson! {
            projectsWithMe.append(ProjectsWithMe(json: projectJson))
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
