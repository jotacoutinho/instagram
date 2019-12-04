//
//  CommentsSectionViewController.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 02/12/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

final class CommentsSectionViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.estimatedRowHeight = 100
            tableView.showsVerticalScrollIndicator = false
            tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "commentTableViewCell")
            tableView.backgroundColor = .primaryColor
            tableView.sectionHeaderHeight = UITableView.automaticDimension
            tableView.sectionFooterHeight = UITableView.automaticDimension
            tableView.estimatedSectionHeaderHeight = 100
        }
    }
    
    // MARK: Variables
    let viewModel: CommentsSectionViewModelProtocol

    // MARK: Life Cycle
    init(viewModel: CommentsSectionViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: CommentsSectionViewController.self), bundle: .main)
        self.view.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = CommentsSectionViewModel()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinds()
        configureKeyboardToolbarView()
    }

    // MARK: Functions
    private func setupBinds() {
        
    }
    
    func configureKeyboardToolbarView() {
        let keyboardToolbarView = KeyboardToolbarView()
        view.addSubview(keyboardToolbarView.contentView)
        
        keyboardToolbarView.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyboardToolbarView.contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardToolbarView.contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardToolbarView.contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewViewDataSource
extension CommentsSectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell", for: indexPath) as? CommentTableViewCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CommentsHeaderView(parentView: view)
        header.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.contentView.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            header.contentView.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            header.contentView.topAnchor.constraint(equalTo: header.topAnchor),
            header.contentView.bottomAnchor.constraint(equalTo: header.bottomAnchor)
        ])
        header.contentView.clipsToBounds = true
        return header
    }
}

// MARK: - UITableViewDelegate
extension CommentsSectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
