//
//  DetailSymbolView.swift
//  ProjectThree
//
//  Created by Alexandre Robaert on 21/10/23.
//

import SwiftUI

struct DetailSymbolView: View {
    
    let viewModel: ViewModel
    let name: String
    @State var crypto: CryptoModel? = nil
    
    var body: some View {
        VStack {
            if let crypto {
                Text(crypto.symbol).font(.largeTitle)
                    .foregroundStyle(.green)
                    .padding(.bottom, 24)
                Text("Preço: \(crypto.price)").font(.title)
                Text("Hoje: \(crypto.formatData)").font(.title3)
            } else {
                ProgressView()
            }
        }.task {
            do {
                crypto = try await viewModel.getPrice(symbol: name)
            } catch { }
        }
    }
}

//#Preview {
//    DetailSymbolView(name: "BTC")
//}
