//
//  LaunchCountdownView_V2.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/19.
//

import SwiftUI

struct LaunchCountdownView_V2: View {
    
    @StateObject var service: LaunchCountDownService
    
    var body: some View {
        HStack(spacing: 8) {
            LaunchCountdownTimeView(
                timeDigit: service.countDown.days,
                timeComponentName: "Days"
            )
            LaunchCountdownTimeView(
                timeDigit: service.countDown.hours,
                timeComponentName: "Hours"
            )
            LaunchCountdownTimeView(
                timeDigit: service.countDown.minutes,
                timeComponentName: "Minutes"
            )
            LaunchCountdownTimeView(
                timeDigit: service.countDown.seconds,
                timeComponentName: "Seconds"
            )
        }
        .onAppear {
            service.setTimer()
        }
        .onDisappear {
            service.invalidateTimer()
        }
    }

}


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

struct LaunchCountdownView_V2_Previews: PreviewProvider {
    static var previews: some View {
        let exampleNet = Date().advanced(by: 10)
        LaunchCountdownView(launchDate: exampleNet.ISO8601Format())
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
