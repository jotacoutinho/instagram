//
//  TabBarViewModel.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarViewModelNavigationDelegate: AnyObject {
    func goToHomeTab() -> UIViewController
}

protocol TabBarViewModelProtocol: AnyObject {
    func goToHomeTab() -> UIViewController
}

class TabBarViewModel {
    private weak var navigationDelegate: TabBarViewModelNavigationDelegate?
    private var service: TabBarServiceProtocol

    init(navigationDelegate: TabBarViewModelNavigationDelegate? = nil, service: TabBarServiceProtocol = TabBarService()) {
        self.navigationDelegate = navigationDelegate
        self.service = service
    }
}

extension TabBarViewModel: TabBarViewModelProtocol {
    func goToHomeTab() -> UIViewController {
        return navigationDelegate?.goToHomeTab() ?? UIViewController()
    }
}
