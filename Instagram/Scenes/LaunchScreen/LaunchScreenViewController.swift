//
//  LaunchScreenViewController.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var logoView: UIView!
    
    // MARK: - Variables
    private var viewModel: LaunchScreenViewModelProtocol
    
    // MARK: - Life Cycle
    init(viewModel: LaunchScreenViewModelProtocol = LaunchScreenViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = LaunchScreenViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.5, animations: {
            self.logoView.alpha = 0.0
        }) { _ in
            self.viewModel.goToTabBarScene()
        }
    }

}
