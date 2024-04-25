//
//  HomeViewController.swift
//  FirstApp
//
//  Created by Arpit on 05/04/24.
//

// Data
// UserDefault => SharedPrefrence

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    
    

    @IBOutlet weak var myTableView: UITableView!
    var data: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        var path: [AnyObject] = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) as [AnyObject]
//            let folder: String = path[0] as! String
//            print(folder)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorColor = .clear
       
    
        guard let plistPath = Bundle.main.path(forResource: "Country", ofType: "plist") else {
            return
        }
        
        guard let plistData = FileManager.default.contents(atPath: plistPath) else {
            return
        }
        
        guard let countryData = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String] else {
        
            return
        }
        
        print(countryData)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UserDefaults.standard.setValue(data, forKey: "userData")
        UserDefaults.standard.setValue("user@email.com", forKey: "userEmail")
        myTableView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let d1 = UserDefaults.standard.value(forKey: "userData")
//        print(d1 ?? "")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func gobacktoBack() {
        /* just Go back 1 view controller */
        self.navigationController?.popViewController(animated: true)
        
        /* Go back to Any ViewController */
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "signupDestinationID") as? SignupViewController {
            self.navigationController?.popToViewController(destinationVC, animated: true)
        }
        
        /* Go to First Page - RootViewController */
        self.navigationController?.popToRootViewController(animated: true)
        
        
        /* Show All View Controllers in Current Stack */
        let viewcontrollers = self.navigationController?.viewControllers
        print(viewcontrollers!)
        
        /* Show root Controllers from application */
        let application = UIApplication.shared
        let views = application.delegate?.window??.windowScene?.keyWindow?.rootViewController
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        // Storayboard
//        // Programatically
//    
//        let view = UIView(frame: CGRect(x: 20.0, y: 0.0, width: self.view.frame.width, height: 200.0))
//        view.backgroundColor = UIColor.blue
//        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
//        label.text = "Footer - \(section)"
//        
//        view.addSubview(label)
//    
//        return view
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 20.0, y: 0.0, width: self.view.frame.width, height: 200.0))
//        view.backgroundColor = UIColor.red
//        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
//        label.text = "Footer - \(section)"
//        
//        view.addSubview(label)
//    
//        return view
//    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        <#code#>
//    }
    
     
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as? FormFieldViewCell
            
            switch indexPath.row {
            case 0:
                cell?.formLable.text = "First Name"
                cell?.formTextField.text = ""
                cell?.formTextField.tag = indexPath.row
            case 1:
                cell?.formLable.text = "Last Name"
                cell?.formTextField.text = ""
                cell?.formTextField.tag = indexPath.row
            case 2:
                cell?.formLable.text = "City"
                cell?.formTextField.text = ""
                cell?.formTextField.tag = indexPath.row
            case 3:
                cell?.formLable.text = "Phone"
                cell?.formTextField.text = ""
                cell?.formTextField.tag = indexPath.row
            default:
                cell?.formLable.text = "Phone"
                cell?.formTextField.text = ""
                cell?.formTextField.tag = indexPath.row
            }
            
            return cell!
        }
        else if indexPath.section == 1 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "sliderFieldCall", for: indexPath) as? SliderTableViewCell
            cell?.formLable.text = "AGE"
            cell?.formSlider.value = 10
            cell?.formSlider.minimumValue = 1
            cell?.formSlider.maximumValue = 100
            
            return cell!
        }
        else {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "submitActionCell", for: indexPath) as? SubmitCell
            return cell1!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select - \(indexPath.row) of Section \(indexPath.section)")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("DeSelect - \(indexPath.row) of Section \(indexPath.section)")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { (_, _, completionHandler) in
        
           
            self.myTableView.reloadData()
            
            completionHandler(true)
        })
        
        let updateAction = UIContextualAction(style: .normal, title: "Update", handler: { (_, _, completionHandler) in
            
            completionHandler(true)
        })
        
        deleteAction.backgroundColor = .red
        updateAction.backgroundColor = .green
        
        
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction, updateAction])
        swipeAction.performsFirstActionWithFullSwipe = false
        
        return swipeAction
    }
    
    @IBAction func submitActionOnCell(_ sender: UIButton) {
        print(sender.tag)
    }
    


}
