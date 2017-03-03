//
//  WikiPage.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class WikiPage {
    let id: Int
    let content: String
    let modified_date: String
    
    init(json: JSON) {
        id = json["id"].intValue
        content = json["content"].stringValue
        modified_date = json["modified_date"].stringValue
    }
}
