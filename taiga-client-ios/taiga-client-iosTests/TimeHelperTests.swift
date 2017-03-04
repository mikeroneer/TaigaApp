//
//  TimeHelperTests.swift
//  taiga-client-ios
//
//  Created by Dominik on 04.03.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import XCTest
@testable import taiga_client_ios

class TimeHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetReadableDateString() {
        XCTAssertEqual(TimeHelper.getReadableDateString(taigaDate: "2016-10-14T09:03:28.588Z"), "14.10.2016")
        XCTAssertEqual(TimeHelper.getReadableDateString(taigaDate: "2099-10-24T09:03:28.588Z"), "24.10.2099")
        XCTAssertEqual(TimeHelper.getReadableDateString(taigaDate: "2016.k10.1a4T09:03:28.588Z"), "Parse failed")
    }
}
