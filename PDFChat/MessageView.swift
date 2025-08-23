//
//  MessageView.swift
//  SkinRashID
//
//  Created by Muhammad Shayan Zahid on 11/05/2025.
//

import SwiftUI

struct MessageView : View {
    var currentMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if !currentMessage.isUser {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            
            MessageCell(currentMessage: currentMessage)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MessageView(currentMessage: Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.", role: .assistant, type: .plain))
}
