//
//  NetworkManager.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import Foundation

class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    let session = URLSession.shared
    
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T {
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            // Throw an error if the response is not valid
            throw NetworkError.requestFailed(description: "Invalid response")
        }
        guard httpResponse.statusCode == 200 else {
            // Throw an error if the status code is not 200
            throw NetworkError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            // Throw an error if JSON decoding fails
            throw NetworkError.jsonParsingFailure(description: error.localizedDescription)
        }
    }
    
}
