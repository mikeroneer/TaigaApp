//
//  BacklogViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 27/02/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class BacklogViewController: UIViewController {

    @IBOutlet weak var userStoriesTableView: UITableView!
    
    var userStories: [UserStoryDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userStoriesTableView.dataSource = self
        userStoriesTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserstoryManager.instance.getUserstoresOfProject(projectId: TaigaSettings.SELECTED_PROJECT_ID) { (userStoryDetails) in
            self.userStories = userStoryDetails
            self.userStoriesTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension BacklogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userStories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userstory_cell", for: indexPath)
        
        cell.textLabel?.text = "#\(userStories[indexPath.row].ref) \(userStories[indexPath.row].subject)"
        
        return cell
    }
}
