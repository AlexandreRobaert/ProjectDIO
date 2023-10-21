//
//  ContentView.swift
//  ProjectThree
//
//  Created by Alexandre Robaert on 21/10/23.
//

import SwiftUI
import Network

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "bahtsign.circle")
                    .imageScale(.large)
                    .foregroundStyle(.orange)
                Text("Cryptos").font(.largeTitle)
                List(viewModel.symbols, id: \.self) { symbol in
                    NavigationLink(symbol, value: symbol)
                }
                .navigationDestination(for: String.self) { symbol in
                    DetailSymbolView(viewModel: viewModel, name: symbol)
                }
            }
            .padding()
            .task {
                do {
                    try await viewModel.getSymbols()
                } catch let error as NetworkError {
                    print(error.description)
                } catch { }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: .init(service: NetworkService()))
}
