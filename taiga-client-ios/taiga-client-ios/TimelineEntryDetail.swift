//
//  TimelineEntryDetail.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 28/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class TimelineEntryDetail {
    let id: Int
    let created: String
    let user: String
    
    init(json: JSON) {
        id = json["id"].intValue
        created = json["created"].stringValue
        user = json["data"]["user"]["name"].stringValue
    }
}
