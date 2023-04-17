//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 10/04/23.
//

import SwiftUI

@main
public struct CoreDataExampleApp: App {    
    public init() {}

    public var body: some Scene {
        WindowGroup {
            let viewContext = PersistenceController.shared.container.viewContext
            ContentView(viewContext: viewContext)
        }
    }
}
