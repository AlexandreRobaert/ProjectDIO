//
//  CryptoModel.swift
//  ProjectThree
//
//  Created by Alexandre Robaert on 21/10/23.
//

import Foundation
import SwiftUI

class CryptoModel: Codable, Identifiable, ObservableObject, Hashable {
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case price
        case timeStamp = "timestamp"
    }
    
    var id: String {
        return symbol
    }
    let symbol: String
    let price: String
    let timeStamp: TimeInterval
    
    var formatData: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = .current
        return formatter.string(from: Date(timeIntervalSince1970: timeStamp))
    }
    
    init(symbol: String, price: String, timeStamp: TimeInterval) {
        self.symbol = symbol
        self.price = price
        self.timeStamp = timeStamp
    }
    
    static func == (lhs: CryptoModel, rhs: CryptoModel) -> Bool {
        lhs.symbol == rhs.symbol
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(symbol)
    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.symbol = try container.decode(String.self, forKey: .symbol)
//        self.price = try container.decode(String.self, forKey: .price)
//        self.timeStamp = try container.decode(TimeInterval.self, forKey: .timeStamp)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.symbol, forKey: .symbol)
//        try container.encode(self.price, forKey: .price)
//        try container.encode(self.timeStamp, forKey: .timeStamp)
//    }
}
