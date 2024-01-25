//
//  CircleButtonView.swift
//  TrackingCryptoApp
//
//  Created by ad on 15/01/2024.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    var body: some View {
       Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.accentColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
            )
            .shadow(
                color: .accentColor.opacity(0.25),
                radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0
            )
            .padding()
    }
}

#Preview {
    Group {
        CircleButtonView(iconName: "heart.fill")
            .previewLayout(.sizeThatFits)
            .colorScheme(.light)
        
        CircleButtonView(iconName: "heart.fill")
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
   
}
