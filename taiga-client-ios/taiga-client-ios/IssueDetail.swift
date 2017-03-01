//
//  IssueDetail.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 28/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class IssueDetail {
    let id: Int
    let ref: Int
    let subject: String
    let assigned_to_extra_info: AssignedToExtraInfo?
    let status_extra_info: StatusExtraInfo
    
    init(json: JSON) {
        id = json["id"].intValue
        subject = json["subject"].stringValue
        
        if json["assigned_to_extra_info"] == JSON.null {
            assigned_to_extra_info = nil
        } else {
            assigned_to_extra_info = AssignedToExtraInfo(json: json["assigned_to_extra_info"])
        }

        ref = json["ref"].intValue
        status_extra_info = StatusExtraInfo(json: json["status_extra_info"])
    }
    
    public class StatusExtraInfo {
        let color: String
        let is_closed: Bool
        let name: String
        
        init(json: JSON) {
            color = json["color"].stringValue
            is_closed = json["is_closed"].boolValue
            name = json["name"].stringValue
        }
    }
    
    public class AssignedToExtraInfo {
        let full_name_display: String
        
        init(json: JSON) {
            full_name_display = json["full_name_display"].stringValue
        }
    }
}
