//
//  FeedCellView.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 28/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

class FeedCellView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerView: UIView! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
           
        }
    }
       
    
    @IBOutlet weak var commandsView: UIView! {
        didSet {
            
        }
    }
       
    
    @IBOutlet weak var likesView: UIView! {
        didSet {
            likesView.backgroundColor = .clear
        }
    }
       
    
    @IBOutlet weak var descriptionView: UIView! {
        didSet {
               
        }
    }
       
    
    @IBOutlet weak var commentView: UIView! {
        didSet {
            commentView.backgroundColor = .clear
        }
    }
    
    // MARK: - Header View
    @IBOutlet weak var headerUserPictureView: UIView!
    
    @IBOutlet weak var headerUserImageView: UIImageView! {
        didSet {
            headerUserImageView.image = UIImage(named: "jota")
            headerUserImageView.layer.cornerRadius = headerUserImageView.frame.height/2
            headerUserImageView.contentMode = .scaleAspectFill
            headerUserImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var usernameLabel: UILabel! {
        didSet {
            usernameLabel.text = "jotacoutinho94"
            usernameLabel.font = UIFont.boldSystemFont(ofSize: 11)
            usernameLabel.textColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var locationLabel: UILabel! {
        didSet {
            locationLabel.text = "Rune Midgard"
            locationLabel.font = UIFont.systemFont(ofSize: 11)
            locationLabel.textColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var moreButton: UIButton! {
        didSet {
            moreButton.setTitle("", for: .normal)
            moreButton.setImage(UIImage(named: "moreButton"), for: .normal)
        }
    }
    
    // MARK: - Commands View
    @IBOutlet weak var likeButton: UIButton! {
        didSet {
            likeButton.setTitle("", for: .normal)
            likeButton.setImage(UIImage(named:"likeButton"), for: .normal)
        }
    }
    
    @IBOutlet weak var commentButton: UIButton! {
        didSet {
            commentButton.setTitle("", for: .normal)
            commentButton.setImage(UIImage(named:"commentButton"), for: .normal)
        }
    }
    
    @IBOutlet weak var messageButton: UIButton! {
        didSet {
            messageButton.setTitle("", for: .normal)
            messageButton.setImage(UIImage(named: "directButton"), for: .normal)
        }
    }
    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.setTitle("", for: .normal)
            saveButton.setImage(UIImage(named: "saveButton"), for: .normal)
        }
    }
    
    // MARK: - Likes View
    @IBOutlet weak var likesLabel: UILabel! {
        didSet {
            likesLabel.text = "Liked by you and others"
            likesLabel.textColor = .secondaryColor
        }
    }
    
    // MARK: - Description View
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = "jotacoutinho94 War of Emperium #ragnarok #rpg #gaming"
            descriptionLabel.textColor = .secondaryColor
        }
    }
    
    // MARK: - Comment View
    @IBOutlet weak var viewAllCommentsButton: UIButton! {
        didSet {
            viewAllCommentsButton.setTitle("View all comments", for: .normal)
            viewAllCommentsButton.tintColor = .lightGray
        }
    }
    
    @IBOutlet weak var commentUserPictureView: UIView!
    
    @IBOutlet weak var commentUserImageView: UIImageView! {
        didSet {
            commentUserImageView.image = UIImage(named: "jota")
            commentUserImageView.layer.cornerRadius = commentUserImageView.frame.height/2
            commentUserImageView.contentMode = .scaleAspectFill
            commentUserImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var addCommentButton: UIButton! {
        didSet {
            addCommentButton.setTitle("Add a comment...", for: .normal)
            addCommentButton.tintColor = .lightGray
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.text = "28 de novembro"
            dateLabel.font = UIFont.systemFont(ofSize: 8)
            dateLabel.textColor = .lightGray
        }
    }
    
    // MARK: - Life cycle
    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
    }
    
    // MARK: - Custom methods
}
