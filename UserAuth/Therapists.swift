//
//  Therapists.swift
//  UserAuth
//
//  Created by bryson evans on 7/29/25.
//



// MARK: - Therapist Data Model
import SwiftUI

// MARK: - Therapist Model
struct Therapist: Identifiable {
    let id: Int
    let name: String
    let specialty: String
    let imageName: String
}

// MARK: - Therapist List View
struct TherapistsView: View {
    let therapists = [
        Therapist(id: 1, name: "Dr. Emma Reed", specialty: "Cognitive Therapy", imageName: "therapist0"),
        Therapist(id: 2, name: "Dr. Liam Scott", specialty: "Trauma & PTSD", imageName: "therapist1"),
        Therapist(id: 3, name: "Dr. Ava Brooks", specialty: "Relationships", imageName: "therapist2"),
        Therapist(id: 4, name: "Dr. Noah Kim", specialty: "Child & Family", imageName: "therapist3"),
        Therapist(id: 5, name: "Dr. Mia Patel", specialty: "Anxiety & Depression", imageName: "therapist4")
    ]

    var body: some View {
        NavigationStack {
            List(therapists) { therapist in
                NavigationLink(destination: TherapistProfile(therapist: therapist)) {
                    HStack(spacing: 16) {
                        Image(therapist.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .shadow(radius: 4)

                        VStack(alignment: .leading) {
                            Text(therapist.name)
                                .font(.headline)
                            Text(therapist.specialty)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Our Therapists")
        }
    }
}

// MARK: - Therapist Profile View
struct TherapistProfile: View {
    let therapist: Therapist

    var body: some View {
        VStack(spacing: 20) {
            Image(therapist.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .shadow(radius: 6)

            Text(therapist.name)
                .font(.title)
                .bold()

            Text(therapist.specialty)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("More info about this therapist will go here.")
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(therapist.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    TherapistsView()
}



