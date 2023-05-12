//
//  DetailScreen.swift
//  PlanetApp
//
//  Created by Sandiya on 18/04/2023.
//

import SwiftUI
import UIKit

struct DetailScreen: View {
    
    let planetData: Planet
    
    var body: some View {
        VStack {

            BasicUIViewControllerRepresentable(nameText: planetData.name, gravityText: planetData.gravity,climateText: planetData.climate, populationText: planetData.population)
            
               Spacer()
                        
        }.navigationTitle("Planet Details")
        
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(planetData: Planet(name: "", rotationPeriod: "", orbitalPeriod: "", diameter: "", climate: "", gravity: "", terrain: "", surfaceWater: "", population: "", created: "", edited: "", url: ""))
    }
}

