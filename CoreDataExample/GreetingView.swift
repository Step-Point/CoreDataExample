//
//  GreetingView.swift
//  CoreDataExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 10/04/23.
//

import SwiftUI

public struct GreetingView: View {
    @State public var Greeting_: String
    
    public init() {
        self.Greeting_ = "Hello world!"
    }

    public var body: some View {
        Text(self.Greeting_)
            .onTapGesture {
                self.Greeting_ = self.Greeting_ == "Hello world!" ? "Hello SwiftUI!" : "Hello world!"
            }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
