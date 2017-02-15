//
//  PaginationPlugin.swift
//  taiga-client-ios
//
//  Created by Dominik on 15.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Foundation
import Moya

public struct PaginationPlugin: PluginType {
    
    private let paginationEnabled: Bool
    
    public init(paginationEnabled: Bool) {
        self.paginationEnabled = paginationEnabled
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        if paginationEnabled {
            request.addValue("False", forHTTPHeaderField: "x-disable-pagination")
        } else {
            request.addValue("True", forHTTPHeaderField: "x-disable-pagination")
        }
        return request
    }
}
