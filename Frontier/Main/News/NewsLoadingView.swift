//
//  NewsLoadingView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsLoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("📰")
                .font(.system(size: 40))
            ProgressView()
            Text("Fetching news...")
                .foregroundColor(.primary)
        }
    }
}

struct NewsLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        NewsLoadingView()
    }
}
