//
//  ProjectOverviewViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 14.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class ProjectOverviewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var projects: [ProjectListEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ProjectManager.instance.getProjectsForUser(userid: TaigaSettings.getAuthenticatedUser()) { (projectListEntries) in
            self.projects = projectListEntries
            self.tableView.reloadData()
            for pro in self.projects {
                print(pro.logo_small_url ?? "null")
                print(pro.members)
            }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "project_cell", for: indexPath)
        
        cell.textLabel?.text = projects[indexPath.row].name

        return cell
    }
}
