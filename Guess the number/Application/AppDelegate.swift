//
//  AppDelegate.swift
//  Guess the number
//
//  Created by Кирилл Раменский on 02.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? {
        didSet {
            window?.overrideUserInterfaceStyle = .light
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = StartAssembly.assemblyModule()
        window?.makeKeyAndVisible()
        
        return true
    }
}
