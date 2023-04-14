//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 10/04/23.
//

import SwiftUI

@main
public struct CoreDataExampleApp: App {
    let persistenceController = PersistenceController.shared
    
    public init() {}

    public var body: some Scene {
        WindowGroup {
            let itemsViewModel_ = ItemsViewModel(viewContext: persistenceController.container.viewContext)
            ContentView(itemsViewModel: itemsViewModel_)
        }
    }
}
