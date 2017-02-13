//
//  ViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TaigaSettings.setBaseUrl(value: "https://api.taiga.io/api/v1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginClick(_ sender: Any) {
        AuthenticationManager.authenticateUser(username: "test", password: "ing") { (auth_token) in
            print("fin")
        }
    }
}
