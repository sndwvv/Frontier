//
//  ApplicationCoordinator.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        goToMain()
    }
    
    // MARK: Navigation
    
    private func goToMain() {
        let mainCoordinator = MainCoordinator()
        childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
    
    private func goToOnboarding() {
        // 
    }
    
}
