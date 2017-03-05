//
//  SocialShareExtension.swift
//  taiga-client-ios
//
//  Created by Michael Rockenschaub on 05/03/2017.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

extension UIViewController {
    func share(message: String) {
        let activityViewController = UIActivityViewController(activityItems: [message as String], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: {})
    }
}
