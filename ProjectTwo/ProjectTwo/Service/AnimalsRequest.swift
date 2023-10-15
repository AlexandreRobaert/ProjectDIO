//
//  AnimalsRequest.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import Foundation

public enum AnimalsRequest: Request {

    case dog(name: String)
    case informationDog
    
    public var path: String {
        switch self {
        case .dog:
            "/v1/dogs"
        case .informationDog:
            "/v1/animals"
        }
    }
    
    public var headers: [String : Any]? {
        if let token = Bundle.main.object(forInfoDictionaryKey: "X-Api-Key") as? String {
            return ["X-Api-Key": token]
        }
        return nil
    }
    
    public var queryItems: [URLQueryItem]? {
        
        switch self {
        case .dog(let name):
            return [.init(name: "name", value: name)]
        case .informationDog:
            return [.init(name: "name", value: "dog")]
        }
    }
    
    public var body: [String : Any]? { nil }
    
}
