//
//  SettingsView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            List {
                Toggle("Dark Mode", isOn: $isDarkMode)
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
