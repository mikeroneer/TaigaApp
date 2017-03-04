//
//  TimeHelper.swift
//  taiga-client-ios
//
//  Created by Dominik on 04.03.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Foundation

class TimeHelper {
    
    class func getReadableDateString(taigaDate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.AAZZZZZ"
        
        let dateObj = formatter.date(from: taigaDate)
        
        formatter.dateFormat = "dd.MM.yyyy"
        if let date = dateObj {
            return formatter.string(from: date)
        }
        return "Parse failed"
    }
}
