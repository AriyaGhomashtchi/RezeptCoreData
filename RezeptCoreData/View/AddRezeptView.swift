//
//  AddRezeptView.swift
//  RezeptCoreData
//
//  Created by Ariya Ghomashtchi on 08.06.23.
//

import SwiftUI

struct AddRezeptView: View {
    @State var beschreibung: String = ""
    @State var zutaten: String = ""
    @State var portionen: Int16 = 0
    @State var rezeptName: String = ""
    @Binding var isDrawerOpen: Bool
    @StateObject var viewModel = RezeptViewModel()
    
    var body: some View {
        VStack{
            Section(header: Text("Rezeptname")) {
                TextField("Rezeptname", text: $rezeptName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section(header: Text("Portionen")) {
                TextField("Portionen", value: $portionen, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section(header: Text("Zutaten")) {
                TextEditor(text: $zutaten)
                                        .frame(height: 200)
            
            }
            Section(header: Text("Beschreibung")) {
                TextEditor(text: $beschreibung)
                                        .frame(height: 200)
            }
            Section {
                Button(action: {
                    viewModel.saveRezept(name: rezeptName, portionen: portionen, zutaten: zutaten, beschreibung: beschreibung)
                    isDrawerOpen.toggle()
                }, label: {
                    Text("Rezept hinzufügen")
                })
            }
        
        }
    }
}

struct AddRezeptView_Previews: PreviewProvider {
    static var previews: some View {
        AddRezeptView(isDrawerOpen: .constant(false))
    }
}
