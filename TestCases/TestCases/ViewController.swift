//
//  ViewController.swift
//  TestCases
//
//  Created by Arpit on 01/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class LoginManager {
    
    func login(username: String, password: String) -> Bool {
        let user = "testUser"
        let passowrd = "testPassword"
        if username == user && password == passowrd {
            return true
        }
        else
        {
            return false
        }
    }
}


