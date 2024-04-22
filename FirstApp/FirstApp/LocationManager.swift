//
//  LocationManager.swift
//  FirstApp
//
//  Created by Arpit on 23/04/24.
//

// factory pattern
// Singlton Pattern


import Foundation

class FAFileManager: NSObject {
    
    static let shared: FAFileManager = {
        let instance = FAFileManager()
        return instance
    }()
   // static let shared: FAFileManager = FAFileManager()
    
   private override init() {
        super.init()
    }
}

let file: FAFileManager = FAFileManager.shared


