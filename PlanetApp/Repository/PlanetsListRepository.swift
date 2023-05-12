//
//  PlanetsListRepository.swift
//  PlanetApp
//
//  Created by Sandiya on 18/04/2023.
//

import Foundation
import CoreData

protocol PlanetsListRepository {
    func getPlanets(for url:URL) async throws -> [Planet]
}
protocol PlanetListUseCase {
    func getDataForPlanets(urlString: String) async
}
