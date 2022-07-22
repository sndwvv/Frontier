//
//  LaunchCountdownTimeView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/22.
//

import SwiftUI

struct LaunchCountdownTimeView: View {
    
    var timeDigit: String
    var timeComponentName: String
    
    var body: some View {
        VStack {
            Text(timeDigit)
                .font(.largeTitle)
                .foregroundColor(.primaryText)
            Text(timeComponentName)
                .font(.footnote)
                .foregroundColor(.secondaryText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct LaunchCountdownTimeView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchCountdownTimeView(timeDigit: "20", timeComponentName: "Seconds")
    }
}
