//
//  ProjectOverviewViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class ProjectOverviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ProjectManager.instance.getProjectsForUser(userid: TaigaSettings.getAuthenticatedUser()) { (projectListEntries) in
            for entry in projectListEntries {
                print(entry.name)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
