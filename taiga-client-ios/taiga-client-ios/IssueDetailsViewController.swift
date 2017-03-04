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
        IssueManager.instance.getDetailsOfIssue(issueId: issueId) { issueDetail in
            self.lblName.text = issueDetail.subject
            self.textDescription.text = issueDetail.description
            //self.constraintTextDescriptionHeight.constant = self.textDescription.intrinsicContentSize.height
            self.lblStatus.text = issueDetail.status_extra_info.name
            self.lblStatus.textColor = UIColor(hexString: issueDetail.status_extra_info.color)
            self.lblAssignedTo.text = issueDetail.assigned_to_extra_info?.full_name_display
            self.lblCreatedDate.text = TimeHelper.getReadableDateString(taigaDate: issueDetail.created_date)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
