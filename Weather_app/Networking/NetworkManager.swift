//
//  NetworkManager.swift
//  Weather_app
//
//  Created by dorra ben abdelwahed on 5/3/2024.
//

import Foundation

class NetworkManager: ObservableObject {
    
    let session = URLSession.shared
    
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T {
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.requestFailed(description: "Invalid response")
        }
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw NetworkError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
    
}
