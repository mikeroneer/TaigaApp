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
    var issue: IssueDetailGET? = nil
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblAssignedTo: UILabel!
    @IBOutlet weak var lblCreatedDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.subviews.forEach { $0.isHidden = true }
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
        
        IssueManager.instance().getDetailsOfIssue(issueId: issueId) { issueDetail in
            self.issue = issueDetail
            self.lblName.text = "#\(issueDetail.ref) \(issueDetail.subject)"
            
            if issueDetail.description.isEmpty {
                self.textDescription.text = "No description"
            } else {
                self.textDescription.text = issueDetail.description
            }
            
            self.lblStatus.text = issueDetail.statusExtraInfo.name
            self.lblStatus.textColor = UIColor(hexString: issueDetail.statusExtraInfo.color)
            if issueDetail.assignedTo == 0 {
                self.lblAssignedTo.text = "Not assigned"
            } else {
                self.lblAssignedTo.text = issueDetail.assignedToExtraInfo?.fullNameDisplay
            }
            self.lblCreatedDate.text = TimeHelper.getReadableDateString(taigaDate: issueDetail.createdDate)
            
            activityView.removeFromSuperview()
            activityView.stopAnimating()
            self.view.subviews.forEach { $0.isHidden = false }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onShareClicked(_ sender: Any) {
        if issue != nil {
            let message = "I'm currently working on \"#\(issue!.ref) \(issue!.subject)\""
            share(message: message)
        }
    }
}
