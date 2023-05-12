//
//  UIViewControllerRepresentable.swift
//  PlanetApp
//
//  Created by Sandiya on 18/04/2023.
//

import SwiftUI

struct UIViewControllerRepresentableExample: View {
    
    let name:String,  gravity:String, climate:String, population:String
    var body: some View {
        VStack{
            BasicUIViewControllerRepresentable(nameText: name, gravityText: gravity, climateText: climate, populationText: population )
        }
    }
}

struct UIViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRepresentableExample(name: "", gravity: "", climate: "", population: "")
    }
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let nameText: String
    let gravityText: String
    let climateText: String
    let populationText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let vc = UIViewController()
        
        let labelName = UILabel()
        labelName.text = "Name: " + nameText
        labelName.frame = CGRect(x: 20, y: 50, width: vc.view.frame.width-50, height: 50)
        vc.view.addSubview(labelName)
        
        let lblGravity = UILabel()
        lblGravity.text = "Gravity: " + gravityText
        lblGravity.frame = CGRect(x: 20, y: 100, width: vc.view.frame.width-50, height: 50)
        vc.view.addSubview(lblGravity)
        
        let lblClimate = UILabel()
        lblClimate.text = "Climate: " + climateText
        lblClimate.frame = CGRect(x: 20, y: 150, width: vc.view.frame.width-50, height: 50)
        vc.view.addSubview(lblClimate)
        
        let lblpopulation = UILabel()
        lblpopulation.text = "Climate: " + populationText
        lblpopulation.frame = CGRect(x: 20, y: 200, width: vc.view.frame.width-50, height: 50)
        vc.view.addSubview(lblpopulation)
                
        return vc
        
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
