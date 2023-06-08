//
//  RezeptViewModel.swift
//  RezeptCoreData
//
//  Created by Ariya Ghomashtchi on 08.06.23.
//

import CoreData
import Foundation

class RezeptViewModel: ObservableObject {
    
    var container : NSPersistentContainer
    
    
    @Published var savedRezepte : [Rezept] = []
    
    init() {
        
        container = NSPersistentContainer(name: "DataModelRezepte")
        container.loadPersistentStores { _, error in
            
            if let error = error {
                fatalError("core data store failed: \(error.localizedDescription)")
            }
        }
        fetchRezepte()
    }
    
    func fetchRezepte() {
        let request = NSFetchRequest<Rezept>(entityName: "Rezept")
        
        do {
            savedRezepte = try container.viewContext.fetch(request)
        } catch {
            print("loading the data failed: \(error)")
        }
    }
    
    func saveRezept(name: String, portionen: Int16, zutaten: String, beschreibung: String) {
        let newRezept = Rezept(context: container.viewContext)
        newRezept.rezeptName = name
        newRezept.portionen = portionen
        newRezept.zutaten = zutaten
        newRezept.beschreibung = beschreibung
        
        do {
            try container.viewContext.save()
            fetchRezepte()
        } catch {
            print("error saving: \(error)")
        }
    }
    
    func filterByName(by name: String) {
        
        let predicate = NSPredicate(format: "name == %@", name)
        
        let request = NSFetchRequest<Rezept>(entityName: "Rezept")
        
        
        request.predicate = predicate
        
        do {
            savedRezepte = try container.viewContext.fetch(request)
            
        } catch {
            print("failed to filter a name \(error.localizedDescription)")
        }
    }
    
    func updateRezept(Rezept: Rezept, rezeptName: String ,portionen: Int16, zutaten: String, beschreibung: String){
            if !rezeptName.isEmpty {
                Rezept.rezeptName = rezeptName
            }
            if portionen != 0 {
                Rezept.portionen = portionen
            }
            if !zutaten.isEmpty{
                Rezept.zutaten = zutaten
            }
            if !beschreibung.isEmpty{
                Rezept.beschreibung = beschreibung
            }
            
            do {
                try container.viewContext.save()
                fetchRezepte()
            } catch {
                print("unable to update recipe: \(error.localizedDescription)")
            }
        }
    
    func deleteRezept(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        
        
        
        do{
            let animalToDelete = savedRezepte[index]
            container.viewContext.delete(animalToDelete)
            try container.viewContext.save()
            fetchRezepte()
        }catch {
            print("deleting failed: \(error)")
        }
    }
    
}
