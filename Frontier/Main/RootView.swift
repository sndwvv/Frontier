//
//  RootView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/07.
//

import SwiftUI

struct RootView: View {
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled: Bool = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled: Bool = false
    
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
            SettingsView(
                darkModeEnabled: $darkModeEnabled,
                systemThemeEnabled: $systemThemeEnabled
            )
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
        .onAppear {
            ThemeManager
                .shared
                .handleTheme(
                    darkMode: darkModeEnabled,
                    system: systemThemeEnabled
                )
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView()
                .onAppear {
                    ThemeManager.shared.handleTheme(darkMode: false, system: false)
                }
            RootView()
                .preferredColorScheme(.dark)
        }
    }
}
