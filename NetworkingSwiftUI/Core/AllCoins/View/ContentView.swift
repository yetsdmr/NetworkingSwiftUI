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
        VStack {
            Text("\(viewModel.coin): \(viewModel.price)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
