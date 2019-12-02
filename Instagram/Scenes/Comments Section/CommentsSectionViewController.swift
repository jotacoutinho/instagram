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
           }
       }
    
    // MARK: Variables
    let viewModel: CommentsSectionViewModelProtocol

    // MARK: Life Cycle
    init(viewModel: CommentsSectionViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: CommentsSectionViewController.self), bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = CommentsSectionViewModel()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableViewHeader()
        
        setupBinds()
    }

    // MARK: Functions
    private func setupBinds() {
        
    }
    
    private func configureTableViewHeader() {
        let header = CommentsHeaderView(parentView: view)
        view.addSubview(header)
        tableView.tableHeaderView = header
    }
}

// MARK: - UITableViewViewDataSource
extension CommentsSectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell", for: indexPath) as? CommentTableViewCell
//        cell?.configure(rootVC: self)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension CommentsSectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
