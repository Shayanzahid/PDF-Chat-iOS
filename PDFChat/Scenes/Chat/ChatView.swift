//
//  ChatView.swift
//  SkinRashID
//
//  Created by Muhammad Shayan Zahid on 11/05/2025.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject private var networkManager: NetworkManager
    @State private var messages = [Message]()
    @State private var newMessage = ""
    
    let documentName: String
    
    var body: some View {
        VStack {
            messagesScrollView
            sendMessageField
        }
        .onAppear {
            messages = [Message(content: "Hey! Ask me anything about your PDF: \(documentName)", role: .assistant, type: .plain)]
        }
    }
    
    private var messagesScrollView: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    Color.clear
                        .frame(height: 10)
                    
                    LazyVStack {
                        ForEach(messages) { message in
                            MessageView(currentMessage: message)
                                .id(message)
                        }
                        .padding(.horizontal)
                    }
                    .onChange(of: messages) { _, updatedMessages in
                        scrollToBottom(proxy)
                    }
                }
            }
        }
    }
    
    private var sendMessageField: some View {
        HStack {
            TextField("Start typing...", text: $newMessage)
            
            Button("Send") {
                if !newMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    sendMessage(withText: newMessage)
                    newMessage.removeAll()
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
    
    private func sendMessage(withText text: String) {
        messages.append(.init(content: text, role: .user, type: .plain))
        messages.append(.init(content: "", role: .assistant, type: .typing))
        
        Task {
            do {
                let result = try await networkManager.askQuestion(text)
                if let answer = result.answer {
                    messages.removeAll(where: { $0.type == .typing })
                    messages.append(.init(content: answer, role: .assistant, type: .plain))
                } else if let error = result.error {
                    print("Error:", error)
                }
            } catch {
                print("Request failed:", error)
            }
        }
    }
    
    private func scrollToBottom(_ proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo(messages.last, anchor: .bottom)
        }
    }
}

#Preview {
    ChatView(documentName: "The-constitution.pdf")
}
