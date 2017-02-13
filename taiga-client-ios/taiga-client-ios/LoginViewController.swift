//
//  ViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textServer: UITextField!
    @IBOutlet weak var textUsername: UITextField!
    @IBOutlet weak var textPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onLoginClick(_ sender: Any) {
        if let server = textServer.text, !server.isEmpty {
           TaigaSettings.setBaseUrl(value: textServer.text!)
        } else {
            TaigaSettings.setBaseUrl(value: TaigaSettings.DEFAULT_BASE_URL)
        }
        
        guard let user = textUsername.text, let pass = textPassword.text, !user.isEmpty, !pass.isEmpty else {
            return
        }
        
        AuthenticationManager.authenticateUser(username: textUsername.text!, password: textPassword.text!) { (userAuthenticationDetail) in
            print(userAuthenticationDetail.auth_token)
        }
    }
}
