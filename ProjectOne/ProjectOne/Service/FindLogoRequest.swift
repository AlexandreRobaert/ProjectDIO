//
//  FindLogoRequest.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import Foundation

public enum FindLogoRequest: Request {

    case logo(name: String)
    
    public var path: String {
        "/logo"
    }
    
    public var headers: [String : Any]? {
        if let token = Bundle.main.object(forInfoDictionaryKey: "X-Api-Key") as? String {
            return ["X-Api-Token": token]
        }
        return nil
    }
    
    public var queryItems: [URLQueryItem]? {
        if case .logo(let name) = self {
            return [.init(name: "name", value: name)]
        }
        return nil
    }
    
    public var body: [String : Any]? { nil }
    
}
