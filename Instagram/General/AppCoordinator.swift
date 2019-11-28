//
//  AppCoordinator.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Variables
    let window: UIWindow
    var childCoordinators: [Coordinator] = []
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    // MARK: - Life Cycle
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
    }
    
    // MARK: - Custom methods
    func start() {
        let viewModel = LaunchScreenViewModel(navigationDelegate: self)
        let launchScreenViewController = LaunchScreenViewController(viewModel: viewModel)
        navigationController.pushViewController(launchScreenViewController, animated: false)
        navigationController.navigationBar.isHidden = true
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: LaunchScreenNavigationDelegate {
   func goToTabBarScene() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.navigationController.navigationBar.tintColor = .secondaryColor
            self.navigationController.navigationBar.barStyle = .black
            self.navigationController.navigationBar.isHidden = false
            let coordinator = TabBarCoordinator(presenter: self.navigationController)
            self.add(childCoordinator: coordinator)
            coordinator.start()
        }
    }
}
