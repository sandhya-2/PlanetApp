//
//  MockRespository.swift
//  PlanetAppTests
//
//  Created by admin on 20/04/2023.
//

import Foundation
@testable import PlanetApp

class MockRepository: PlanetsListRepository {
    
    private var planets: [Planet] = []
    private var error: NetworkError?
    
    func getPlanets(for url: URL) async throws -> [PlanetApp.Planet] {
        if error != nil {
            throw error!
        }
        return planets
    }
    
    func setError(error:NetworkError){
        self.error = error
    }
    
    func setResponse(planets:[Planet]){
        self.planets = planets
    }
    
}
