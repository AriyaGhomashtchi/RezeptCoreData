//
//  RezeptDetailView.swift
//  RezeptCoreData
//
//  Created by Ariya Ghomashtchi on 08.06.23.
//

import SwiftUI

struct RezeptDetailView: View {
    @State var beschreibung: String = "Leckere Pasta mit Tomatensoße"
    @State var zutaten: String = "Tomaten,Zwiebeln,Pasta"
    @State var portionen: Int16 = 2
    @State var rezeptName: String = "Spaghetti Bologense"
    
    var body: some View {
        VStack {
            ScrollView{
                Text(rezeptName)
                    .font(.title)
                    .padding()
                
                Text("Portionen: \(portionen)")
                    .font(.title2)
                    .padding()
                
                Text("Zutaten: \(zutaten)")
                    .font(.title2)
                    .padding()
                
                Text("Beschreibung: \(beschreibung)")
                    .font(.title2)
                    .padding()
            
                
                
                
            }
        }
    }
}

struct RezeptDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RezeptDetailView()
    }
}
