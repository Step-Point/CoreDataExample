//
//  EmployeeView.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 17/04/23.
//

import Foundation
import SwiftUI
import CoreData


public struct EmployeesView: View {
    @ObservedObject private var viewModel_: EmployeesViewModel
    @State private var name_: String
    
    public init(viewContext: NSManagedObjectContext, company: Company) {
        self.viewModel_ = EmployeesViewModel(viewContext: viewContext, company: company)
        self.name_ = ""
    }
    
    public var body: some View {
        VStack {
            
            HStack {
                TextField("Enter Employee Name", text: self.$name_)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(5)
                
                Button {
                    self.viewModel_.AddEmployee(name: self.name_)
                    self.name_ = ""
                } label: {
                    Text("Add")
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            ScrollView {
                ForEach(self.viewModel_.GetEmployees(), id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.name ?? "")
                            .fontWeight(.semibold)
                            .font(.headline)
                        if let title = self.viewModel_.GetCompany().title {
                            Text(title)
                                .font(.subheadline)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }.navigationTitle("Employees")
    }
}

public struct EmployeesView_Previews: PreviewProvider {
    public static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let company = Company(context: viewContext)
        company.id = UUID()
        company.owner = "Group 15"
        company.title = "Step Point"
        return EmployeesView(viewContext: viewContext, company: company)
    }
}
