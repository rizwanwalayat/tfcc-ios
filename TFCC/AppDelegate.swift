//
//  AppDelegate.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navController = UINavigationController()

           coordinator = MainCoordinator(navigationController: navController)

            if DataManager.shared.getUser() ?? false {
                coordinator?.signInScreen()
            }
            else {
                coordinator?.welcomeScreen()
            }
            
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.rootViewController = navController
           window?.makeKeyAndVisible()

        return true
    }
}

