//
//  ContentView.swift
//  PlanetApp
//
//  Created by Sandiya on 14/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @StateObject var viewModel: PlanetViewModel
    @State var isErrorOccurred: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                if viewModel.planetList.count == 0 {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.planetList) { planet in
                            
                            NavigationLink {

                                DetailScreen(planetData: planet)

                            } label: {
                                PlanetCell(planet: planet)
                                
                            }
                        
                        }
                        
                    }
                    
                }
            }.task {
                await getDataForUI()
            }
            .navigationTitle("Planets")
        }
    }

    func getDataForUI() async {
        await  viewModel.getDataForPlanets(urlString: APIEndpoints.planetEndpoint)
        if viewModel.customError != nil{
            isErrorOccurred = true
            
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PlanetViewModel(repository: PlanetsListRepositoryImplemenation(networkManager: NetworkManager()))).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
