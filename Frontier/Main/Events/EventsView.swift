//
//  EventsView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/18.
//

import SwiftUI

struct EventsView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("🛠")
                        .font(.system(size: 40))
                    Text("Under Construction")
                        .foregroundColor(.primaryText)
                }
            }
            .navigationTitle("Events")
        }
        .navigationViewStyle(.stack)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
