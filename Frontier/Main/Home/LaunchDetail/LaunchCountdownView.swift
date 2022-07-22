//
//  LaunchCountdownView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/19.
//

import SwiftUI

struct LaunchCountdownView: View {
    
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

// TODO: Create new file 
struct LaunchCountDown {
    var days: String = "00"
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
}

struct LaunchCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleDate = Date().advanced(by: 10).ISOFormattedString()
        LaunchCountdownView(service: LaunchCountDownService(launchDate: exampleDate))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
