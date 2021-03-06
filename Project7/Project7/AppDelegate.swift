//
//  AppDelegate.swift
//  Project7
//
//  Created by Alexander Filippov on 4.3.21..
//  Copyright © 2021 Alexander Filippov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Now this should be moved to SceneDelegate.swift
        /*
        if let tabBarContrroller = window?.rootViewController as? UITabBarController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =  storyboard.instantiateViewController(identifier: "NavController")
            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
            tabBarContrroller.viewControllers?.append(vc)
        }
        */
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

