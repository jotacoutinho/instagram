//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 02/12/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView! {
        didSet {
            borderView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var userImageView: UIImageView! {
        didSet {
            userImageView.image = UIImage(named: "jota")
            userImageView.layer.cornerRadius = userImageView.frame.height/2
            userImageView.contentMode = .scaleAspectFill
            userImageView.clipsToBounds = true
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

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        contentView.backgroundColor = .primaryColor
    }
}
