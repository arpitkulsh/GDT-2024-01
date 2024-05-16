//
//  APIUniversity.swift
//  FirstApp
//
//  Created by Arpit on 16/05/24.
//

import Foundation


struct University: Codable 
{
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case webPages = "web_pages"
        case twoCode = "alpha_two_code"
        case domains = "domains"
        case state = "state-province"
        case name = "name"
    }
    
    let country: String?
    let webPages: [String]?
    let twoCode: String?
    let domains: [String]?
    let state: String?
    let name: String?
}
