//
//  SignupViewController.swift
//  FirstApp
//
//  Created by Arpit on 17/04/24.
//

import UIKit
import Alamofire
import MapKit

class SignupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {
    
    
    @IBOutlet weak var universityTable: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    var universityData: [University] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        universityTable.delegate = self
        universityTable.dataSource = self
        mapView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.global().async {
            self.fetchData1()
        }
        
    
        let location = FALocationManager.sharedInstance
        location.setupLocation()
        location.startTracking()
        
    
    }
    
    @IBAction func dropPin(sender: UIButton) {
        let location = FALocationManager.sharedInstance
        let cordinate = location.userLocation?.coordinate
        self.setupPin(location: cordinate!)
    }
    
    
    func fetchData1() {
        let urlStr = "http://universities.hipolabs.com/search?country=Canada"
        
        let result = AF.request(urlStr).response { response in
            if response.error == nil {
                self.jsonDecode(data: response.data!)
            }
          
        }
    }
    
    func fetchData() {
        let networkManager = NetworkManager.shared
        let urlStr = "http://universities.hipolabs.com/search?country=Canada"
        
        networkManager.request(urlString: urlStr, method: .GET, body: nil, completion: { result in
            
            switch result
            {
            case .success(let data):
                print("Success")
                self.jsonDecode(data: data)
            case .failure(let error):
                print(error)
            }
            
        })
        
        
    }
    
    
    func jsonDecode(data: Data) {
        
        let jsonDecoder = JSONDecoder()

        do {
             let university = try jsonDecoder.decode([University].self, from: data)
            if university.count > 0 {
                self.universityData = university
                DispatchQueue.main.async {
                    self.universityTable.reloadData()
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universityCell", for: indexPath) as! UniversityTableViewCell
        let object = universityData[indexPath.row] as University
        cell.universityname.text = object.name
        cell.country.text = object.state
        
        return cell
    }
    
    func setupPin(location: CLLocationCoordinate2D) {
        // MKPlacemark
        
        let pin = MKPlacemark(coordinate: location)
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(pin)
    }
    

}
