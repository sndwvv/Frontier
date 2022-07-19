//
//  LaunchCountdownView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import SwiftUI

struct LaunchCountDown {
    var days: String = "00"
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
}

struct LaunchCountdownView: View {
    
    let launchDate: String
    
    @State private var nowDate = Date()
    @State private var countDown = LaunchCountDown()
    @State private var timer: Timer?
    
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                Text(countDown.days)
                    .font(.largeTitle)
                    .foregroundColor(.primaryText)
                Text("Days")
                    .font(.footnote)
                    .foregroundColor(.secondaryText)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Text(countDown.hours)
                    .font(.largeTitle)
                    .foregroundColor(.primaryText)
                Text("Hours")
                    .font(.footnote)
                    .foregroundColor(.secondaryText)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Text(countDown.minutes)
                    .font(.largeTitle)
                    .foregroundColor(.primaryText)
                Text("Minutes")
                    .font(.footnote)
                    .foregroundColor(.secondaryText)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Text(countDown.seconds)
                    .font(.largeTitle)
                    .foregroundColor(.primaryText)
                Text("Seconds")
                    .font(.footnote)
                    .foregroundColor(.secondaryText)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            setCountDownTimer()
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func setCountDownTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            nowDate = Date()
            countDown = calculateCountDown(launchDate: launchDate)
        }
    }
    
    private func calculateCountDown(launchDate: String) -> LaunchCountDown {
        let dateFormatter = ISO8601DateFormatter()
        guard let netDate = dateFormatter.date(from: launchDate) else {
            print("date error")
            timer?.invalidate()
            timer = nil
            return LaunchCountDown()
        }
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: netDate)
        if nowDate >= netDate {
            print("date passed: \(netDate)")
            timer?.invalidate()
            timer = nil
            return LaunchCountDown()
        }
        return LaunchCountDown(
            days: String(components.day ?? 00),
            hours: String(components.hour ?? 00),
            minutes: String(components.minute ?? 00),
            seconds: String(components.second ?? 00)
        )
    }

}


struct LaunchCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleNet = Date().advanced(by: 10)
        LaunchCountdownView(launchDate: exampleNet.ISO8601Format())
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
