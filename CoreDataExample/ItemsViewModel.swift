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
    
    @Published private var items_: [Item]
    
    public init(viewContext: NSManagedObjectContext) {
        self.viewContext_ = viewContext
        self.items_ = []
        fetchItem()
    }
    
    public func GetItem() -> [Item] {
        return items_
    }
    
    private func fetchItem() {
        let request = NSFetchRequest<Item>(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)]
        do {
            items_ = try self.viewContext_.fetch(request)
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func AddItem() {
        withAnimation {
            let newItem = Item(context: self.viewContext_)
            newItem.timestamp = Date()

            do {
                try self.viewContext_.save()
                fetchItem()
                self.objectWillChange.send() // Notify observers of change
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
            offsets.map { items_[$0] }.forEach(self.viewContext_.delete)

            do {
                try self.viewContext_.save()
                fetchItem()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
