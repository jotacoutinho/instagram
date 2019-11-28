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
    @IBOutlet weak var storiesCollectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: "StoriesCollectionViewCell", bundle: nil)
            storiesCollectionView?.register(nib, forCellWithReuseIdentifier: "storiesCollectionViewCell")
            storiesCollectionView.dataSource = self
            storiesCollectionView.delegate = self
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 80, height: 104)
            layout.minimumInteritemSpacing = 32
            layout.scrollDirection = .horizontal
            storiesCollectionView.collectionViewLayout = layout
            storiesCollectionView.showsHorizontalScrollIndicator = false
        }
    }
    
    @IBOutlet weak var feedStackView: UIStackView! {
           didSet {
               feedStackView.backgroundColor = .secondaryColor
           }
       }
    
    // MARK: Variables
    let viewModel: HomeViewModelProtocol

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
        
        setupBinds()
    }

    // MARK: Functions
    private func setupBinds() {
        
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
