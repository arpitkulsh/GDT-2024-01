//
//  LoginViewController.swift
//  FirstApp
//
//  Created by Arpit on 05/04/24.
//

import UIKit

class LoginViewController: UIViewController {

    var data: String? 
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addButtonToView()
        print(self.view.frame)
        print(self.view.bounds)
        print(self.view.center)
        // Do any additional setup after loading the view.
    }
    
    func addButtonToView() {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 100.0
        button.clipsToBounds =  true
        button.setTitle("Submit", for: .normal)
        button.frame = CGRect(x: 100.0, y: 100.0, width: 200.0, height: 200.0)
        
        self.view.addSubview(button)
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextSegueAction" {
         let signupVC = segue.destination as? SignupViewController
            signupVC?.dummyArray = ["Apple", "Orange"]
        }
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "signupDestinationID") as? SignupViewController
        destinationVC?.dummyArray = ["Apple", "Orange"]
        self.navigationController?.pushViewController(destinationVC!, animated: true)
    }
    
    @IBAction func nextPresentModally(_ sender: UIButton) {
        // use case
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "signupDestinationID") as? SignupViewController
        
        self.present(destinationVC!, animated: true)
    }
    
   
    


}
