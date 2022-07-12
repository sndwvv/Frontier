//
//  LaunchPadCardView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/28.
//

import SwiftUI

struct LaunchPadCardView: View {
    
    let pad: Pad
    
    var body: some View {
        VStack {
            Text("Pad")
                .frame(height: 20)
                .font(.footnote)
                .foregroundColor(Color.secondaryText)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            Text(pad.name ?? "")
                .font(.body)
                .foregroundColor(Color.primaryText)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.horizontal, 16)
            ImageLoadingView(url: pad.mapImage ?? "")
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .clipped()
        }
        .cardFormat()
    }
}

struct LaunchPadCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchPadCardView(pad: Launch.example().pad!)
                .previewLayout(.fixed(width: 375, height: 300))
            LaunchPadCardView(pad: Launch.example().pad!)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 300))
        }
    }
}
