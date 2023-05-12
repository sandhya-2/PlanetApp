//
//  NetworkManager.swift
//  PlanetApp
//
//  Created by Sandiya on 18/04/2023.
//

import Foundation

protocol Networkable {
    func get(url: URL) async throws -> Data
}

struct NetworkManager {
    let urlSession: Networking
    init(urlSession: Networking = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: Networkable {
    /**
        Get the data from the API
       @ Parameters: urlString of type string
       @ Returns:
     */
    
    func get(url: URL) async throws -> Data {
        do {
            let (data, _) = try await  urlSession.data(from: url)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
