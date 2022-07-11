//
//  RootView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/07.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView()
            RootView()
                .preferredColorScheme(.dark)
        }
    }
}
