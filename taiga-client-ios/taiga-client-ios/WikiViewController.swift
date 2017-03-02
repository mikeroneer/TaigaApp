//
//  WikiViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {
    
    var wikiLinks: [WikiLink] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        WikiManager.instance.getWikiLinksForProject(projectId: TaigaSettings.SELECTED_PROJECT_ID) { (wikiLinks) in
            self.wikiLinks = wikiLinks
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = self.tableView.indexPathForSelectedRow
        
        if segue.identifier == "segueWikiDetail" {
            if let wikiDetailsVC = segue.destination as? WikiDetailsViewController, let idx = index {
                wikiDetailsVC.wikiTitle = wikiLinks[idx.row].title
                wikiDetailsVC.wikiPageId = wikiLinks[idx.row].id
            }
        }
    }
}

extension WikiViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wikiLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wiki_cell", for: indexPath)
        
        cell.textLabel?.text = wikiLinks[indexPath.row].title
        
        return cell
    }
}

