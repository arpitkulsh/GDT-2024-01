//
//  ImagePickingController.swift
//  FirstApp
//
//  Created by Arpit on 07/05/24.
//

import UIKit
import Foundation
import Dispatch


class MyOperations: Operation {
    
    override func main() {
         print("Add somthing to execute")
    }
    
    override func start() {
        print("Operation has started")
    }
    
    override func cancel() {
        print("Operation has cancelled")
    }
    
   
}



class ImagePickingController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(listenerMethod(_:)), name: NSNotification.Name("FileDownloadDone1"), object: nil)
        
        // Do any additional setup after loading the view.
        // NSNotificationCenter
        // KVO => Key Value Observer
        // post message
        // receive message
        // key ==> Same
    }
    
    
    func learnGCD() {
        
        /*
         1. Main
         2. Global
         3. Custom
         */
        
        print("Main - ", Thread.current)
        
        
        DispatchQueue.global().async {
            print("GLobal - ", Thread.current)
            DispatchQueue.main.async {
                // UI Update
                self.imageView.image = self.image
                print("Main", Thread.current)
            }
        }
        
        // QOS = Quality Of Service
        
        DispatchQueue.global(qos: .background).async {
            print(Date.now)
            print("GLobal - ", Thread.current)
        }
        
        DispatchQueue.global(qos: .utility).async {
            print(Date.now)
            print("GLobal - ", Thread.current)
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            print(Date.now)
            print("GLobal - ", Thread.current)
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            print(Date.now)
            print("GLobal - ", Thread.current)
        }
        
        DispatchQueue.global(qos: .unspecified).async {
            print(Date.now)
            print("GLobal - ", Thread.current)
        }
        
        // By default serial
        let customQueue = DispatchQueue(label: "com.globaldata.FirstApp.Download1")
        
        // concurent
        
        let customQueue1 = DispatchQueue(label: "com.globaldata.FirstApp.Download", attributes: [.concurrent, .initiallyInactive])
        
        let customQueue2 = DispatchQueue(label: "com.globaldata.FirstApp.Download", qos: .default, target: customQueue1)
        
        // priorty and excution order
        
        // DispatchWorkItem
        
        let workItem = DispatchWorkItem {
            print("Excution has started")
        }
        
        let queue = DispatchQueue.global()
        
        queue.async(execute: workItem)
        
        customQueue.sync(execute: workItem)
        
        workItem.cancel()
        
        // How to perform UI task with workitem
        
        let workitem2 = DispatchWorkItem {
            
            DispatchQueue.main.async {
                self.imageView.image = self.image
            }
        }
        
        DispatchQueue.global().async(execute: workitem2)
        
        
        // DispatchGroup
        
        DispatchGroup().notify(queue: queue, execute: {
            
        })
        
        let group = DispatchGroup()
        
        group.enter()
        
        /*
        API.calltask { result in
            //----
            //---
            
            //--
            
            group.leave()
        }
         */
        
        group.enter()
        /*
        API.calltask { result in
            //----
            //---
            
            //--
            
            group.leave()
        }
         */
        
        group.enter()
        /*
        API.calltask { result in
            //----
            //---
            
            //--
            
            group.leave()
        }
         */
        
        
        group.notify(queue: .main) {
            
        }
        
    }
    
    // GCD vs Operations
    func learnOperations() {
        
        // GCD is Low level API
        // Operation is High Level API
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 2
        // instance of subclass on Operation class
        // BlockOperation Instnace
        
        let block = BlockOperation(block: {
            
            
        })
        
        let myOperation = MyOperations()
        
        
        operationQueue.addOperations([block, myOperation], waitUntilFinished: false)
        
        
        
        
    }
    
    func fetchData() async -> Data {
        let data = try await getDataFromNetwork()
        
        return data
    }
    
    
    func processData() async {
        
        do {
            let data = try await fetchData()
        }
        catch {
           
        }
        
    }
    
    
    // async let
    func testAsynAwait() async {
        async let process = self.processData()
        async let p2 = self.fetchData()
        
        let awaitProcess = await [process, p2] as [Any]
        
    }
    
//    func checkTask() {
//        // Swift 5.5
//        let taskGroup = TaskGroup<Int>(group: <#Builtin.RawPointer#>)
//        
//        taskGroup.addTask {
//            performTask(completion: { result in
//                print(result)
//            })
//        }(priority: .low, operation: {
//            return 1
//        })
//        
//    }
    
    func performTask(completion: @escaping(Int) -> Void) {
        DispatchQueue.global().async {
            
            completion(12)
        }
    }
    
    /*
     1 resorce
        - Atomic
        - Non atomic
     
     Actor
     mainactor
    
     
     */
    
    
    
    
    
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func messagePost(message: String) {
        let message = ["message": message]
        NotificationCenter.default.post(name: NSNotification.Name("FileDownloadDone1"), object: nil, userInfo: message)
    }
    
    @objc func listenerMethod(_ notification: Notification) {
        if let message = notification.userInfo!["message"] as? String {
            print(message)
        }
    }
    
    
    @IBAction func takePhotoFromCamera(_ sender: UIButton) 
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            // Show message to user
        }
    }
  
    @IBAction func takePhotoFromGallery(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // phpicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage
        {
            self.image = pickedImage
            learnGCD()
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.messagePost(message: "Picture Taken Cancelled")
        imagePicker.dismiss(animated: true, completion: nil)
    }

}
