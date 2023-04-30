//
//  HomeViewModel.swift
//  CryptoCurrency
//
//  Created by Stanislav Lemeshaev on 26.04.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    // MARK: - Properties
    @Published var coins = [Coin]()
    @Published var topCoins = [Coin]()
    
    // MARK: - Init
    init() {
        fetchCoinData()
    }
    
    // MARK: - Methods
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopCoins()
                }
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
        }.resume()
    }
    
    func configureTopCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topCoins = Array(topMovers.prefix(5))
    }
}
