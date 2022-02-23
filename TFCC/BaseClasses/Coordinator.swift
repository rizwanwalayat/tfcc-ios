//
//  Coordinator.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 23/02/2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func welcomeScreen() {
//        let vc = LandingPageViewController()
//        vc.coordinator = self
//        navigationController.setViewControllers([vc], animated: true)
    }
    
    
    func signInScreen() {
//        let vc = LandingPageViewController()
//        vc.coordinator = self
//        navigationController.setViewControllers([vc], animated: true)
    }
}
