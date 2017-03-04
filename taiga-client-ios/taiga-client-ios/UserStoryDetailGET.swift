//
//  UserStoryDetailGET.swift
//  taiga-client-ios
//
//  Created by Dominik on 04.03.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class UserStoryDetailGET {
    let id: Int
    let ref: Int
    let subject: String
    let assignedTo: String
    let status: Int
    let comment: String
    let totalPoints: Double
    let statusExtraInfo: StatusExtraInfo
    let assignedToExtraInfo: AssignedToExtraInfo
    
    init(json: JSON) {
        id = json["id"].intValue
        subject = json["subject"].stringValue
        ref = json["ref"].intValue
        assignedTo = json["assigned_to"].stringValue
        status = json["status"].intValue
        comment = json["comment"].stringValue
        totalPoints = json["total_points"].doubleValue
        statusExtraInfo = StatusExtraInfo(json: json["status_extra_info"])
        assignedToExtraInfo = AssignedToExtraInfo(json: json["assigned_to_extra_info"])
    }
}
