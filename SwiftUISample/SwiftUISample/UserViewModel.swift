//
//  UserViewModel.swift
//  SwiftUISample
//
//  Created by Arpit on 01/07/24.
//

import Foundation
import Combine
import SwiftUI

struct User {
    
}

struct UserError {
    
}

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var hasError = false
    @Published var error: UserError?
    
    
    func fectUsers() {
        let userURLString = ""
        
        if let url = URL(string: userURLString) {
            
            URLSession.shared
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap({
                    response in
                    
                    
                })
                .sink(receiveCompletion: { response in
                    
                }, receiveValue: {
                    
                })
                
        }
    }
}
