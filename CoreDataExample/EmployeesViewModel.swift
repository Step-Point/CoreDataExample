//
//  EmployeeViewModel.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 17/04/23.
//

import SwiftUI
import CoreData

public class EmployeesViewModel: ObservableObject {
    private let viewContext_: NSManagedObjectContext
    
    private var company_: Company
    @Published private var employees_: [Employee]
    
    public init(viewContext: NSManagedObjectContext, company: Company) {
        self.viewContext_ = viewContext
        self.company_ = company
        self.employees_ = []
        fetchEmployees()
    }
    
    public func GetEmployees() -> [Employee] {
        return employees_
    }
    
    private func fetchEmployees() {
        self.employees_ = self.company_.GetEmployees()
    }
    
    public func AddEmployee(name: String) {
        let employee = Employee(context: self.viewContext_)
        employee.id = UUID()
        employee.name = name
        
        company_.addToEmployees(employee)
        
        do {
            try self.viewContext_.save()
            fetchEmployees()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    public func GetCompany() -> Company {
        return company_
    }
}
