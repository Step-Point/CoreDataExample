//
//  Company+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 17/04/23.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var owner: String?
    @NSManaged public var companyToEmployee: Employee?

}

extension Company : Identifiable {

}
