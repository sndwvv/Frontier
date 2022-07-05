//
//  HomeTabCoordinator.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import UIKit
import SwiftUI

class HomeTabCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        start()
    }
    
    func start() {
        rootViewController.setViewControllers([UIHostingController(rootView: HomeView())], animated: false)
    }
    
}
