//
//  ProjectOverviewViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class ProjectOverviewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var projects: [ProjectListEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ProjectManager.instance.getProjectsForUser(userid: TaigaSettings.getAuthenticatedUser()) { (projectListEntries) in
            self.projects = projectListEntries
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ProjectOverviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "project_cell", for: indexPath) as! ProjectOverviewCell
        
        cell.lblProjectName.text = projects[indexPath.row].name
        cell.lblProjectDescription.text = projects[indexPath.row].description
        cell.lblProjectLikes.text = String(projects[indexPath.row].total_fans)
        cell.lblProjectWatchers.text = String(projects[indexPath.row].total_watchers)

        return cell
    }
    
}
