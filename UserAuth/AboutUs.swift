//
//  AboutUs.swift
//  UserAuth
//
//  Created by bryson evans on 7/29/25.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
        ZStack {
           

            ScrollView {
                VStack(spacing: 40) {
                    // 📘 About Bbiond
                    VStack(spacing: 16) {
                        Text("Bbiond")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(radius: 4)

                        Text("At Bbiond, we help people on their mental health journey by connecting them with the right therapist. Our goal is to offer personalized, accessible, and affordable therapy to support healing and personal growth.")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 10)

                    // 👤 About Owner
                    VStack(spacing: 16) {
                        Text("About the Owner")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(radius: 4)

                        Text("My name is Bryson Evans. I created this app so people could feel like they matter. I used to think that I was a nobody until I found a mentor that brought me through hard times.")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 10)

                    // 📞 Contact Section
                    VStack(spacing: 10) {
                        Text("Contact Us")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(radius: 4)

                        Text("Email: BiondUs@gmail.com")
                        Text("Phone: (313) 789-3089")
                    }
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black.opacity(0.9))
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }
                .padding(.top, 60)
                .padding(.horizontal)
                .padding(.bottom, 100)
            }
        }
        .navigationTitle("About & Contact")
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    AboutUs()
    }


