//
//  ProjectListEntry.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class ProjectListEntry {
    let id: Int
    let name: String
    let description: String
    let is_kanban_activated: Bool
    let is_private: Bool
    let total_activity_last_week: Int
    let total_activity_last_month: Int
    let total_activity_last_year: Int
    let total_fans: Int
    let total_watchers: Int
    let members: [Int]
    let logo_small_url: String?
 
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        is_kanban_activated = json["is_kanban_activated"].boolValue
        is_private = json["is_private"].boolValue
        total_activity_last_week = json["total_activity_last_week"].intValue
        total_activity_last_month = json["total_activity_last_month"].intValue
        total_activity_last_year = json["total_activity_last_year"].intValue
        total_fans = json["total_fans"].intValue
        total_watchers = json["total_watchers"].intValue
        var membersArray: [Int] = []
        let membersJson = json["members"].arrayValue
        for member in membersJson {
            membersArray.append(member.intValue)
        }
        members = membersArray
        logo_small_url = json["logo_small_url"].string
    }
}
