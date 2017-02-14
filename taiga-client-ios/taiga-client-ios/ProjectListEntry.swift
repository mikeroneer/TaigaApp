//
//  ProjectListEntry.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class ProjectListEntry {
    var name: String
    
    init(json: JSON) {
        name = json["name"].stringValue
    }
}
