//
//  LaunchMissionCardView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/27.
//

import SwiftUI

struct LaunchMissionCardView: View {
    
    let mission: Mission
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(alignment: .bottom) {
                Text("Mission")
                    .frame(height: 20)
                    .font(.footnote)
                    .foregroundColor(Color.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.top, 8)
                TagView(text: mission.type ?? "", backgroundColor: .blue)
            }
                
            Text(mission.description ?? "")
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .lineSpacing(4)
                .font(.body)
                .foregroundColor(Color.primaryText)
                .padding(EdgeInsets(top: 4, leading: 0, bottom: 16, trailing: 0))
        }
        .padding(.horizontal, 16)
        .cardFormat()
    }
}

struct LaunchMissionCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchMissionCardView(mission: Launch.example().mission!)
                .previewLayout(.fixed(width: 375, height: 400))
            LaunchMissionCardView(mission: Launch.example().mission!)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 400))
        }
    }
}
