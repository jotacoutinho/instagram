//
//  HomeViewModel.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 28/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewModelNavigationDelegate: AnyObject {
    func goToCommentsSection()
}

protocol HomeDelegate: AnyObject {
    func presentViewController(viewController: UIViewController, animated: Bool)
    func goToCommentsSection()
}

protocol HomeViewModelProtocol: AnyObject {
    func goToCommentsSection()
}

class HomeViewModel {
    private var service: HomeServiceProtocol
    private weak var navigationDelegate: HomeViewModelNavigationDelegate?

    init(navigationDelegate: HomeViewModelNavigationDelegate? = nil, service: HomeServiceProtocol = HomeService()) {
        self.navigationDelegate = navigationDelegate
        self.service = service
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func goToCommentsSection() {
        navigationDelegate?.goToCommentsSection()
    }
}
