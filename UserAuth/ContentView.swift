//
//  ContentView.swift
//  UserAuth
//
//  Created by bryson evans on 7/29/25.
//

import SwiftUI
import FirebaseAuth

struct BbiondApp: App {
    init() {
     
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

    

// MARK: - First Screen
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Bbiond")
                    .font(.system(size: 40, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.top, 100)
                
                Spacer()
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color.black)
                        .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                }
            }
            .padding()
        }
    }
         
    
    #Preview {
        ContentView()
    }

