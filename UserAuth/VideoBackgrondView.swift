//
//  VideoBackgrondView.swift
//  UserAuth
//
//  Created by bryson evans on 7/30/25.
//

import UIKit
import AVFoundation
import SwiftUI

struct VideoBackgrondView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> VideoPlayerViewController {
        VideoPlayerViewController()
    }

    func updateUIViewController(_ uiViewController: VideoPlayerViewController, context: Context) {}
}
class VideoPlayerViewController: UIViewController {
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }

    func setupVideoPlayer() {
        guard let url = Bundle.main.url(forResource: "background", withExtension: "mov") else {
            print("⚠️ Video file not found")
            return
        }

        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player.isMuted = true // 🔇 Mute the video
        player.actionAtItemEnd = .none // Prevent stopping at end

        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)

        // 🔁 Loop the video when it ends
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loopVideo),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )

        player.play()
    }

    @objc func loopVideo(notification: Notification) {
        player.seek(to: .zero)
        player.play()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = view.bounds
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
#Preview {
    VideoBackgrondView()
}
