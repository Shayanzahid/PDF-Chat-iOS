//
//  TypingIndicatorView.swift
//  SkinRashID
//
//  Created by Muhammad Shayan Zahid on 11/05/2025.
//

import SwiftUI

struct TypingIndicatorView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var shouldAnimate = false
    
    let animationDelay: Double = 0.2

    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<3) { index in
                Circle()
                    .frame(width: 12, height: 12)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .scaleEffect(shouldAnimate ? 1 : 0.5)
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatForever(autoreverses: true)
                            .delay(animationDelay * Double(index)),
                        value: shouldAnimate
                    )
            }
        }
        .onAppear {
            shouldAnimate = true
        }
    }
}
