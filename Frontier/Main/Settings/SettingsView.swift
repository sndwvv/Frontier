//
//  SettingsView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool

    var body: some View {
        NavigationView {
            Form {
                displaySection
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
    
    private var displaySection: some View {
        Section(
            header: Text("Display"),
            footer: Text("System settings will override Dark Mode and use the current device theme")) {
                Toggle(isOn: $darkModeEnabled) {
                    Text("Dark Mode")
                }
                .onChange(of: darkModeEnabled) { _ in
                    toggleSystemTheme()
                }
                Toggle(isOn: $systemThemeEnabled) {
                    Text("System Theme Enabled")
                }
                .onChange(of: systemThemeEnabled) { newValue in
                    toggleSystemTheme()
                }
            }
    }
    
    private func toggleSystemTheme() {
        ThemeManager
            .shared
            .handleTheme(
                darkMode: darkModeEnabled,
                system: systemThemeEnabled
            )
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            darkModeEnabled: .constant(false),
            systemThemeEnabled: .constant(false)
        )
    }
}
