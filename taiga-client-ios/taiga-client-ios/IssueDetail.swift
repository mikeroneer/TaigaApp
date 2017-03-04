//
//  IssueDetail.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 28/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class IssueDetail {
    let assignedTo: Int
    let id: Int
    let ref: Int
    let subject: String
    let assignedToExtraInfo: AssignedToExtraInfo?
    let statusExtraInfo: StatusExtraInfo
    
    init(json: JSON) {
        assignedTo = json["assigned_to"].intValue
        id = json["id"].intValue
        subject = json["subject"].stringValue
        
        if json["assigned_to_extra_info"] == JSON.null {
            assignedToExtraInfo = nil
        } else {
            assignedToExtraInfo = AssignedToExtraInfo(json: json["assigned_to_extra_info"])
        }

        ref = json["ref"].intValue
        statusExtraInfo = StatusExtraInfo(json: json["status_extra_info"])
    }
}
