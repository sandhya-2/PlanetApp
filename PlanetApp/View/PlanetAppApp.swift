//
//  PlanetAppApp.swift
//  PlanetApp
//
//  Created by Sandiya on 14/04/2023.
//

import SwiftUI

@main
struct PlanetAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PlanetViewModel(repository: PlanetsListRepositoryImplemenation(networkManager: NetworkManager())))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
