//
//  ContentViewModel.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 14/04/23.
//

import SwiftUI
import CoreData

public class ItemsViewModel: ObservableObject {
    private var viewContext_: NSManagedObjectContext
    
    @Published var Items_: [Item]
    
    public init(viewContext: NSManagedObjectContext) {
        self.viewContext_ = viewContext
        self.Items_ = []
        fetchItems()
    }
    
    private func fetchItems() {
        let request = NSFetchRequest<Item>(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)]
        do {
            Items_ = try viewContext_.fetch(request)
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func AddItem() {
        withAnimation {
            let newItem = Item(context: viewContext_)
            newItem.timestamp = Date()

            do {
                try viewContext_.save()
                fetchItems()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func DeleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { Items_[$0] }.forEach(viewContext_.delete)

            do {
                try viewContext_.save()
                fetchItems()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
