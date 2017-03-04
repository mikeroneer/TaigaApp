//
//  IssueDetailsViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class IssueDetailsViewController: UIViewController {
    var issueId: Int = -1
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblAssignedTo: UILabel!
    @IBOutlet weak var lblCreatedDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearFields()
        
        IssueManager.instance.getDetailsOfIssue(issueId: issueId) { issueDetail in
            self.lblName.text = "#\(issueDetail.ref) \(issueDetail.subject)"
            
            if issueDetail.description.isEmpty {
                self.textDescription.text = "No description"
            } else {
                self.textDescription.text = issueDetail.description
            }
            
            self.lblStatus.text = issueDetail.status_extra_info.name
            self.lblStatus.textColor = UIColor(hexString: issueDetail.status_extra_info.color)
            if issueDetail.assignedTo == 0 {
                self.lblAssignedTo.text = "Not assigned"
            } else {
                self.lblAssignedTo.text = issueDetail.assigned_to_extra_info?.full_name_display
            }
            self.lblCreatedDate.text = TimeHelper.getReadableDateString(taigaDate: issueDetail.created_date)
            
            self.updateViewConstraints()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func clearFields() {
        self.lblName.text?.removeAll()
        self.textDescription.text.removeAll()
        self.lblStatus.text?.removeAll()
        self.lblAssignedTo.text?.removeAll()
        self.lblCreatedDate.text?.removeAll()
    }
}
