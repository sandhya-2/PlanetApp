//
//  PlanetResponse.swift
//  PlanetApp
//
//  Created by Sandiya on 18/04/2023.
//

import Foundation

// MARK: - PlanetResponse
struct PlanetResponse: Decodable {
    let count: Int
    let next: String?
    let previous: Int?
    let results: [Planet]
}

// MARK: - Result
struct Planet: Decodable, Identifiable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let created, edited: String
    let url: String
}

extension Planet {
    var id: UUID {
        return UUID()
    }
}

extension Planet {
    /**
        Mocking Planet Objects for Preview and Testing
       @ Parameters:
       @ Returns:  list of Planets
     */
    static func mockPlanets() -> [Planet] {
        return [Planet(name:"Tatooine", rotationPeriod:"23", orbitalPeriod:"304", diameter:"", climate:"arid", gravity:"1 standard", terrain: "", surfaceWater: "", population:"200000", created:"", edited:"", url:""),
                Planet(name:"Alderaan", rotationPeriod:"23", orbitalPeriod:"304", diameter:"", climate:"", gravity:"", terrain: "", surfaceWater: "", population:"", created:"", edited:"", url:"")]
    }
}
