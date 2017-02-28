//
//  IssuesViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 28/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var issues: [IssueDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        IssueManager.instance.getIssuesOfProject(projectId: TaigaSettings.SELECTED_PROJECT_ID) { (issueDetails) in
            self.issues = issueDetails
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension IssuesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "issue_cell", for: indexPath)
        
        cell.textLabel?.text = "#\(issues[indexPath.row].ref) \(issues[indexPath.row].subject)"
        
        return cell
    }
}
