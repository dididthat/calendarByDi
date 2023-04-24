//
//  AppDelegate.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 20.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
 var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: CalendarViewController())
        window?.makeKeyAndVisible()

        return true
    }
}

