//
//  MockRESTAPIManager.swift
//  PlanetAppTests
//
//  Created by admin on 19/04/2023.
//

import Foundation
@testable import PlanetApp

class MockRestAPIManager: Networkable {
       
    func get(url: URL) async throws -> Data {
        do {
            let bundle = Bundle(for: MockRestAPIManager.self)
            guard let resourcePath = bundle.url(forResource: url.absoluteString, withExtension: "json") else
            {
                throw NetworkError.invalidURL            }
            let data = try Data(contentsOf: resourcePath)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}


