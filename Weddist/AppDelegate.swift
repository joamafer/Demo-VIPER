//
//  AppDelegate.swift
//  Weddist
//
//  Created by Jose Martinez on 16/04/2018.
//  Copyright © 2018 Jose Martinez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let window = window else {
            return false
        }

        let listWireframe = ListWireframe.makeWireframe()
        listWireframe.present(window: window)
        
        return true
    }
//    
//    private func findListViewController() -> ListViewController? {
//        guard let rootViewController = window?.rootViewController as? UINavigationController else {
//            return nil
//        }
//        
//        guard rootViewController.viewControllers.count == 1,
//            let listViewController = rootViewController.topViewController as? ListViewController else {
//                return nil
//        }
//        
//        return listViewController
//    }


}

