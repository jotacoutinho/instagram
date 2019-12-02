//
//  CommentsHeaderView.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 02/12/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

class CommentsHeaderView: UIView {
    
    @IBOutlet var contentView: UIView! {
        didSet {
            contentView.backgroundColor = .primaryColor
        }
    }
    
    @IBOutlet weak var borderView: UIView! {
        didSet {
            borderView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = UIImage(named: "jota")
            imageView.layer.cornerRadius = imageView.frame.height/2
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var usernameLabel: UILabel! {
        didSet {
            usernameLabel.text = "jotacoutinho94 War of Emperium yfguygj gv ghjvy ygy futyf utcytx #ragnarok #rpg #gaming"
            usernameLabel.font = UIFont.boldSystemFont(ofSize: 14)
            usernameLabel.textColor = .secondaryColor
            usernameLabel.numberOfLines = 0
            usernameLabel.lineBreakMode = .byWordWrapping
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.text = "november 29th"
            dateLabel.font = UIFont.systemFont(ofSize: 12)
            dateLabel.textColor = .lightGray
        }
    }
    
    private var parentView: UIView
    
    init(parentView: UIView) {
        self.parentView = parentView
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        self.parentView = UIView()
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(contentView)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard window != nil else { return }
//        configConstraints()
    }
    
    func configConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            topAnchor.constraint(equalTo: parentView.topAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        contentView.clipsToBounds = true
    }
}
