//
//  AppDelegate.swift
//  PSUIKIT
//
//  Created by Jedidiaz Fagundez on 18/06/24.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: - Variables
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Setup
        setupNavigationController()
        return true
    }
    
    //MARK: - Private methods
    private func setupNavigationController () {
        window = UIWindow(frame: UIScreen.main.bounds)
        let kNavigationController = UINavigationController(rootViewController: SearchViewController())
        window?.rootViewController = kNavigationController
        window?.makeKeyAndVisible()
    }


}

