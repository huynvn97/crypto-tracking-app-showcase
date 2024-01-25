//
//  Double.swift
//  TrackingCryptoApp
//
//  Created by ad on 17/01/2024.
//

import Foundation

extension Double {
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    func asCurrencyWithMax6Decimals () -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    func asNumberWithMax6Decimals () -> String {
        let number = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 6
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: number) ?? "0.00"
    }
    
    func asNumberWithMax2Decimals () -> String {
        let number = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: number) ?? "0.00"
    }
}
