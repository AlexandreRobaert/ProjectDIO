//
//  ServiceProtocol.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
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
                data.prettyPrintedJSONString()
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                showLogParse(error: error)
                throw NetworkError.parseCodable
            }
        default:
            throw NetworkError.connectionFail(statusCode: response.statusCode)
        }
    }
    
    private func prettyJson<T: Codable>(model: T) {
        #if DEBUG
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let data = try? encoder.encode(model), let json = String(data: data, encoding: .utf8) {
            print("RESPONSE START ---------------------------------------------")
            print(json)
            print("RESPONSE END -----------------------------------------------")
        }
        #endif
    }
    
    private func showLogParse(error: Error) {
        #if DEBUG
        print("")
        print("PARSE ERROR ------------------------------->")
        print((error as CustomDebugStringConvertible).debugDescription)
        print("PARSE ERROR ------------------------------->")
        #endif
    }
}

extension Data {
    func prettyPrintedJSONString() {
        #if DEBUG
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyJSON = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
            return
        }
        
        print("RESPONSE START ---------------------------------------------")
        print(prettyJSON)
        print("RESPONSE END -----------------------------------------------")
        #endif
    }
}
