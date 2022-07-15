//
//  LaunchVideoView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/15.
//

import SwiftUI
import AVKit

struct LaunchVideoView: View {
    
    let vidURL: VidURL
    
    var body: some View {
        VStack {
            playerView
        }
    }
    
    @ViewBuilder private var playerView: some View {
        if let urlString = vidURL.url, let url = URL(string: urlString) {
            VideoPlayer(player: AVPlayer(url: url))
        }
    }
    
}

struct LaunchVideoView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchVideoView(vidURL: Launch.example().vidURLs!.first!)
    }
}
