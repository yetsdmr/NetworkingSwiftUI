//
//  CoinsViewModel.swift
//  NetworkingSwiftUI
//
//  Created by Yunus Emre Taşdemir on 12.09.2023.
//

import SwiftUI

class CoinsViewModel: ObservableObject{
    
    @Published var coins = [Coin]()
    
    private let service = CoinDataService()
    
    init() {
        //fetchPrice(coin: "bitcoin")
        fetchCoins()
    }
    
    func fetchCoins() {
        service.fetchCoins { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
    
}
