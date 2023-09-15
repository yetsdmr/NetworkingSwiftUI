//
//  CoinsViewModel.swift
//  NetworkingSwiftUI
//
//  Created by Yunus Emre Taşdemir on 12.09.2023.
//

import SwiftUI

class CoinsViewModel: ObservableObject{
    
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        //fetchPrice(coin: "bitcoin")
        //fetchCoins()
        //fetchCoinsWithResult()
        Task { try await fetchCoinsCompletionHandlers() }
    }
    
    func fetchCoins() {
        service.fetchCoins { coins, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return 
                }
                 
                self.coins = coins ?? []
            }
        }
    }
    
    func fetchCoinsWithResult() {
        service.fetchCoinsWithResult { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func fetchCoinsCompletionHandlers() async throws {
        self.coins = try await service.fetchCoinsCompletionHandlers()
    }
    
}
