//
//  ServiceProtocol.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import Foundation

public class NetworkService: ServiceProtocol {
    
    private let session: URLSession
    
    public init(sessionConfig: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: sessionConfig)
    }
    
    public func request<T: Codable>(_ request: Request) async throws -> T {
        
        let urlRequest = try convertRequest(request)
        let (data, response) = try await session.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.unknownError
        }
        #if DEBUG
        print("\(urlRequest.httpMethod ?? "") URL ->", urlRequest.url?.absoluteURL ?? "", "|| StatusCode:", response.statusCode)
        request.headers?.forEach { item in
            print("HEADER:", "\(item.key) =", item.value)
        }
        #endif
        switch response.statusCode {
        case 204:
            throw NetworkError.noResponse
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.parseCodable
            }
        default:
            throw NetworkError.connectionFail(statusCode: response.statusCode)
        }
    }
}
