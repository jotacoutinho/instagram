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
    @IBOutlet weak var feedStackView: UIStackView! {
        didSet {
            feedStackView.backgroundColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var feedTableView: UITableView! {
        didSet {
            feedTableView.delegate = self
            feedTableView.dataSource = self
            feedTableView.separatorStyle = .none
            feedTableView.estimatedRowHeight = 600
            feedTableView.showsVerticalScrollIndicator = false
            feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedTableViewCell")
            feedTableView.backgroundColor = .primaryColor
        }
    }
    
    @IBOutlet weak var savedView: UIView! {
        didSet {
            savedView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var savedImageTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var savedImageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var savedImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var savedImageBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var savedImageView: UIImageView! {
        didSet {
            savedImageView.contentMode = .scaleAspectFill
            savedImageView.backgroundColor = .clear
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
        configureFeedTableViewHeader()

        setupBinds()
    }

    // MARK: Functions
    private func setupBinds() {
        
    }
    
    func configureFeedTableViewHeader() {
        feedTableView.tableHeaderView = storiesCollectionView
        
        let separatorView = UIView()
        guard let collection = storiesCollectionView else { return }
        collection.addSubview(separatorView)
        separatorView.frame = CGRect(x: collection.frame.minX, y: collection.frame.maxY, width: collection.frame.width, height: 1)
        separatorView.backgroundColor = .lightGray
    }
    
    private func configureStoriesCollectionView() {
        let nib = UINib(nibName: "StoriesCollectionViewCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 64, height: 88)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 32
        layout.scrollDirection = .horizontal
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 96)
        
        storiesCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        storiesCollectionView?.collectionViewLayout = layout
        storiesCollectionView?.showsHorizontalScrollIndicator = false
        storiesCollectionView?.register(nib, forCellWithReuseIdentifier: "storiesCollectionViewCell")
        storiesCollectionView?.backgroundColor = .primaryColor
        
        storiesCollectionView?.dataSource = self
        storiesCollectionView?.delegate = self
    }
}

// MARK: - UITableViewViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedTableViewCell", for: indexPath) as? FeedTableViewCell
        cell?.configure(delegate: self)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storiesCollectionViewCell", for: indexPath) as? StoriesCollectionViewCell
        cell?.configure(userCell: indexPath.item == 0)
        return cell ?? UICollectionViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension HomeViewController: HomeDelegate {
    func presentViewController(viewController: UIViewController, animated: Bool) {
        present(viewController, animated: true, completion: nil)
    }
    
    func showImageSavedAnimation(imageView: UIImageView) {
        savedImageView.image = imageView.image
        savedImageLeadingConstraint.constant = 0
        savedImageTrailingConstraint.constant = 0
        savedImageBottomConstraint.constant = 0
        savedImageTopConstraint.constant = 0
        savedImageView.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
                self.savedImageView.alpha = 0
            }, completion: { _ in
                self.savedImageView.isHidden = true
                self.savedImageView.alpha = 1
                self.savedImageLeadingConstraint.constant = self.savedView.frame.height/2
                self.savedImageTrailingConstraint.constant = self.savedView.frame.height/2
                self.savedImageBottomConstraint.constant = self.savedView.frame.height/2
                self.savedImageTopConstraint.constant = self.savedView.frame.height/2
            })
        })
    }
    
    func goToCommentsSection() {
        viewModel.goToCommentsSection()
    }
}
