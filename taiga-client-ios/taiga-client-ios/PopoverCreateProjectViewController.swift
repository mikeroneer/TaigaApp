//
//  PopoverCreateProjectViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 21.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class PopoverCreateProjectViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.fullScreen
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navController = UINavigationController(rootViewController: controller.presentedViewController)
        return navController
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
