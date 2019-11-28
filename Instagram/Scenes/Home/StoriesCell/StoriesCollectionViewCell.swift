//
//  StoriesCollectionViewCell.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 28/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var borderView: UIView! {
        didSet {
            borderView.layer.cornerRadius = 32
            borderView.layer.borderWidth = 2
            borderView.layer.borderColor = UIColor.secondaryColor.cgColor
        }
    }
    
    @IBOutlet weak var userImageView: UIImageView! {
        didSet {
            userImageView.image = UIImage(named: "instagramLogo")
            userImageView.layer.cornerRadius = userImageView.frame.height/2
            userImageView.contentMode = .scaleAspectFit
            userImageView.clipsToBounds = true
        }
        
    }
    
    @IBOutlet weak var userNicknameLabel: UILabel! {
        didSet {
            userNicknameLabel.text = "instagram"
            userNicknameLabel.textAlignment = .center
            userNicknameLabel.textColor = .secondaryColor
            userNicknameLabel.font = UIFont.systemFont(ofSize: 12)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
