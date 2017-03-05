//
//  ViewController.swift
//  taiga-client-ios
//
//  Created by Dominik on 13.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Toast_Swift

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textServer: UITextField!
    @IBOutlet weak var textUsername: UITextField!
    @IBOutlet weak var textPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        
        self.textServer.delegate = self
        self.textUsername.delegate = self
        self.textPassword.delegate = self
        
        // Auto login
        if let username = KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_USERNAME_TOKEN), let password = KeychainWrapper.standard.string(forKey: AuthenticationManager.KEY_KEYCHAIN_PASSWORD_TOKEN) {
            self.enableInput(shouldEnable: false)
            
            let activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            activityView.center = self.view.center
            activityView.startAnimating()
            
            self.view.addSubview(activityView)
            
            AuthenticationManager.authenticateUser(username: username, password: password) { (userAuthenticationDetail) in
                if let authDetails = userAuthenticationDetail {
                    let saveTokenSuccess = KeychainWrapper.standard.set(authDetails.authToken, forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)
                    
                    if saveTokenSuccess {
                        TaigaSettings.setAuthenticatedUser(value: authDetails.id)
                        self.performSegue(withIdentifier: "loginSuccessfulSegue", sender: nil)
                    }
                } else {
                    self.view.makeToast("Auto login failed")
                }
                
                self.enableInput(shouldEnable: true)
                activityView.hidesWhenStopped = true
                activityView.stopAnimating()
            }
        }
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
        
        self.enableInput(shouldEnable: false)
        
        AuthenticationManager.authenticateUser(username: textUsername.text!, password: textPassword.text!) { (userAuthenticationDetail) in
            if let authDetails = userAuthenticationDetail {
                let saveTokenSuccess = KeychainWrapper.standard.set(authDetails.authToken, forKey: AuthenticationManager.KEY_KEYCHAIN_AUTH_TOKEN)
                let saveUsernameSuccess = KeychainWrapper.standard.set(self.textUsername.text!, forKey: AuthenticationManager.KEY_KEYCHAIN_USERNAME_TOKEN)
                let savePasswordSuccess = KeychainWrapper.standard.set(self.textPassword.text!, forKey: AuthenticationManager.KEY_KEYCHAIN_PASSWORD_TOKEN)
                
                if saveTokenSuccess && saveUsernameSuccess && savePasswordSuccess {
                    TaigaSettings.setAuthenticatedUser(value: authDetails.id)
                    self.textPassword.text = ""
                    self.performSegue(withIdentifier: "loginSuccessfulSegue", sender: sender)
                }
            } else {
                self.view.makeToast("Login failed")
            }
            
            self.enableInput(shouldEnable: true)
        }
    }
    
    @IBAction func undwindToLogin(segue: UIStoryboardSegue) {
        AuthenticationManager.invalidateUser()
    }
    
    func enableInput(shouldEnable: Bool) {
        self.textServer.isEnabled = shouldEnable
        self.textUsername.isEnabled = shouldEnable
        self.textPassword.isEnabled = shouldEnable
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension LoginViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
