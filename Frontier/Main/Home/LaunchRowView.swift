//
//  LaunchRowView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/27.
//

import SwiftUI

struct LaunchRowView: View {
    
    let launch: Launch
    
    var body: some View {
        VStack {
            ImageLoadingView(url: launch.image)
                .frame(height: 200)       
                .clipped()
            Text("\(launch.name ?? "NA")")
                .font(.system(size: 20))
                .padding()
        }
    }
}

struct LaunchRowView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRowView(launch: Launch.example())
            .previewLayout(.fixed(width: 375, height: 300))
    }
}
