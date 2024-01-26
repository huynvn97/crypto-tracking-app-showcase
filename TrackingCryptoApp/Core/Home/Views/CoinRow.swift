//
//  CoinRow.swift
//  TrackingCryptoApp
//
//  Created by ad on 17/01/2024.
//

import SwiftUI

struct CoinRow: View {
    let coin: CoinModel
    let quoteUSD: QuoteData
    let priceUSD: Double
    let lastChange24h: Double
    let lastChangeInUSD: Double
    @Binding var showHoldingColumns: Bool
    
    init(coin: CoinModel, showHoldingColumns: Binding<Bool>) {
        self.coin = coin
        self.quoteUSD = coin.quote.USD
        self.priceUSD = coin.quote.USD.price
        self.lastChange24h = coin.quote.USD.percentChange24H ?? 0.00
        self.lastChangeInUSD = self.lastChange24h * 100
        self._showHoldingColumns = showHoldingColumns
    }
    
    var body: some View {
        HStack {
           
            CoinImageView().frame(width: 30, height: 30)
           
            Text(coin.symbol).fontWeight(.bold).font(.headline)
            Spacer()
            
            if (showHoldingColumns) {
                VStack (alignment: .trailing) {
                    Text("\((priceUSD).asNumberWithMax6Decimals())").font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary
                        )
                    Text("$74.183123123")
                        .font(.body)
                        .fontWeight(.none)
                        .foregroundStyle(.secondary)
                }
                
                
                Spacer()
            }
            
            
            VStack (alignment: .trailing) {
                Text("$\(lastChangeInUSD.asNumberWithMax2Decimals())")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        lastChange24h >= 0 ? .green : .red
                    )
                Text("\(lastChange24h.asNumberWithMax2Decimals())%")
                    .font(.body)
                    .fontWeight(.none)
                    .foregroundStyle(
                        lastChange24h >= 0 ? .green : .red
                    )
            }
        }
        .backgroundStyle(.background)
    }
}

#Preview (traits: .sizeThatFitsLayout) {
    Group {
        CoinRow(coin: DevPreviewData.instance.coin, showHoldingColumns: .constant(true))
        CoinRow(coin: DevPreviewData.instance.coin, showHoldingColumns: .constant(false))
    }.padding(.horizontal, 15)
}

#Preview (traits: .sizeThatFitsLayout) {
    Group {
        CoinRow(coin: DevPreviewData.instance.coin, showHoldingColumns: .constant(true))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        CoinRow(coin: DevPreviewData.instance.coin, showHoldingColumns: .constant(false))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }.padding(.horizontal, 15)
    
}
