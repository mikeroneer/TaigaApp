//
//  StoryDetailsViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class StoryDetailsViewController: UIViewController {
    var userstory: UserStoryDetail?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var lblCreated: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblAssignedTo: UILabel!
    @IBOutlet weak var lblTotalPoints: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearFields()
        
        if let details = userstory {
            lblName.text = "#\(details.ref) \(details.subject)"
            
            if details.description.isEmpty {
                textDescription.text = "No description"
            } else {
                textDescription.text = details.description
            }
            
            lblCreated.text = TimeHelper.getReadableDateString(taigaDate: details.createdDate)
            lblStatus.text = details.statusExtraInfo.name
            lblStatus.textColor = UIColor(hexString: details.statusExtraInfo.color)
            
            if details.assignedTo == 0 {
                lblAssignedTo.text = "Not assigned"
            } else {
                lblAssignedTo.text = details.assignedToExtraInfo.full_name_display
            }
            
            lblTotalPoints.text = "\(details.totalPoints) total points"
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
    
    func clearFields() {
        self.lblName.text?.removeAll()
        self.textDescription.text.removeAll()
        self.lblStatus.text?.removeAll()
        self.lblAssignedTo.text?.removeAll()
        self.lblCreated.text?.removeAll()
        self.lblTotalPoints.text?.removeAll()
    }
}
