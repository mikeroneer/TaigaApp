//
//  ProjectOverviewViewControllerTests.swift
//  taiga-client-ios
//
//  Created by Dominik on 04.03.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import XCTest
import SwiftKeychainWrapper
import SwiftyJSON

@testable import taiga_client_ios

class ProjectOverviewViewControllerTests: XCTestCase {
    
    var viewController: ProjectOverviewViewController!
    var storyboard: UIStoryboard!
    
    override func setUp() {
        super.setUp()
        
        KeychainWrapper.standard.set("User", forKey: AuthenticationManager.KEY_KEYCHAIN_USERNAME_TOKEN)
        KeychainWrapper.standard.set("pass", forKey: AuthenticationManager.KEY_KEYCHAIN_PASSWORD_TOKEN)
        KeychainWrapper.standard.set("af9203=(", forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)
        
        storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ProjectOverviewViewController") as! ProjectOverviewViewController
        
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        // Using the preloadView() extension method
        viewController.preloadView()
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
        storyboard = nil
    }
    
    func testOnLogoutClicked() {
        viewController.onLogoutClicked(Any.self)
        XCTAssertEqual(KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_USERNAME_TOKEN), nil)
        XCTAssertEqual(KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN), nil)
        XCTAssertEqual(KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_PASSWORD_TOKEN), nil)
    }
    
    func testThatTableviewHasDatasource() {
        XCTAssertNotNil(viewController.tableView.dataSource)
    }
    
    func testThatTableviewHasDelegate() {
        XCTAssertNotNil(viewController.tableView.delegate)
    }
    
    func testTableviewNumberOfSections() {
        XCTAssertEqual(viewController.tableView.numberOfSections, 1)
    }
    
    func testTableviewNumberOfRowsInFirstSection() {
        XCTAssertEqual(viewController.tableView.numberOfRows(inSection: 0), viewController.projects.count)
    }
}
