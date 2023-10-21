//
//  Requests.swift
//  ProjectThree
//
//  Created by Alexandre Robaert on 21/10/23.
//

import Foundation
import Network

enum Requests: Request {
    
    case symbols
    case price(symbol: String)
    
    var path: String {
        switch self {
        case .symbols:
            "/v1/cryptosymbols"
        case .price:
            "/v1/cryptoprice"
        }
    }
    
    public var headers: [String : Any]? {
        if let token = Bundle.main.object(forInfoDictionaryKey: "X-Api-Key") as? String {
            return ["X-Api-Key": token]
        }
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .symbols: return nil
        case .price(let symbol):
            return [URLQueryItem(name: "symbol", value: symbol)]
        }
    }
    
    var body: [String : Any]? { nil }
}
