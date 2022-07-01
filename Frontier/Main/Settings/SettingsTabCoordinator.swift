//
//  SettingsTabCoordinator.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/29.
//

import UIKit
import SwiftUI

class SettingsTabCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = false
        start()
    }
    
    func start() {
        rootViewController.setViewControllers([UIHostingController(rootView: SettingsView())], animated: false)
    }
    
}
