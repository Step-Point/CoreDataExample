//
//  ContentView.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 10/04/23.
//

import SwiftUI
import CoreData

public struct ContentView: View {
    private var viewContext_: NSManagedObjectContext
    
    private var index = 1
    
    public init(viewContext: NSManagedObjectContext) {
        self.viewContext_ = viewContext
    }
    
    public var body: some View {
        NavigationView {
            if index == 0  {
                ItemsView(viewContext: self.viewContext_)
            } else if index == 1 {
                CompaniesView(viewContext: self.viewContext_)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        ContentView(viewContext: viewContext)
    }
}
