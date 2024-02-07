//
//  AppDelegate.swift
//  watchList
//
//  Created by Buket girenay on 24.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let vc = CustomTabBar(nibName: "CustomTabBar", bundle: nil)
        let navBar = UINavigationController(rootViewController: vc)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navBar
        window?.makeKeyAndVisible()
        return true
    }
}

