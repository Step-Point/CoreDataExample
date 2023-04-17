//
//  CompanyViewModel.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 14/04/23.
//

import SwiftUI
import CoreData

public class CompanyViewModel: ObservableObject {
    private let viewContext_ = PersistenceController.shared.container.viewContext
    
    @Published private var companies_: [Company]
    
    public init() {
        self.companies_ = []
        fetchCompany()
    }
    
    public func GetCompany() -> [Company] {
        return companies_
    }
    
    private func fetchCompany() {
        let request = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            self.companies_ = try self.viewContext_.fetch(request)
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func AddCompany(companyTitle: String, companyOwner: String) {
        let company = Company(context: self.viewContext_)
        company.id = UUID()
        company.title = companyTitle
        company.owner = companyOwner
        
        do {
            try self.viewContext_.save()
            fetchCompany()
            self.objectWillChange.send() // Notify observers of change
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
