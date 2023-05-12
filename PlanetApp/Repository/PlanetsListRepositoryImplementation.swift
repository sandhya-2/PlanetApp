//
//  PlanetsListRepositoryImplementaation.swift
//  PlanetApp
//
//  Created by Sandiya on 18/04/2023.
//

import Foundation

class PlanetsListRepositoryImplemenation: PlanetsListRepository {
    
    var networkManager: Networkable
    private let persistence: PersistenceController
    
    init(networkManager: Networkable, persistence: PersistenceController = .shared){
        self.networkManager = networkManager
        self.persistence =  persistence
    }
    
    /**
        Get the data from the API,  if not then get the data from the CoreData
       @ Parameters: url as URL
       @ Returns: Planet response from the API
     */
    
    func getPlanets(for url: URL) async throws -> [Planet] {
        
        let data = try? await self.networkManager.get(url: url)
        var planets: [Planet]?
        if let data = data {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let planetData = try? decoder.decode(PlanetResponse.self, from: data)
            planets = planetData?.results
        }
        if let planets = planets {
            // Save to core data
           try PlanetObjectEntity.insertEPlanet(planets:planets , moc: persistence.container.viewContext)
            return planets
        } else {
           // read from core data if api fails to return
           let ePlanets = PlanetObjectEntity.fetchAllPlanets(moc: persistence.container.viewContext)
            
            // Mapping core data entity to model (PlanetObjectEntity to Planet)
            return ePlanets.map { $0.toPlanet() }
        }
    }
    
    
}
