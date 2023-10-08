//
//  RequestProtocol.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import Foundation

public protocol Request {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var port: Int? { get }
    var method: HttpMethod { get }
    var headers: [String: Any]? { get }
    var token: String? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: [String: Any]? { get }
}

public extension Request {
    
    var scheme: String {
        "https"
    }
    
    var baseURL: String {
        Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
    }
    
    var port: Int? {
        nil
    }
    
    var method: HttpMethod {
        .get
    }
    
    var token: String? {
        nil
    }
}
