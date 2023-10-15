//
//  ProjectTwoApp.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import SwiftUI

@main
struct ProjectTwoApp: App {
   
    @StateObject var storeModel: HomeStoreModel = HomeStoreModel(service: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView().environmentObject(storeModel)
        }
    }
}
