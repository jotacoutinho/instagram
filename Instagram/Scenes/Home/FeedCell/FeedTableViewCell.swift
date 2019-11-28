//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 28/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerView: UIView! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var postImageView: UIImageView!
    
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
            usernameLabel.font = UIFont.boldSystemFont(ofSize: 14)
            usernameLabel.textColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var locationLabel: UILabel! {
        didSet {
            locationLabel.text = "Rune Midgard"
            locationLabel.font = UIFont.systemFont(ofSize: 14)
            locationLabel.textColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var moreButton: UIButton! {
        didSet {
            moreButton.setTitle("", for: .normal)
            moreButton.setImage(UIImage(named: "moreButton"), for: .normal)
            moreButton.tintColor = .secondaryColor
        }
    }
    
    // MARK: - Commands View
    @IBOutlet weak var likeButton: UIButton! {
        didSet {
            likeButton.setTitle("", for: .normal)
            likeButton.setImage(UIImage(named: "likeButton"), for: .normal)
            likeButton.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var commentButton: UIButton! {
        didSet {
            commentButton.setTitle("", for: .normal)
            commentButton.setImage(UIImage(named: "commentButton"), for: .normal)
            commentButton.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var messageButton: UIButton! {
        didSet {
            messageButton.setTitle("", for: .normal)
            messageButton.setImage(UIImage(named: "directButton"), for: .normal)
            messageButton.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.setTitle("", for: .normal)
            saveButton.setImage(UIImage(named: "saveButton"), for: .normal)
            saveButton.tintColor = .secondaryColor
        }
    }
    
    // MARK: - Likes View
    @IBOutlet weak var likesLabel: UILabel! {
        didSet {
            likesLabel.text = "Liked by you and others"
            likesLabel.textColor = .secondaryColor
            likesLabel.font = UIFont.systemFont(ofSize: 12)
        }
    }
    
    // MARK: - Description View
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = "jotacoutinho94 War of Emperium #ragnarok #rpg #gaming"
            descriptionLabel.textColor = .secondaryColor
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
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
            dateLabel.font = UIFont.systemFont(ofSize: 10)
            dateLabel.textColor = .lightGray
        }
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = UIColor.clear
    }
    
    // MARK: - Custom methods
}
