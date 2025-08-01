//
//  MessagesView.swift
//  UserAuth
//
//  Created by bryson evans on 7/30/25.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isFromUser: Bool
}

struct MessagesView: View {
    @State private var messages: [Message] = [
        Message(text: "Hello did you book an appointment today?", isFromUser: false),
       
    ]
    
    @State private var newMessage: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 50/255)
                .ignoresSafeArea()
            
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(messages) { message in
                                HStack {
                                    if message.isFromUser {
                                        Spacer()
                                        Text(message.text)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .cornerRadius(12)
                                            .frame(maxWidth: 250, alignment: .trailing)
                                    } else {
                                        Text(message.text)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.gray.opacity(0.4))
                                            .cornerRadius(12)
                                            .frame(maxWidth: 250, alignment: .leading)
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top)
                        .onChange(of: messages.count) { _ in
                            withAnimation {
                                proxy.scrollTo(messages.last?.id, anchor: .bottom)
                            }
                        }
                    }
                }
                
                Divider().background(Color.white.opacity(0.3))

                // Input area
                HStack(spacing: 12) {
                    TextField("Type a message...", text: $newMessage)
                        .padding(12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                    Button(action: sendMessage) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                            .padding(10)
                    }
                }
                .padding()
                .background(Color(red: 25/255, green: 25/255, blue: 40/255))
            }
        }
        .navigationTitle("Messages")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func sendMessage() {
        let trimmed = newMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        messages.append(Message(text: trimmed, isFromUser: true))
        newMessage = ""
        
        // Simulate bot response (for now)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages.append(Message(text: "Thanks for reaching out. A therapist will connect with you soon.", isFromUser: false))
        }
    }
}
#Preview {
    MessagesView()
}
