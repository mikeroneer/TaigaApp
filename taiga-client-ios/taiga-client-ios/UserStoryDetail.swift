//
//  UserStoryDetail.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 27/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class UserStoryDetail {
    let createdDate: String
    let description: String
    let id: Int
    let ref: Int
    let subject: String
    let assignedTo: Int
    let status: Int
    let comment: String
    let totalPoints: Double
    let statusExtraInfo: StatusExtraInfo
    let assignedToExtraInfo: AssignedToExtraInfo
    
    init(json: JSON) {
        createdDate = json["created_date"].stringValue
        description = json["description"].stringValue
        id = json["id"].intValue
        subject = json["subject"].stringValue
        ref = json["ref"].intValue
        assignedTo = json["assigned_to"].intValue
        status = json["status"].intValue
        comment = json["comment"].stringValue
        totalPoints = json["total_points"].doubleValue
        statusExtraInfo = StatusExtraInfo(json: json["status_extra_info"])
        assignedToExtraInfo = AssignedToExtraInfo(json: json["assigned_to_extra_info"])
    }
}
