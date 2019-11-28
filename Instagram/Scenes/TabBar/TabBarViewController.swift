//
//  TabBarViewController.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

final class TabBarViewController: UIViewController {
    
    enum Tabs: Int {
        case home = 0
        case search = 1
        case add = 2
        case activity = 3
        case profile = 4
    }

    // MARK: IBOutlets
    @IBOutlet weak var tabBar: UITabBar! {
        didSet {
            tabBar.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var homeBarItem: UITabBarItem! {
        didSet {
            homeBarItem.image = UIImage(named: "homeButton")?.withRenderingMode(.alwaysTemplate)
            homeBarItem.badgeColor = .red
            homeBarItem.tag = Tabs.home.rawValue
        }
    }
    
    @IBOutlet weak var searchBarItem: UITabBarItem! {
       didSet {
            searchBarItem.image = UIImage(named: "searchButton")?.withRenderingMode(.alwaysTemplate)
            searchBarItem.tag = Tabs.search.rawValue
       }
   }
    
    @IBOutlet weak var addBarItem: UITabBarItem! {
       didSet {
            addBarItem.image = UIImage(named: "addButton")?.withRenderingMode(.alwaysTemplate)
            addBarItem.tag = Tabs.add.rawValue
       }
   }
    
    @IBOutlet weak var activityBarItem: UITabBarItem! {
       didSet {
            activityBarItem.image = UIImage(named: "likeButton")?.withRenderingMode(.alwaysTemplate)
            activityBarItem.tag = Tabs.activity.rawValue
       }
   }
    
    @IBOutlet weak var profileBarItem: UITabBarItem! {
       didSet {
            profileBarItem.image = UIImage(named: "profileButton")?.withRenderingMode(.alwaysTemplate)
            profileBarItem.tag = Tabs.profile.rawValue
       }
    }
    
    // MARK: Variables
    let viewModel: TabBarViewModelProtocol

    // MARK: Life Cycle
    init(viewModel: TabBarViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: TabBarViewController.self), bundle: .main)
        self.view.backgroundColor = .primaryColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = TabBarViewModel()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items?.first
        setupBinds()
    }

    // MARK: Functions
    private func setupBinds() {
        
    }
    
    private func configureNavigationBar() {
        let directButton = UIBarButtonItem(image: UIImage(named: "directButton"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(didTapDirectButton))
        
        let igtvButton = UIBarButtonItem(image: UIImage(named: "igtvButton"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapIGTVButton))
        
        let cameraButton = UIBarButtonItem(image: UIImage(named: "cameraButton"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(didTapCameraButton))
        
        let titleImage = UIImage(named: "instagramTextLogo")
        let titleImageView = UIImageView(image: titleImage)
        
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleImageView.heightAnchor.constraint(equalToConstant: 40),
            titleImageView.widthAnchor.constraint(equalToConstant: 80)
        ])

        navigationItem.titleView = titleImageView
        navigationItem.leftBarButtonItem = cameraButton
        navigationItem.rightBarButtonItems = [directButton, igtvButton]
    }
    
    @objc func didTapDirectButton() {
        
    }
    
    @objc func didTapIGTVButton() {
        
    }
    
    @objc func didTapCameraButton() {
        
    }
}

extension TabBarViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        var viewController = UIViewController()
        let tab = Tabs(rawValue: item.tag)
        
        switch tab {
        case .home:
            viewController = HomeViewController(viewModel: HomeViewModel())
            viewController.view.frame = containerView.bounds
//        case .search:
//        case .add:
//        case .activity:
//        case .profile:
        default:
            viewController.view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                          green: CGFloat.random(in: 0...1),
                                                          blue: CGFloat.random(in: 0...1),
                                                          alpha: 1)
        }
        
        containerView.addSubview(viewController.view)
        addChild(viewController)
        viewController.didMove(toParent: self)
        viewController.view.frame = containerView.bounds
    }
}
