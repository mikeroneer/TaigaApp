//
//  UserStoryDetail.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 27/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class UserStoryDetail {
    let id: Int
    let ref: Int
    let subject: String
    let assigned_to: String
    let status: Int
    let comment: String
    let total_points: Double
    let status_extra_info: StatusExtraInfo
    
    init(json: JSON) {
        id = json["id"].intValue
        subject = json["subject"].stringValue
        ref = json["ref"].intValue
        assigned_to = json["assigned_to"].stringValue
        status = json["status"].intValue
        comment = json["comment"].stringValue
        total_points = json["total_points"].doubleValue
        status_extra_info = StatusExtraInfo(json: json["status_extra_info"])
    }
}
