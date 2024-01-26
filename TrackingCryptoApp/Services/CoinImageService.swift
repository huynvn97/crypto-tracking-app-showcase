//
//  CoinImageService.swift
//  TrackingCryptoApp
//
//  Created by ad on 25/01/2024.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
    @Published var image: UIImage? = nil
    var coinImageSubscription: AnyCancellable?
    
    init(urlString: String) {
        getCoinImage(urlString: urlString)
    }
    
    private func getCoinImage(urlString: String) {
        do {
            coinImageSubscription = try NetworkManager.downloadFile(urlString: urlString)
                .tryMap({
                    (data) -> UIImage? in
                    return UIImage(data: data)
                    
                })
                .sink(
                    receiveCompletion: NetworkManager.handleCompletionResponse,
                    receiveValue: {
                        [weak self] (returnedImage) in
                        self?.image = returnedImage
                        self?.coinImageSubscription?.cancel()
                    }
                )
        } catch {
            // handle error
        }
    }
        
        
}
