//
//  HomeScreenView.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    @EnvironmentObject var storeModel: HomeStoreModel
    
    var body: some View {
        VStack {
            NavigationSplitView {
                Image(.dog).resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                Text("Find Dog").font(.title2)
                List(storeModel.dogs, id: \.name) { dog in
                    NavigationLink {
                        DogDetailView(dog: dog)
                    } label: {
                        Button("\(dog.name) - \(dog.taxonomy.scientificName ?? "No scientific name")") {
                            print(dog.name)
                        }
                    }
                }
                .navigationTitle("Cães")
            } detail: {
                Text("Escolha seu cão")
            }
            
        }.task {
            await storeModel.fetchDogs()
        }
    }
}

#Preview {
    HomeScreenView().environmentObject(HomeStoreModel(service: NetworkService()))
}
