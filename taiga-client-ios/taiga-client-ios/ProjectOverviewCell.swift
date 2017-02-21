//
//  ProjectOverviewCell.swift
//  taiga-client-ios
//
//  Created by Dominik on 21.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class ProjectOverviewCell: UITableViewCell {
    @IBOutlet weak var lblProjectName: UILabel!
    
    @IBOutlet weak var lblProjectDescription: UILabel!
    @IBOutlet weak var lblProjectLikes: UILabel!
    
    @IBOutlet weak var lblProjectWatchers: UILabel!
    
    @IBOutlet weak var lblActivityLastWeek: UILabel!
}
