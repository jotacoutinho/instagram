//
//  LaunchScreenViewModel.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import Foundation

protocol LaunchScreenNavigationDelegate: AnyObject {
    func goToTabBarScene()
}

protocol LaunchScreenViewModelProtocol: AnyObject {
    func goToTabBarScene()
}

class LaunchScreenViewModel {
    // MARK: - Variables
    weak var navigationDelegate: LaunchScreenNavigationDelegate?
    
    // MARK: - Life Cycle
    init(navigationDelegate: LaunchScreenNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

// MARK: - LaunchViewModelProtocol
extension LaunchScreenViewModel: LaunchScreenViewModelProtocol {
    func goToTabBarScene() {
        navigationDelegate?.goToTabBarScene()
    }
}
