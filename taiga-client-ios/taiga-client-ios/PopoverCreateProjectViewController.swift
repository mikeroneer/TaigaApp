//
//  PopoverCreateProjectViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 21.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit
import Toast_Swift

class PopoverCreateProjectViewController: UIViewController {
    
    @IBOutlet weak var segControlTemplate: UISegmentedControl!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDescription: UITextField!
    @IBOutlet weak var segControlAccessibility: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createClick(_ sender: Any) {
        if !isInputValid() {
            self.view.makeToast("Name and description necessary!")
            return
        }
        
        var isPrivate: Bool
        
        // PUBLIC
        if segControlAccessibility.selectedSegmentIndex == 0 {
            isPrivate = false
        } else {
            isPrivate = true
        }
        
        // SCRUM
        if segControlTemplate.selectedSegmentIndex == 0 {
            createProject(project: ProjectCreate(name: textName.text!, description: textDescription.text!, is_kanban_activated: false, is_epics_activated: false, is_issues_activated: true, is_backlog_activated: true, is_wiki_activated: true, is_private: isPrivate))
        }
        // KANBAN
        else if segControlTemplate.selectedSegmentIndex == 1 {
            createProject(project: ProjectCreate(name: textName.text!, description: textDescription.text!, is_kanban_activated: true, is_epics_activated: false, is_issues_activated: false, is_backlog_activated: false, is_wiki_activated: false, is_private: isPrivate))
        }
    }

    @IBAction func cancelClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func isInputValid() -> Bool {
        if let name = textName.text, let description = textDescription.text {
            if !name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
                && !description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
                return true
            }
        }
        
        return false
    }
    
    func createProject(project: ProjectCreate) {
        ProjectManager.instance.createProject(project: project) { (projectDetails) in
            if let details = projectDetails {
                print(details)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}