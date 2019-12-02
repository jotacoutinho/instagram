//
//  TabBarCoordinator.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

protocol TabBarCoordinatorNavigationDelegate: AnyObject {
    func onClose(coordinator: Coordinator)
}

// If you dont have the coordinator protocol use the code snippet -> coordinatorprotocol
class TabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let presenter: UINavigationController
    private weak var navigationDelegate: TabBarCoordinatorNavigationDelegate?

    // MARK: Life Cycle
    init(presenter: UINavigationController, navigationDelegate: TabBarCoordinatorNavigationDelegate? = nil) {
        self.presenter = presenter
        self.navigationDelegate = navigationDelegate
    }

    // MARK: Functions
    func start() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let viewModel = TabBarViewModel(navigationDelegate: self)
            let viewController = TabBarViewController(viewModel: viewModel)
            self.presenter.viewControllers = [viewController]
        }
    }
}

extension TabBarCoordinator: TabBarViewModelNavigationDelegate {
    func goToHomeTab() -> UIViewController {
        let homeCoordinator = HomeCoordinator(presenter: presenter)
        add(childCoordinator: homeCoordinator)
        homeCoordinator.start()
        return homeCoordinator.getViewController()
    }
}
