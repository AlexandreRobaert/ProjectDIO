//
//  NetworkError.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import Foundation

public enum NetworkError: Error {
    case noResponse
    case connectionFail
    case unknownError
    case parseCodable
    case invalidURL
    case malformedBody
}
