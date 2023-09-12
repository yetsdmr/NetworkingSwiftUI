//
//  CoinsViewModel.swift
//  NetworkingSwiftUI
//
//  Created by Yunus Emre Taşdemir on 12.09.2023.
//

import SwiftUI

class CoinsViewModel: ObservableObject{
    @Published var coin = ""
    @Published var price = ""
    
    init() {
        fetchPrice()
    }
    
    func fetchPrice() {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids-bitcoin&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        print( "Fetching price..")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Did receive data \(data)")
        }.resume()
        
        print("Did reach end of function..")
    }
}
