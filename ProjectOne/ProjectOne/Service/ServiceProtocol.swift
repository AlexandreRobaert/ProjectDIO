//
//  ServiceProtocol.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import Foundation

public protocol ServiceProtocol {
    func request<T: Codable>(_ request: Request) async throws -> T
}

extension ServiceProtocol {
    
    func convertRequest(_ request: Request) throws -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = request.scheme
        urlComponents.host = request.baseURL
        urlComponents.port = request.port
        urlComponents.path = request.path
        urlComponents.queryItems = request.queryItems
        guard let url: URL = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        request.headers?.forEach({ value in
            urlRequest.addValue(String(describing: value.value), forHTTPHeaderField: value.key)
        })
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("true", forHTTPHeaderField: "X-Use-Cache")
        if let token = request.token, !token.isEmpty {
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        if let body = request.body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body)
            } catch {
                throw NetworkError.malformedBody
            }
        }
        return urlRequest
    }
}
