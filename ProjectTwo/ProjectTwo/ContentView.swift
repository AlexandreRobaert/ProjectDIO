//
//  ContentView.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import SwiftUI

struct ContentView: View {
    
    let service: ServiceProtocol = NetworkService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
