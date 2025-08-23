//
//  MessageCell.swift
//  SkinRashID
//
//  Created by Muhammad Shayan Zahid on 11/05/2025.
//

import SwiftUI

struct MessageCell: View {
    @Environment(\.colorScheme) var colorScheme
    
    var currentMessage: Message
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if currentMessage.type == .typing {
                TypingIndicatorView()
            } else {
                Text(currentMessage.content)
                    .foregroundStyle(currentMessage.isUser ? .userBubbleText : .assistantBubbleText)
            }
        }
        .padding()
        .background(currentMessage.isUser ? .userBubble : .assistantBubble)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    var aiForegroundColor: Color {
        var color = Color.white
        if !currentMessage.isUser {
            color = colorScheme == .dark ? .white : .black
        }
        
        return color
    }
}

#Preview {
    MessageCell(currentMessage: Message.mockMessages[0])
}
