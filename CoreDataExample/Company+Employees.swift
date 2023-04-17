//
//  Company+Employees.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 17/04/23.
//

import Foundation

extension Company {
    public func GetEmployees() -> [Employee] {
        let employees = employees as? Set<Employee> ?? []
        
        return employees.sorted {
            $0.name ?? "" > $1.name ?? ""
        }
    }
}
