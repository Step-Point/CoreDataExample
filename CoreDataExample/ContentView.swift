//
//  ContentView.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 10/04/23.
//

import SwiftUI
import CoreData

public struct ContentView: View {
    @ObservedObject private var itemsViewModel_: ItemsViewModel
    
    public init(itemsViewModel: ItemsViewModel) {
        self.itemsViewModel_ = itemsViewModel
    }

    public var body: some View {
        NavigationView {
            List {
                ForEach(self.itemsViewModel_.GetItem()) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: ItemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: ItemFormatter)
                    }
                }
                .onDelete(perform: self.itemsViewModel_.DeleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: self.itemsViewModel_.AddItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let itemsViewModel_ = ItemsViewModel(viewContext: PersistenceController.preview.container.viewContext)
        ContentView(itemsViewModel: itemsViewModel_)
    }
}
