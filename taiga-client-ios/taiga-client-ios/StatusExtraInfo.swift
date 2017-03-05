//
//  StatusExtraInfo.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class StatusExtraInfo {
    let color: String
    let isClosed: Bool
    let name: String
    
    init(json: JSON) {
        color = json["color"].stringValue
        isClosed = json["is_closed"].boolValue
        name = json["name"].stringValue
    }
}
