//
//  Subscriptions.swift
//  UserAuth
//
//  Created by bryson evans on 7/31/25.
//

import SwiftUI

struct Subscriptions: View {
    var body: some View {
        ZStack {
            // Background Color
            Color(red: 30/255, green: 30/255, blue: 50/255)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // Title
                Text("Subscription Plan")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 80)

                // Subscription Details Card
                VStack(spacing: 16) {
                    Text("$5")
                        .font(.system(size: 48, weight: .heavy))
                        .foregroundColor(.white)

                    Text("Billed every 2 months")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.85))

                    Divider().background(Color.white.opacity(0.3))

                    VStack(alignment: .leading, spacing: 8) {
                        Label("Unlimited therapist access", systemImage: "checkmark.circle.fill")
                        Label("Message support included", systemImage: "checkmark.circle.fill")
                        Label("Cancel anytime", systemImage: "checkmark.circle.fill")
                    }
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                    .padding(.top, 8)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(.horizontal)

                // Subscribe Button
                Button(action: {
                    // Handle subscription logic here
                }) {
                    Text("Subscribe Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Subscriptions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Subscriptions()
}
