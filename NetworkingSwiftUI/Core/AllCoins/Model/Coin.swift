//
//  Coin.swift
//  NetworkingSwiftUI
//
//  Created by Yunus Emre Taşdemir on 13.09.2023.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    //let currentPrice: Double
    //let marketCapRank: Int
}
