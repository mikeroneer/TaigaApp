//
//  IssueDetailGET.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class IssueDetailGET {
    let assignedTo: Int
    let id: Int
    let ref: Int
    let subject: String
    let description: String
    let createdDate: String
    let statusExtraInfo: StatusExtraInfo
    let assignedToExtraInfo: AssignedToExtraInfo?
    
    init(json: JSON) {
        assignedTo = json["assigned_to"].intValue
        id = json["id"].intValue
        ref = json["ref"].intValue
        subject = json["subject"].stringValue
        description = json["description"].stringValue
        createdDate = json["created_date"].stringValue
        statusExtraInfo = StatusExtraInfo(json: json["status_extra_info"])
        
        if json["assigned_to_extra_info"] == JSON.null {
            assignedToExtraInfo = nil
        } else {
            assignedToExtraInfo = AssignedToExtraInfo(json: json["assigned_to_extra_info"])
        }
    }
}
