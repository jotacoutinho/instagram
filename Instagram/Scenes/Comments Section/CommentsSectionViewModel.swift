//
//  CommentsSectionViewModel.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 02/12/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import Foundation

protocol CommentsSectionViewModelProtocol: AnyObject {
}

class CommentsSectionViewModel {
    private var service: CommentsSectionServiceProtocol

    init(service: CommentsSectionServiceProtocol = CommentsSectionService()) {
        self.service = service
    }
}

extension CommentsSectionViewModel: CommentsSectionViewModelProtocol {}
