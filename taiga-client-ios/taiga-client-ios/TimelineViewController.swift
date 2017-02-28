//
//  TimelineViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 28/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var timelineEntries: [TimelineEntryDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TimelineManager.instance.getProjectTimeline(projectId: TaigaSettings.SELECTED_PROJECT_ID) { (timelineDetails) in
            self.timelineEntries = timelineDetails
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TimelineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelineEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeline_cell", for: indexPath)
        
        cell.textLabel?.text = "#\(timelineEntries[indexPath.row].id) \(timelineEntries[indexPath.row].user)"
        
        return cell
    }
}
