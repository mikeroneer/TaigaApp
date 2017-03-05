//
//  WikiDetailsViewController.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 02/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class WikiDetailsViewController: UIViewController {
    var wikiTitle: String?
    var wikiPageSlug: String = ""
    var wikiEntry: WikiPage?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblcontent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = wikiTitle
        lblcontent.text.removeAll()
        
        WikiManager.instance().getWikiPageBySlug(slug: wikiPageSlug) { wikiPage in
            self.lblcontent.text = wikiPage.content
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
