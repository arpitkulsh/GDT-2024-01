//
//  LoginViewController.swift
//  FirstApp
//
//  Created by Arpit on 05/04/24.
//

import UIKit

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data: String? 
    var initailCenter = CGPoint()
    var viewForReset = UIView()
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tapGesture: UITapGestureRecognizer!
    let tableView: UITableView! = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*     File Related Task */
        let file: FAFileManager = FAFileManager.shared
        print(file.getDocumentDirectory()!)
        
        /* Create file in DD
        if file.writeFileIn(containingString: "Hello World", to: file.getDocumentDirectory()!, with: "MyFile.txt") {
            print("file created")
        }
        else {
            print("file NOT created")
        }
         */
        
        /* Create file with folder
        let str: String = "Hello World !! Happy Faces Around"
        if let data = str.data(using: .utf8) {
            if file.writeFileIn(folder: "Main Content", containingData: data, to: file.getDocumentDirectory()!, with: "Cache.txt") {
                print("Files and folder created")
            }
            else {
                print("Files and folder NOT created")
            }
        }
         */
        
         /* Read file code */
        if let strData = file.readFile(at: file.getDocumentDirectory()!, withName: "MyFile.txt") {
            print(strData)
        }
        
        
        var path = file.getDocumentDirectory()!
        //path = path.appendingPathComponent("Main Content")
        
        let paths = file.getAllFiles(at: path, foldername: "Main Content")
        print(paths)
        
        /* Move File Code
        let moveFile = file.moveFile(withFile: "MyFile.txt", inDirectory: file.getDocumentDirectory()!, toDirectory: path)
        print(moveFile)
         */
        
        /* Copy File code
        let copyFile = file.copyFile(withFile: "Cache.txt", inDirectory: path, toDirectory: file.getDocumentDirectory()!)
        print(copyFile)
        */
        
        /* Renaming of file
        let rename = file.renameFile(at: file.getDocumentDirectory()!, oldfile: "MyFile.txt", newfile: "MYNEWFILE.txt")
        print(rename)
       */
        
         
        /* Delete file code
        var path = file.getDocumentDirectory()!
        path = path.appendingPathComponent("Main Content")
        path = path.appendingPathComponent("Open")
        path = path.appendingPathComponent("Width")
        let deleteData = file.deleteFile(at: path, with: "Cache.txt")
        print(deleteData)
        
        let delete = file.deleteFile(at: file.getDocumentDirectory()!, withfolder: "Main Content", withfile: "CacheFile.txt")
         
         */
        
        /* chnageExtesnion
        
        let change = file.changeExtension(withName: "Cache.txt", at: file.getDocumentDirectory()!, toExtension: "pdf")
        print(change)
        */
        
        
        
        
        
        
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "customCell")
//        tableView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        
        //self.view.addSubview(tableView)
        //self.addButtonToView()
        //self.addLableToView()
       // self.addTextField()
        //addViewWithConstraints()
//        print(self.view.frame)
//        print(self.view.bounds)
//        print(self.view.center)
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
    
    func addViewWithConstraints() {
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        self.view.addSubview(redView)
        
        let blueView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor.blue
        self.view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0),
            redView.widthAnchor.constraint(equalToConstant: 120.0),
            redView.heightAnchor.constraint(equalToConstant: 150.0)
            
        ])
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 30.0),
            blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0),
            blueView.widthAnchor.constraint(equalToConstant: 120.0),
            blueView.heightAnchor.constraint(equalToConstant: 150.0)
        ])
    }
    
    @IBAction func tapHandle(_ gestureReconizer: UITapGestureRecognizer) {
    
        
        if gestureReconizer.state == .ended {
            let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
                gestureReconizer.view?.center.x += 0
                gestureReconizer.view?.center.y += 20
            })
            animator.startAnimation()
        }
    }
    
    
    @IBAction func pinchGestureHandle(_ gestureReconizer: UIPinchGestureRecognizer) {
        
        if gestureReconizer.state == .began || gestureReconizer.state == .changed {
            
            gestureReconizer.view?.transform = (gestureReconizer.view?.transform.scaledBy(x: gestureReconizer.scale, y: gestureReconizer.scale))!
            gestureReconizer.scale = 1.0
        }
    }
    
    @IBAction func swipeGestureHandler(_ gestureReconizer: UISwipeGestureRecognizer) {
        if gestureReconizer.state == .ended {
            print(gestureReconizer.direction)
        }
    }
    
    @IBAction func panGestureHandler(_ gestureReconizer: UIPanGestureRecognizer) {
        guard gestureReconizer.view != nil else {return}
        let piece = gestureReconizer.view!
        let translation = gestureReconizer.translation(in: piece.superview)
        
        if gestureReconizer.state == .began {
            initailCenter = piece.center
        }
        
        if gestureReconizer.state == .ended {
            let newCenter = CGPoint(x: initailCenter.x + translation.x, y: initailCenter.y + translation.y)
            
            piece.center = newCenter
        }
        else {
            piece.center = initailCenter
        }
        
    }
    
    @IBAction func longPressGesture(_ gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state == .began {
            self.becomeFirstResponder()
            self.viewForReset = gestureReconizer.view!
            
            let menuItemTitle = "Reset"
            let menuItem = UIMenuItem(title: menuItemTitle, action: #selector(self.setForMenuSelection))
            
            let menuItemTitle1 = "Open"
            let menuItem1 = UIMenuItem(title: menuItemTitle1, action: #selector(self.setForMenuSelection))
            
            let menuController = UIMenuController.shared
            menuController.menuItems = [menuItem, menuItem1]
            
            let location = gestureReconizer.location(in: gestureReconizer.view!)
            let menuLocation = CGRect(x: location.x, y: location.y, width: 0, height: 0)
            
            menuController.setTargetRect(menuLocation, in: gestureReconizer.view!)
            
            menuController.setMenuVisible(true, animated: true)
        }
    }
    
    @objc func setForMenuSelection() {
        
    }
    
    @IBAction func handleRotate(_ gestureReconizer: UIRotationGestureRecognizer) {
        guard gestureReconizer.view != nil else {return}
        
        if gestureReconizer.state == .began || gestureReconizer.state == .changed {
            gestureReconizer.view?.transform = (gestureReconizer.view?.transform.rotated(by: gestureReconizer.rotation))!
            gestureReconizer.rotation = 0
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextSegueAction" {
         let signupVC = segue.destination as? SignupViewController
            //signupVC?.dummyArray = ["Apple", "Orange"]
        }
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "signupDestinationID") as? SignupViewController
       // destinationVC?.dummyArray = ["Apple", "Orange"]
        self.navigationController?.pushViewController(destinationVC!, animated: true)
    }
    
    @IBAction func nextPresentModally(_ sender: UIButton) {
        // use case
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "signupDestinationID") as? SignupViewController
        
        self.present(destinationVC!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell
        cell?.label.text = "\(indexPath.row) With Section \(indexPath.section)"
        
        return cell!
        
    }
    
   
    


}
