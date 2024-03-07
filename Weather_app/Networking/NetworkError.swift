//
//  NetworkError.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import Foundation

enum NetworkError: Error {
    case requestFailed(description: String)
    case responseUnsuccessful(description: String)
    case jsonParsingFailure(description: String)
    case noInternet
    
    var customDescription: String {
        switch self {
        case let .requestFailed(description): return "Request Failed: \(description)"
        case let .responseUnsuccessful(description): return "Unsuccessful: \(description)"
        case let .jsonParsingFailure(description): return "JSON Parsing Failure: \(description)"
        case .noInternet: return "No internet connection"
        }
    }
}
