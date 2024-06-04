//
//  FALocationManager.swift
//  FirstApp
//
//  Created by Arpit on 03/06/24.
//

import Foundation
import CoreLocation

class FALocationManager: NSObject, CLLocationManagerDelegate 
{
    // MARK:- Variable
    var locationManager: CLLocationManager!
    var userLocation: CLLocation?
    
    static let sharedInstance: FALocationManager = {
        let instance = FALocationManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    // Important
    
    func setupLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.activityType = CLActivityType.otherNavigation
    }
}
