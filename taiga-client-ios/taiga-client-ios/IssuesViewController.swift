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
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = self.tableView.indexPathForSelectedRow
        
        if segue.identifier == "segueIssueDetail" {
            if let issueDetailsVC = segue.destination as? IssueDetailsViewController, let idx = index {
                issueDetailsVC.issueId = issues[idx.row].id
            }
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "issue_cell", for: indexPath) as! IssueOverviewCell
        
        cell.lblIssueName.text = "#\(issues[indexPath.row].ref) \(issues[indexPath.row].subject)"
        
        if let assignedTo = issues[indexPath.row].assigned_to_extra_info {
            cell.lblAssignedTo.text = assignedTo.full_name_display
        } else {
            cell.lblAssignedTo.text = "not assigned"
        }
        
        cell.lblStatus.text = issues[indexPath.row].status_extra_info.name
        cell.lblStatus.textColor = UIColor(hexString: issues[indexPath.row].status_extra_info.color)
        
        return cell
    }
}
