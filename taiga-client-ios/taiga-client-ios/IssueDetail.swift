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
    
    init(json: JSON) {
        id = json["id"].intValue
        subject = json["subject"].stringValue
        ref = json["ref"].intValue
    }
}
