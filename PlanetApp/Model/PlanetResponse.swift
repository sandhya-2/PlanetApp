//
//  PlanetResponse.swift
//  PlanetApp
//
//  Created by admin on 18/04/2023.
//

import Foundation

// MARK: - Welcome
struct PlanetResponse: Decodable {
    let count: Int
    let next: String?
    let previous: JSONNull?
    let results: [Planet]
}

// MARK: - Result
struct Planet: Decodable, Identifiable {
    var id = UUID()
        
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
//    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, created, edited, url
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
