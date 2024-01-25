//
//  HomeViewModel.swift
//  TrackingCryptoApp
//
//  Created by ad on 15/01/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init (){
        addSubscribe()
    }
    
    func addSubscribe() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
        }
            .store(in: &cancellables)
    }
}
