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
    let isKanbanActivated: Bool
    let isPrivate: Bool
    let totalActivityLastWeek: Int
    let totalActivityLastMonth: Int
    let totalActivityLastYear: Int
    let totalFans: Int
    let totalWatchers: Int
    let members: [Int]
    let logoSmallUrl: String?
 
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        isKanbanActivated = json["is_kanban_activated"].boolValue
        isPrivate = json["is_private"].boolValue
        totalActivityLastWeek = json["total_activity_last_week"].intValue
        totalActivityLastMonth = json["total_activity_last_month"].intValue
        totalActivityLastYear = json["total_activity_last_year"].intValue
        totalFans = json["total_fans"].intValue
        totalWatchers = json["total_watchers"].intValue
        var membersArray: [Int] = []
        let membersJson = json["members"].arrayValue
        for member in membersJson {
            membersArray.append(member.intValue)
        }
        members = membersArray
        logoSmallUrl = json["logo_small_url"].string
    }
}
