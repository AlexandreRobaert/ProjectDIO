//
//  LogoResult.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import Foundation

public struct LogoModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case ticker = "ticker"
        case imageURL = "image"
    }
    
    let name: String
    let ticker: String
    let imageURL: String
}
