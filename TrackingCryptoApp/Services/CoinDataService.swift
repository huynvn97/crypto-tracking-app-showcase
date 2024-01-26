//
//  CoinDataService.swift
//  TrackingCryptoApp
//
//  Created by ad on 19/01/2024.
//

import Foundation
import Combine

struct CoinmarketCapStatus: Codable {
    let timestamp: String
    let errorCode: Int
    let errorMessage: String?
    let elapsed, creditCount:  Int
    
    enum CodingKeys: String, CodingKey {
        case timestamp, elapsed
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case creditCount = "credit_count"
    }
}

struct GetCoinResponse: Codable {
    let status: CoinmarketCapStatus
    let data: [CoinModel]
    
    enum CodingKeys: String, CodingKey {
        case status, data
    }
}

class CoinDataService {
  
    @Published var allCoins: [CoinModel] = []
    
    var coinCancellable: AnyCancellable?
    
    init () {
        getCoins()
    }
    
    private func getCoins () {
        do {
            try NetworkManager.get(url: "cryptocurrency/listings/latest")
                .decode(type: GetCoinResponse.self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkManager.handleCompletionResponse, receiveValue: { [weak self] (returnedCoins) in
                    self?.allCoins = returnedCoins.data
                    self?.coinCancellable?.cancel()
                })
        } catch {
            print("[CoinDataService] func getCoins error: There is some thing wrong when get coins")
        }
        
    }
}
