//
//  ViewModel.swift
//  ProjectThree
//
//  Created by Alexandre Robaert on 21/10/23.
//

import Foundation
import Network // Import do outro módulo
import SwiftUI

class ViewModel: ObservableObject {

    private let service: ServiceProtocol // Usando protocolo de outro módulo
    @Published var symbols: [String] = []
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func getSymbols() async throws {
        let response: SymbolsModel = try await service.request(Requests.symbols) // Usando método de outro módulo
        symbols = response.symbols
    }
    
    @MainActor
    func getPrice(symbol: String) async throws -> CryptoModel {
        try await service.request(Requests.price(symbol: symbol)) // Usando método de outro módulo
    }
}
