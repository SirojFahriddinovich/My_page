//
//  AppDelegate.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let tabbar = Tabbar()
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
        return true
    }

}

