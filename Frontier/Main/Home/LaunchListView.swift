//
//  LaunchListView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/27.
//

import SwiftUI

struct LaunchListView: View {
    
    let launches: [Launch]
    
    var body: some View {
        TabView {
            ForEach(launches) { launch in
                NavigationLink {
                    LaunchDetailView(launch: launch)
                } label: {
                    LaunchView(launch: launch)
                        .padding(.bottom, 24)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.mainBackground)
    }
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView(launches: [Launch.example(), Launch.example()])
            .previewInterfaceOrientation(.portrait)
    }
}
