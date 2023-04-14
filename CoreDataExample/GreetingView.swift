//
//  GreetingView.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 10/04/23.
//

import SwiftUI

public struct GreetingView: View {

    @StateObject private var viewModel_: GreetingViewModel

    public init() {
       self._viewModel_ = StateObject(wrappedValue: GreetingViewModel())
    }
    
    public var body: some View {
        Text(self.viewModel_.GetGreeting())
            .onTapGesture {
                self.viewModel_.UpdateGreeting()
            }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
