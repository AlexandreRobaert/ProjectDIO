//
//  DogDetailView.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 15/10/23.
//

import SwiftUI
import Kingfisher

struct DogDetailView: View {
    
    @EnvironmentObject var storeModel: HomeStoreModel
    @State var results: [DogModel]? = nil
    
    let dog: Dog

    var body: some View {
        VStack {
            if let dogModel = results?.first {
                KFImage
                    .url(dogModel.imageLink)
                    .placeholder({ Image(.notfound) })
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.accentColor, lineWidth: 2)
                            .shadow(radius: 5)
                    }
            } else {
                Image(.notfound).resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
            }
            Text(dog.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
            List() {
                Text("Nome comun - \(dog.characteristics.commonName ?? "")")
                Text("Peso - \(dog.characteristics.weight ?? "")")
                Text("Idade adulta - \(dog.characteristics.ageOfSexualMaturity ?? "")")
                Text("Velocidade máxima - \(dog.characteristics.topSpeed ?? "")")
                if let dogModel = results?.first {
                    Text("Expectativa de vida - \(dogModel.maxLifeExpectancy)")
                    Text("Treinabilidade - \(dogModel.trainability)")
                }
            }
        }
        .task {
            results = await storeModel.fetchDogDetail(name: dog.name)
        }
    }
}
