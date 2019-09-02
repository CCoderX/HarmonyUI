//
//  ViewController.swift
//  HarmonyUI
//
//  Created by user on 8/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
protocol login {
    
}
class LoginViewController: UIViewController {

    @IBOutlet weak var passwodTextField: UITextField!
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet var signInButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInButton.layer.cornerRadius = 10
    }

    @IBAction func signInPressed(_ sender: Any) {
    }
    
}

