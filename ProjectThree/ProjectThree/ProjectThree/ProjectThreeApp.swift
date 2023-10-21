//
//  ProjectThreeApp.swift
//  ProjectThree
//
//  Created by Alexandre Robaert on 21/10/23.
//

import SwiftUI
import Network

@main
struct ProjectThreeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(service: NetworkService()))
        }
    }
}
