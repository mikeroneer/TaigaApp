//
//  IssueDetailGET.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class IssueDetailGET {
    let id: Int
    let ref: Int
    let subject: String
    let description: String
    let created_date: String
    let status_extra_info: StatusExtraInfo
    let assigned_to_extra_info: AssignedToExtraInfo?
    
    init(json: JSON) {
        id = json["id"].intValue
        ref = json["ref"].intValue
        subject = json["subject"].stringValue
        description = json["description"].stringValue
        created_date = json["created-date"].stringValue
        status_extra_info = StatusExtraInfo(json: json["status_extra_info"])
        
        if json["assigned_to_extra_info"] == JSON.null {
            assigned_to_extra_info = nil
        } else {
            assigned_to_extra_info = AssignedToExtraInfo(json: json["assigned_to_extra_info"])
        }
    }
}
