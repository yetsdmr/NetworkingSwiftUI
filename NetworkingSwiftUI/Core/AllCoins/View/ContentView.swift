//
//  ContentView.swift
//  NetworkingSwiftUI
//
//  Created by Yunus Emre Taşdemir on 11.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                HStack(spacing: 12 ) {
                    Text("\(coin.marketCapRank)")
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(coin.name)
                            .fontWeight(.semibold)
                        
                        Text(coin.symbol.uppercased())
                    }
                    .font(.footnote)
                }
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
