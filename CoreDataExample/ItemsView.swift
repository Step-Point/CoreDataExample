//
//  ItemsView.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 17/04/23.
//

import SwiftUI
import CoreData

public struct ItemsView: View {
    @ObservedObject private var viewModel_: ItemsViewModel
    
    public init(viewContext: NSManagedObjectContext) {
        self.viewModel_ = ItemsViewModel(viewContext: viewContext)
    }
    
    public var body: some View {
        List {
            ForEach(self.viewModel_.GetItem()) { item in
                NavigationLink {
                    Text("Item at \(item.timestamp!, formatter: ItemFormatter)")
                } label: {
                    Text(item.timestamp!, formatter: ItemFormatter)
                }
            }
            .onDelete(perform: self.viewModel_.DeleteItems)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: self.viewModel_.AddItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
}

public struct ItemsView_Preview: PreviewProvider {
    public static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        return NavigationView {
            ItemsView(viewContext: viewContext)
        }
    }
}
