//
//  CircleButtonWaveAnimation.swift
//  TrackingCryptoApp
//
//  Created by ad on 15/01/2024.
//

import SwiftUI

struct CircleButtonWaveAnimation: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0)
            .opacity(animate ? 0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none, value: animate)
    }
}

#Preview {
    
    Group {
        CircleButtonWaveAnimation(animate: .constant(false))
            .previewLayout(.sizeThatFits)
            .frame(width: 50, height: 50)
            .foregroundStyle(Color.accentColor)
    }
}
