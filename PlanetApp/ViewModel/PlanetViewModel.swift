//
//  PlanetViewModel.swift
//  PlanetApp
//
//  Created by Sandiya on 18/04/2023.
//

import Foundation
import CoreData

@MainActor
class PlanetViewModel:ObservableObject {
    
    @Published var planetList: [Planet] = []
    @Published var customError: NetworkError?
    
    //this dependency injection method = dependency of networkable protocol
    
    private let repository: PlanetsListRepository
   
    init(repository: PlanetsListRepository) {
        self.repository = repository
    }
          
}

extension PlanetViewModel: PlanetListUseCase {
    /**
        Get the list of planet by sending urlString
       @ Parameters: urlString of type string
       @ Returns:
     */
        
    func getDataForPlanets(urlString: String) async {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.customError = NetworkError.invalidURL
            }
            return
        }
        do {
            self.planetList = try await repository.getPlanets(for: url)
            customError = nil
        }catch {
            customError = NetworkError.dataNotFound
        }
    }
}
