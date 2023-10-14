//
//  DogRequest.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import Foundation

public enum DogRequest: Request {

    case dog(name: String)
    
    public var path: String {
        "/v1/dogs"
    }
    
    public var headers: [String : Any]? {
        if let token = Bundle.main.object(forInfoDictionaryKey: "X-Api-Key") as? String {
            return ["X-Api-Key": token]
        }
        return nil
    }
    
    public var queryItems: [URLQueryItem]? {
        if case .dog(let name) = self {
            return [.init(name: "name", value: name)]
        }
        return nil
    }
    
    public var body: [String : Any]? { nil }
    
}
