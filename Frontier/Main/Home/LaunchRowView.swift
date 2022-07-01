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
        
        
//        LazyVStack(alignment: .leading) {
//            ImageLoadingView(url: launch.image)
//                .frame(height: 200)
//                .clipped()
//            Text("\(launch.name ?? "NA")")
//                .font(.system(size: 20))
//                .frame(maxWidth: .infinity)
//                .multilineTextAlignment(.leading)
//                .fixedSize(horizontal: true, vertical: false)
//                .frame(width: 0, alignment: .leading)
//            Text(launch.status?.name ?? "Launch Status")
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity)
//                .fixedSize(horizontal: true, vertical: false)
//                .frame(width: 0, alignment: .leading)
//            Text(launch.status?.description ?? "Launch Description")
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity)
//                .fixedSize(horizontal: true, vertical: false)
//                .frame(width: 0, alignment: .leading)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LaunchRowView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRowView(launch: Launch.example())
            .previewLayout(.fixed(width: 375, height: 300))
    }
}
