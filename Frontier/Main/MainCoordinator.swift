//
//  MainCoordinator.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    var childCoordinators = [Coordinator]()
    
    private var homeTabCoordinator = HomeTabCoordinator()
    private var newsTabCoordinator = NewsTabCoordinator()
    private var settingsTabCoordinator = SettingsTabCoordinator()
    
    init() {
        rootViewController = UITabBarController()
        start()
    }

    func start() {
        childCoordinators = [
            homeTabCoordinator,
            newsTabCoordinator,
            settingsTabCoordinator
        ]
        setup(vc: homeTabCoordinator.rootViewController, title: "Home", imageName: "house", selectedImageName: "house.fill")
        setup(vc: newsTabCoordinator.rootViewController, title: "News", imageName: "newspaper", selectedImageName: "newspaper.fill")
        setup(vc: settingsTabCoordinator.rootViewController, title: "Settings", imageName: "gearshape", selectedImageName: "gearshape.fill")
        
        rootViewController.viewControllers = [
            homeTabCoordinator.rootViewController,
            newsTabCoordinator.rootViewController,
            settingsTabCoordinator.rootViewController
        ]
    }

    private func setup(vc: UIViewController, title: String?, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
    
}
