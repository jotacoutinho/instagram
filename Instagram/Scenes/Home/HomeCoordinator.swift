//
//  HomeCoordinator.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 02/12/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

protocol HomeCoordinatorNavigationDelegate: AnyObject {
    func onClose(coordinator: Coordinator)
}

// If you dont have the coordinator protocol use the code snippet -> coordinatorprotocol
class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let presenter: UINavigationController
    private weak var navigationDelegate: HomeCoordinatorNavigationDelegate?
    private var viewController: UIViewController

    // MARK: Life Cycle
    init(presenter: UINavigationController, navigationDelegate: HomeCoordinatorNavigationDelegate? = nil) {
        self.presenter = presenter
        self.navigationDelegate = navigationDelegate
        self.viewController = UIViewController()
    }

    // MARK: Functions
    func start() {
        let viewModel = HomeViewModel(navigationDelegate: self, service: HomeService())
        viewController = HomeViewController(viewModel: viewModel)
    }
    
    func getViewController() -> UIViewController {
        return viewController
    }
}

extension HomeCoordinator: HomeViewModelNavigationDelegate {
    func goToCommentsSection() {
        DispatchQueue.main.async {            
            let viewModel = CommentsSectionViewModel()
            let viewController = CommentsSectionViewController(viewModel: viewModel)
            self.presenter.pushViewController(viewController, animated: true)
        }
    }
}
