//
//  SceneDelegate.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: scene)
            window.rootViewController = UIViewController()
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }

}

