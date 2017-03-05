//
//  WikiLink.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import SwiftyJSON

class WikiLink {
    let id: Int
    let title: String
    let slug: String

    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        slug = json["href"].stringValue
    }
}

