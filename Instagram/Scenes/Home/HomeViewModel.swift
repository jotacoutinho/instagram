//
//  HomeViewModel.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 28/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
}

class HomeViewModel {
    private var service: HomeServiceProtocol

    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
}

extension HomeViewModel: HomeViewModelProtocol {}
