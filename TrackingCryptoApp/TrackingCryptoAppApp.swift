//
//  TrackingCryptoAppApp.swift
//  TrackingCryptoApp
//
//  Created by ad on 15/01/2024.
//

import SwiftUI
import SwiftData

@main
struct TrackingCryptoAppApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }.environmentObject(vm)
        }
        
    }
}
