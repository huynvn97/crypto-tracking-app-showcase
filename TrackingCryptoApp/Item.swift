//
//  Item.swift
//  TrackingCryptoApp
//
//  Created by ad on 15/01/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
