//
//  ImageView.swift
//  TrackingCryptoApp
//
//  Created by ad on 25/01/2024.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject var vm = CoinImageViewModel(coin: DevPreviewData.instance.coin)
    
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.secondary)
            }
        }
    }
}

#Preview {
    CoinImageView().padding().previewLayout(.sizeThatFits)
}
