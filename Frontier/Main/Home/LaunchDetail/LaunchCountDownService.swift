//
//  LaunchCountDownService.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/19.
//

import Foundation

class LaunchCountDownService: ObservableObject {
    
    let launchDate: String
    
    init(launchDate: String) {
        self.launchDate = launchDate
    }
    
    @Published var countDown = LaunchCountDown()
    @Published var timer: Timer?
    
    private var nowDate = Date()
    
    func setTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.nowDate = Date()
                self.countDown = self.createCountDown(launchDate: self.launchDate)
            }
        }
    }
    
    func createCountDown(launchDate: String) -> LaunchCountDown {
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
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil 
    }
    
}
