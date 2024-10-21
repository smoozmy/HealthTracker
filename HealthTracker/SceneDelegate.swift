//
//  SceneDelegate.swift
//  HealthTracker
//
//  Created by Александр Крапивин on 19.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let nutritionVC = NutritionViewController()
        let profileVC = ProfileViewController()
        let sportVC = SportViewController()
        
        nutritionVC.tabBarItem = UITabBarItem(title: "Питание", image: UIImage(systemName: "leaf"), tag: 0)
        sportVC.tabBarItem = UITabBarItem(title: "Спорт", image: UIImage(systemName: "dumbbell"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 2)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [nutritionVC, sportVC, profileVC]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }



}

