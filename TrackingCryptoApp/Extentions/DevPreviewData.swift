//
//  DevPreview.swift
//  TrackingCryptoApp
//
//  Created by ad on 19/01/2024.
//

import Foundation
import SwiftUI

class DevPreviewData {
    
    static let instance = DevPreviewData()
    
    let coin = CoinModel(
        id: 1,
        name: "Bitcoin",
        symbol: "BTC",
        slug: "Bitcoin",
        cmcRank: 1,
        numMarketPairs: 500,
        circulatingSupply: 16950100,
        totalSupply: 16950100,
        maxSupply: 21000000,
        lastUpdated: "2018-06-02T22:51:28.209Z",
        dateAdded: "2013-04-28T00:00:00.000Z",
        quote: Quote(
            USD: QuoteData(price: 9283.92, volume24H: 7155680000, percentChange1H: -0.15277, percentChange24H: 0.518894, percentChange7D: 0.986573, marketCap: 158055024432, lastUpdated: "2018-08-09T22:53:32.000Z"),
            BTC: QuoteData(price: 9283.92, volume24H: 7155680000, percentChange1H: -0.15277, percentChange24H: 0.518894, percentChange7D: 0.986573, marketCap: 158055024432, lastUpdated: "2018-08-09T22:53:32.000Z")
        )
    )
    
    let homeVM = HomeViewModel()
    
    private init() {}
}

