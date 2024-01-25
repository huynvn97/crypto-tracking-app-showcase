//
//  HomeView.swift
//  TrackingCryptoApp
//
//  Created by ad on 15/01/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            
            VStack {
                headerView
        
                HStack {
                    Text("Coin").font(.subheadline).foregroundStyle(.secondary)
                    Spacer()
                    if (showPortfolio) {
                        Text("Holdings").font(.subheadline).foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text("Price").font(.subheadline).foregroundStyle(.secondary)
                }.padding(.horizontal, 15)
                
                if (showPortfolio) {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                } else {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
              
                Spacer()
            }
        }
        .background(.background)
        .padding(.horizontal, 15)
    }
}

#Preview {

    HomeView().environmentObject(DevPreviewData.instance.homeVM)
}


extension HomeView {
    private var headerView: some View {
        HStack {
            // left content
            CircleButtonView(iconName: showPortfolio ? "plus": "info")
                .background {
                    CircleButtonWaveAnimation(animate: $showPortfolio)
                }
            
            Spacer()
            
            // center content
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.accentColor)
            
            Spacer()
            
            // right content
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation (.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
    }
    
    private var allCoinsList : some View {
        List {
            ForEach(vm.allCoins) {
                coin in
                CoinRow(coin: coin, showHoldingColumns: .constant(false))
            }
        }
        .listStyle(.plain)
        .padding(.horizontal, 0)
    }
    
    private var portfolioCoinsList : some View {
        List {
            ForEach(vm.allCoins) {
                coin in
                CoinRow(coin: coin, showHoldingColumns: .constant(true))
            }
        }
        .listStyle(.plain)
        .padding(.horizontal, 0)
    }
}
