//
//  LoadingOverlayView.swift
//  PDFChat
//
//  Created by Muhammad Shayan Zahid on 22/08/2025.
//

import SwiftUI

struct LoadingOverlay: View {
    var message: String = "Processing..."
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4) // Dimmed background
            
            VStack(spacing: 16) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
                
                Text(message)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding(40)
            .background(Color.black.opacity(0.7))
            .cornerRadius(16)
            .shadow(radius: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

