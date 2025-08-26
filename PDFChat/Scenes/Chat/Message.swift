//
//  Message.swift
//  SkinRashID
//
//  Created by Muhammad Shayan Zahid on 11/05/2025.
//

import Foundation

enum ChatBubbleType: String, Codable {
    case plain
    case typing
}

enum ChatRole: String, Codable {
    case user
    case assistant
}

struct Message: Hashable, Identifiable, Codable {
    var id = UUID()
    var content: String
    var role: ChatRole
    var type: ChatBubbleType
    
    var isUser: Bool {
        role == .user
    }
    
    static let mockMessages = [
        Message(content: "Want to know more about your skin results or natural care tips? I'm here to help.", role: .assistant, type: .plain),
        Message(content: "It's itching all over my body. What's wrong?", role: .user, type: .plain)
    ]
}
