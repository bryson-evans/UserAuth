import SwiftUI
import FirebaseAuth
import AVKit
import AVFoundation

struct ContactView: View {
    @State private var buttonsVisible = false

    var body: some View {
        NavigationStack {
            ZStack {
                // 🌅 Sunrise background video
                VideoBackgrondView()
                                   .edgesIgnoringSafeArea(.all)

                // 🌄 Gradient overlay (mimics early light glow)
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0.3), .clear, .black.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Spacer().frame(height: 60)

                    // ✨ Inspiring title
                    Text("Welcome to Bbiond")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .transition(.opacity.combined(with: .scale))
                        .padding(.bottom, 10)

                    Text("Discover your path to healing with trusted therapists.")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .transition(.opacity)

                    // 👥 Therapist profiles
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<5) { index in
                                NavigationLink(destination: TherapistsView()) {
                                    VStack(spacing: 10) {
                                        Image("therapist\(index)")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                            .shadow(radius: 5)

                                        Text("Therapist \(index + 1)")
                                            .font(.subheadline)
                                            .foregroundColor(.primary)
                                    }
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .scaleEffect(buttonsVisible ? 1 : 0.9)
                                    .opacity(buttonsVisible ? 1 : 0)
                                    .animation(.easeOut.delay(Double(index) * 0.1), value: buttonsVisible)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()

                    // 📩 Encouraging message
                    NavigationLink(destination: MessagesView()) {
                        Text("Hello, did you book an appointment today?")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                    }
                    .opacity(buttonsVisible ? 1 : 0)
                    .offset(y: buttonsVisible ? 0 : 20)
                    .animation(.easeOut(duration: 0.5).delay(0.5), value: buttonsVisible)

                    Spacer()

                    // 🔘 Icon Navigation
                    HStack(spacing: 24) {
                        navIcon("phone.fill", destination: AboutUs())
                        navIcon("message.fill", destination: TherapistsView())
                        navIcon("person.fill", destination: PrView())
                        navIcon("star.fill", destination: Subscriptions())
                    }
                    .padding(.bottom, 30)
                    .opacity(buttonsVisible ? 1 : 0)
                    .animation(.easeOut.delay(0.6), value: buttonsVisible)
                }
                .padding(.top)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .onAppear {
                withAnimation {
                    buttonsVisible = true
                }
            }
        }
    }

    // MARK: - Reusable navIcon helper
    private func navIcon<Destination: View>(_ systemImage: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: systemImage)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
    
    
    #Preview {
        ContactView()
    }
    

