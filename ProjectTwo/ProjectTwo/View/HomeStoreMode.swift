//
//  HomeStoreMode.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import Foundation
import SwiftUI

final class HomeStoreModel: ObservableObject {
    
    private let service: ServiceProtocol
    @Published var dogs: [Dog] = []
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func fetchDogs() async {
        Task {
            do {
                dogs = try await service.request(AnimalsRequest.informationDog)
            } catch let error as NetworkError {
                print(error.description)
            }
        }
    }
    
    @MainActor
    func fetchDogDetail(name: String) async -> [DogModel]? {
        do {
            let dog: [DogModel] = try await service.request(AnimalsRequest.dog(name: name))
            return dog
        } catch let error as NetworkError {
            print(error.description)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
