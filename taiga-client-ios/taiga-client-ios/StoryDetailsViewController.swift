//
//  StoryDetailsViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class StoryDetailsViewController: UIViewController {
    var userstoryId: Int = -1
    var userstory: UserStoryDetailGET?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var lblCreated: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblAssignedTo: UILabel!
    @IBOutlet weak var lblTotalPoints: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.subviews.forEach { $0.isHidden = true }
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
        
        UserstoryManager.instance().getUserstoryById(userstoryId: userstoryId) { details in
            self.userstory = details
            self.lblName.text = "#\(details.ref) \(details.subject)"
            
            if details.description.isEmpty {
                self.textDescription.text = "No description"
            } else {
                self.textDescription.text = details.description
            }
            
            self.lblCreated.text = TimeHelper.getReadableDateString(taigaDate: details.createdDate)
            self.lblStatus.text = details.statusExtraInfo.name
            self.lblStatus.textColor = UIColor(hexString: details.statusExtraInfo.color)
            
            if details.assignedTo == 0 {
                self.lblAssignedTo.text = "Not assigned"
            } else {
                self.lblAssignedTo.text = details.assignedToExtraInfo.fullNameDisplay
            }
            
            self.lblTotalPoints.text = "\(details.totalPoints) total points"
            
            activityView.removeFromSuperview()
            activityView.stopAnimating()
            self.view.subviews.forEach { $0.isHidden = false }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onShareClicked(_ sender: Any) {
        if userstory != nil {
            let message = "I'm currently working on \"#\(userstory!.ref) \(userstory!.subject)\""
            share(message: message)
        }
    }
}
