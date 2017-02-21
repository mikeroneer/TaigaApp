//
//  TaigaSettings.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Foundation

class TaigaSettings {
    static let KEY_BASE_URL = "baseUrlKey"
    static let KEY_AUTHENTICATED_USER = "authenticatedUser"
    
    static let DEFAULT_BASE_URL = "https://api.taiga.io/api/v1"
    
    class func getBaseUrl() -> String {
        if let baseUrl = UserDefaults.standard.string(forKey: KEY_BASE_URL) {
            return baseUrl
        }
        
        return DEFAULT_BASE_URL
    }
    
    class func setBaseUrl(value: String) {
        UserDefaults.standard.set(value, forKey: KEY_BASE_URL)
    }
    
    class func getAuthenticatedUser() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_AUTHENTICATED_USER)
    }
    
    class func setAuthenticatedUser(value: Int) {
        UserDefaults.standard.set(value, forKey: KEY_AUTHENTICATED_USER)
    }
}
