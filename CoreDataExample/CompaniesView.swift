//
//  CompaniesView.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 17/04/23.
//

import Foundation
import SwiftUI
import CoreData

public struct CompaniesView: View {
    private var viewContext_: NSManagedObjectContext
    @ObservedObject private var viewModel_: CompaniesViewModel
    @State private var title_: String
    @State private var owner_: String
    
    public init(viewContext: NSManagedObjectContext) {
        self.viewContext_ = viewContext
        self.viewModel_ = CompaniesViewModel(viewContext: self.viewContext_)
        self.title_ = ""
        self.owner_ = ""
    }
    
    public var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("Enter Company Name", text: self.$title_)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 55)
                        .background(Color(uiColor: .systemGray5))
                        .cornerRadius(5)
                    
                    TextField("Enter Owner Name", text: self.$owner_)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 55)
                        .background(Color(uiColor: .systemGray5))
                        .cornerRadius(5)
                }
                
                Button {
                    self.viewModel_.AddCompany(companyTitle: title_, companyOwner: owner_)
                    self.title_ = ""
                    self.owner_ = ""
                } label: {
                    Text("Add")
                }
                
            }.padding(.horizontal)
            
            ScrollView {
                ForEach(self.viewModel_.GetCompanies(), id: \.id) { item in
                    NavigationLink {
                        EmployeesView(viewContext: self.viewContext_, company: item)
                    } label: {
                        VStack(alignment: .leading) {
                            if let title = item.title {
                                Text(title)
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            if let owner = item.owner {
                                Text(owner)
                                    .font(.subheadline)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    
                    
                }
            }
        }.navigationTitle("Company")
    }
}

public struct CompaniesView_Previews: PreviewProvider {
    public static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        return NavigationView {
            CompaniesView(viewContext: viewContext)
        }
    }
}
