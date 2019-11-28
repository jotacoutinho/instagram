//
//  HomeViewController.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 28/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: IBOutlets
//    @IBOutlet weak var storiesCollectionView: UICollectionView! {
//        didSet {
//            let nib = UINib(nibName: "StoriesCollectionViewCell", bundle: nil)
//            storiesCollectionView?.register(nib, forCellWithReuseIdentifier: "storiesCollectionViewCell")
//            storiesCollectionView.dataSource = self
//            storiesCollectionView.delegate = self
//            let layout = UICollectionViewFlowLayout()
//            layout.itemSize = CGSize(width: 80, height: 104)
//            layout.minimumInteritemSpacing = 32
//            layout.scrollDirection = .vertical
//            storiesCollectionView.collectionViewLayout = layout
//            storiesCollectionView.showsHorizontalScrollIndicator = false
//        }
//    }
    
    @IBOutlet weak var feedStackView: UIStackView! {
        didSet {
            feedStackView.backgroundColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var feedTableView: UITableView! {
        didSet {
            
        }
    }
    
    // MARK: Variables
    let viewModel: HomeViewModelProtocol
    var storiesCollectionView: UICollectionView?

    // MARK: Life Cycle
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: HomeViewController.self), bundle: .main)
        self.view.backgroundColor = .primaryColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = HomeViewModel()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStoriesCollectionView()
        feedTableView.tableHeaderView = storiesCollectionView
//
//        if let feed = feedStackView.arrangedSubviews.first {
//           feedStackView.removeArrangedSubview(feed)
//        }
//        let feedCell = FeedCellView()
//        feedCell.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 500)
//        feedStackView.addArrangedSubview(feedCell)
//        storiesCollectionView.isScrollEnabled = false
        
        setupBinds()
    }

    // MARK: Functions
    private func setupBinds() {
        
    }
    
    private func configureStoriesCollectionView() {
        let nib = UINib(nibName: "StoriesCollectionViewCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 80, height: 104)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 32
        layout.scrollDirection = .horizontal
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 112)
        
        storiesCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        storiesCollectionView?.collectionViewLayout = layout
        storiesCollectionView?.showsHorizontalScrollIndicator = false
        storiesCollectionView?.register(nib, forCellWithReuseIdentifier: "storiesCollectionViewCell")
        
        storiesCollectionView?.dataSource = self
        storiesCollectionView?.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storiesCollectionViewCell", for: indexPath) as? StoriesCollectionViewCell
        //cell?.configure()
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
