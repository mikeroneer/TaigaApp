//
//  PopoverCreateProjectViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 21.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit
import Toast_Swift

class PopoverCreateProjectViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var segControlTemplate: UISegmentedControl!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDescription: UITextField!
    @IBOutlet weak var segControlAccessibility: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textName.delegate = self
        self.textDescription.delegate = self
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
            createProject(project: ProjectCreate(name: textName.text!, description: textDescription.text!, isKanbanActivated: false, isEpicsActivated: false, isIssuesActivated: true, isBacklogActivated: true, isWikiActivated: true, isPrivate: isPrivate))
        }
        // KANBAN
        else if segControlTemplate.selectedSegmentIndex == 1 {
            createProject(project: ProjectCreate(name: textName.text!, description: textDescription.text!, isKanbanActivated: true, isEpicsActivated: false, isIssuesActivated: false, isBacklogActivated: false, isWikiActivated: false, isPrivate: isPrivate))
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
        ProjectManager.instance().createProject(project: project) { (projectDetails) in
            if let details = projectDetails {
                print(details)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension PopoverCreateProjectViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
