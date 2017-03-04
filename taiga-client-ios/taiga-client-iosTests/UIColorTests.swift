//
//  UIColorTests.swift
//  taiga-client-ios
//
//  Created by Dominik on 03.03.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import XCTest
@testable import taiga_client_ios

class UIColorTests: XCTestCase {
    
    var black: UIColor!
    var white: UIColor!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        black = UIColor(hexString: "#000000")
        white = UIColor(hexString: "#FFFFFF")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        black = nil
        white = nil
    }
    
    func testHexStringInitializer() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(black, UIColor(red:0.00, green: 0.00, blue: 0.00, alpha: 1.0))
        XCTAssertEqual(white, UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0))
    }
}
