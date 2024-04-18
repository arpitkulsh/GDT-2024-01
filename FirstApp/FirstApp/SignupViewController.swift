//
//  SignupViewController.swift
//  FirstApp
//
//  Created by Arpit on 17/04/24.
//

import UIKit

class SignupViewController: UIViewController {

    var dummyArray: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true)
        //self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
