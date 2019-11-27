//
//  Coordinator.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
    @discardableResult func add(childCoordinator: Coordinator) -> Coordinator
    @discardableResult func remove(childCoordinator: Coordinator) -> Coordinator
}

extension Coordinator {
    @discardableResult
    func add(childCoordinator: Coordinator) -> Coordinator {
        self.childCoordinators.append(childCoordinator)
        
        return childCoordinator
    }
    
    @discardableResult
    func remove(childCoordinator: Coordinator) -> Coordinator {
        self.childCoordinators.removeAll { $0 === childCoordinator }
        
        return childCoordinator
    }
}
