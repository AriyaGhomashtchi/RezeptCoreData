//
//  HomeView.swift
//  RezeptCoreData
//
//  Created by Ariya Ghomashtchi on 08.06.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = RezeptViewModel()
    @State private var isDrawerOpen = false
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(viewModel.savedRezepte) { rezept in
                        NavigationLink(value: rezept, label: {
                            Text(rezept.rezeptName ?? "")
                        })
                        
                    }
                    .onDelete(perform: viewModel.deleteRezept)
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            isDrawerOpen.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
            }.navigationTitle("Rezepte")
                .sheet(isPresented: $isDrawerOpen, content: {
                    AddRezeptView()
                })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
