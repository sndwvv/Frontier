//
//  NewsTabCoordinator.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import UIKit
import SwiftUI

class NewsTabCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = false
        start()
    }
    
    func start() {
        rootViewController.setViewControllers([UIHostingController(rootView: NewsView())], animated: false)
    }
    
}
