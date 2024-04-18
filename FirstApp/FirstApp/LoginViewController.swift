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
        self.addLableToView()
        self.addTextField()
        print(self.view.frame)
        print(self.view.bounds)
        print(self.view.center)
        // Do any additional setup after loading the view.
    }
    
    func addButtonToView() {
        let button = FAButton(type: .roundedRect)
       
        button.setTitle("Submit", for: .normal)
        button.frame = CGRect(x: 10.0, y: 100.0, width: self.view.frame.width - 100.0, height: 60.0)
        
        self.view.addSubview(button)
        
    }
    
    func addLableToView() {
        let label = UILabel()
        label.text = "Hello World"
        label.textColor = UIColor.blue
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        
        label.frame = CGRect(x: 100.0, y: 170.0, width: 200.0, height: 100.0)
        
        self.view.addSubview(label)
    }
    
    func addTextField() {
        let textFeild = UITextField()
        textFeild.placeholder = "Enter Your Name"
        textFeild.borderStyle = .roundedRect
        textFeild.keyboardType = .default
        textFeild.backgroundColor = .lightGray
        
        
        textFeild.frame = CGRect(x: 10.0, y: 250.0, width: self.view.frame.width - 20.0, height: 50.0)
        
        self.view.addSubview(textFeild)
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
