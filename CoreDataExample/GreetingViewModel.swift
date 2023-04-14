//
//  GreetingViewModel.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 14/04/23.
//

import SwiftUI

public class GreetingViewModel: ObservableObject {
    @Published private var model_: GreetingModel
    
    public init() {
        self.model_ = GreetingModel()
    }
    
    public func GetGreeting() -> String {
        return self.model_.Greeting_
    }
    
    public func UpdateGreeting() {
        self.model_.Greeting_ = self.model_.Greeting_ == "Hello world!" ? "Hello SwiftUI!" : "Hello world!"
    }
}
