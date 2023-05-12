//
//  PlanetObjectEntity+Extension.swift
//  PlanetApp
//
//  Created by Sandiya on 19/04/2023.
//

import Foundation
import CoreData

extension PlanetObjectEntity {
    
    static func insertEPlanet(planets: [Planet], moc: NSManagedObjectContext)throws {
        
        // First delete all records than save all records to avoid duplication.
        try deleteRecords(moc: moc)
        planets.forEach { planet in
            let ePlanet = NSEntityDescription.insertNewObject(forEntityName:"PlanetObjectEntity", into: moc) as? PlanetObjectEntity
            
            ePlanet?.name = planet.name
            ePlanet?.gravity = planet.gravity
            ePlanet?.climate = planet.climate
            ePlanet?.population = planet.population
        }
        try moc.save()
    }
    

    static func fetchAllPlanets(moc: NSManagedObjectContext)-> [PlanetObjectEntity] {
        let fr = PlanetObjectEntity.fetchRequest()
        return (try? moc.fetch(fr)) ?? []
    }
    

    static func deleteRecords(moc: NSManagedObjectContext)throws {
       let planets =  PlanetObjectEntity.fetchAllPlanets(moc: moc)
        
        planets.forEach {
            moc.delete($0)
        }
        try moc.save()
    }

    func toPlanet()-> Planet {
        return Planet(name:name ?? "",
                      rotationPeriod: "", orbitalPeriod: "", diameter:  "",
                      climate: climate ?? "", gravity: gravity ?? "",
                      terrain: "", surfaceWater: "", population: population ?? "", created:   "", edited:  "", url: "")
    }
}
