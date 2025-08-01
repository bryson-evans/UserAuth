//
//  TherapistProfileView.swift
//  UserAuth
//
//  Created by bryson evans on 7/30/25.
//
import SwiftUI

struct PrView: View {
    // Sample user data (replace with your user model or Firebase data)
    let userName = "Bryson Evans"
    let email = "bryson.evans@example.com"
    let profileImageName = "profile" // Make sure this image exists in Assets

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Profile Image
                    Image(profileImageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top)

                    // Name & Email
                    Text(userName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Divider().padding(.vertical)

                    // Account Info Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Account Settings")
                            .font(.headline)

                        HStack {
                            Label("Edit Profile", systemImage: "person.circle")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Label("Notifications", systemImage: "bell")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Label("Privacy", systemImage: "lock.shield")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .padding(.horizontal)

                    // Log out Button
                    Button(action: {
                        // Add FirebaseAuth logout logic here
                    }) {
                        Text("Log Out")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("My Profile")
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}
#Preview {
    PrView()
}
