//
//  AppDelegate.swift
//  Discover-Example
//
//  Created by Tanakorn Phoochaliaw on 13/5/2564 BE.
//

import UIKit
import Core
import Discover

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var discoverNavi: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // MARK: - Load font
        UIFont.loadAllFonts
        
        // MARK: - Setup View
        self.discoverNavi = UINavigationController(rootViewController: DiscoverOpener.open(.discover))
        self.discoverNavi?.navigationBar.isHidden = true
        
        let frame = UIScreen.main.bounds
        self.window = UIWindow(frame: frame)
        self.window!.rootViewController = self.discoverNavi
        self.window!.makeKeyAndVisible()
        
        return true
    }

}

