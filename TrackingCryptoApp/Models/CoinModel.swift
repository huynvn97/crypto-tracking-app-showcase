//
//  CoinModel.swift
//  TrackingCryptoApp
//
//  Created by ad on 15/01/2024.
//

import Foundation

let API_KEY = "9f5456a2-791a-4681-8cbd-34513cbffbe5"

struct CoinModel: Identifiable, Codable {
    let id: Int
    let name, symbol, slug: String
    let cmcRank: Int
    let numMarketPairs, circulatingSupply, totalSupply, maxSupply: Int
    let lastUpdated, dateAdded: String
    let quote: Quote
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case cmcRank = "cmc_rank"
        case numMarketPairs = "num_market_pairs"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case lastUpdated = "last_updated"
        case dateAdded = "date_added"
        case quote
    }
}


// MARK: - Quote
struct Quote: Codable {
    let USD: QuoteData
    let BTC: QuoteData
    
    enum CodingKeys: String, CodingKey {
        case USD = "USD"
        case BTC = "BTC"
    }
    
}
struct QuoteData: Codable {
    let price: Double
    let volume24H: Int?
    let percentChange1H, percentChange24H, percentChange7D: Double?
    let marketCap: Double?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case marketCap = "market_cap"
        case lastUpdated = "last_updated"
    }
}

