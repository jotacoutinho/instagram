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
            headerView.backgroundColor = .primaryColor
        }
    }
    
    @IBOutlet weak var postView: UIView! {
        didSet {
            postView.backgroundColor = .primaryColor
        }
    }
    
    @IBOutlet weak var commandsView: UIView! {
        didSet {
            commandsView.backgroundColor = .primaryColor
        }
    }
       
    @IBOutlet weak var likesView: UIView! {
        didSet {
            likesView.backgroundColor = .primaryColor
        }
    }
       
    @IBOutlet weak var descriptionView: UIView! {
        didSet {
            descriptionView.backgroundColor = .primaryColor
        }
    }
       
    @IBOutlet weak var commentView: UIView! {
        didSet {
            commentView.backgroundColor = .primaryColor
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
            usernameLabel.isUserInteractionEnabled = true
        }
    }
    
    @IBOutlet weak var locationLabel: UILabel! {
        didSet {
            locationLabel.text = "Rune Midgard"
            locationLabel.font = UIFont.systemFont(ofSize: 14)
            locationLabel.textColor = .secondaryColor
            locationLabel.isUserInteractionEnabled = true
        }
    }
    
    @IBOutlet weak var moreButton: UIButton! {
        didSet {
            moreButton.setTitle("", for: .normal)
            moreButton.setImage(UIImage(named: "moreButton"), for: .normal)
            moreButton.tintColor = .secondaryColor
        }
    }
    
    // MARK: - Post View
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likeImageView: UIImageView! {
        didSet {
            likeImageView.image = UIImage(named: "likeButtonFilled")?.withRenderingMode(.alwaysTemplate)
            likeImageView.tintColor = .secondaryColor
            likeImageView.contentMode = .scaleAspectFill
            likeImageView.isHidden = true
        }
    }
    
    @IBOutlet weak var imageSavedOffsetConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageSavedView: UIView! {
        didSet {
            imageSavedView.backgroundColor = UIColor.primaryColor.withAlphaComponent(0.75)
        }
    }
    
    @IBOutlet weak var savedImageView: UIImageView! {
        didSet {
            savedImageView.image = UIImage(named: "woe")
            savedImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var savedLabel: UILabel! {
        didSet {
            savedLabel.text = "Saved"
            savedLabel.font = UIFont.systemFont(ofSize: 14)
            savedLabel.textColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var saveToExternalButton: UIButton! {
        didSet {
            saveToExternalButton.tintColor = .highlightColor
            saveToExternalButton.setTitle("Save to External", for: .normal)
            saveToExternalButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
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
            messageButton.isEnabled = false
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
            let attributedString = NSMutableAttributedString(string: "Liked by you and others", attributes: [
              .font: UIFont.systemFont(ofSize: 14),
              .foregroundColor: UIColor.secondaryColor
            ])
            attributedString.addAttribute(.font,
                                          value: UIFont.boldSystemFont(ofSize: 14),
                                          range: NSRange(location: 9, length: 3))
            attributedString.addAttribute(.font,
                                          value: UIFont.boldSystemFont(ofSize: 14),
                                          range: NSRange(location: 17, length: 6))
            likesLabel.attributedText = attributedString
            likesLabel.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - Description View
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            let attributedString = NSMutableAttributedString(string: "jotacoutinho94 War of Emperium #ragnarok #rpg #gaming", attributes: [
              .font: UIFont.systemFont(ofSize: 14),
              .foregroundColor: UIColor.secondaryColor
            ])
            attributedString.addAttribute(.font,
                                          value: UIFont.boldSystemFont(ofSize: 14),
                                          range: NSRange(location: 0, length: 14))
            attributedString.addAttribute(.foregroundColor,
                                          value: UIColor.highlightColor,
                                          range: NSRange(location: 31, length: 22))
            descriptionLabel.attributedText = attributedString
            descriptionLabel.numberOfLines = 0
            descriptionLabel.isUserInteractionEnabled = true
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
            commentUserImageView.backgroundColor = .primaryColor
        }
    }
    
    @IBOutlet weak var addCommentButton: UIButton! {
        didSet {
            addCommentButton.setTitle("Add a comment...", for: .normal)
            addCommentButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            addCommentButton.titleLabel?.textAlignment = .left
            addCommentButton.tintColor = .lightGray
        }
    }

    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.text = "november 29th"
            dateLabel.font = UIFont.systemFont(ofSize: 10)
            dateLabel.textColor = .lightGray
        }
    }
    
    // MARK: - Actions
    @IBAction func moreButtonAction(_ sender: Any) {
        delegate?.presentViewController(viewController: actionSheet, animated: true)
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        likeStatus = !likeStatus
        likeButton.setImage(UIImage(named: likeStatus ? "likeButtonFilled" : "likeButton"), for: .normal)
        likeButton.tintColor = likeStatus ? .likeColor : .secondaryColor
        showLikeAnimation()
    }
    
    @IBAction func commentButtonAction(_ sender: Any) {
        delegate?.goToCommentsSection()
    }
    
    @IBAction func messageButtonAction(_ sender: Any) {
        // TODO: bottom sheet
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        saveStatus = !saveStatus
        saveButton.setImage(UIImage(named: saveStatus ? "saveButtonFilled" : "saveButton"), for: .normal)
        if saveStatus {
            showImageSavedAnimation()
            // TODO: save to user profile
        } else {
            // TODO: remove from user profile
        }
    }
    
    @IBAction func viewAllCommentsButtonAction(_ sender: Any) {
        delegate?.goToCommentsSection()
    }
    
    @IBAction func addCommentButtonAction(_ sender: Any) {
        keyboardToolbarView = KeyboardToolbarView()
        configureKeyboardToolbar()
    }
    
    // MARK: - Variables
    var likeStatus: Bool = false
    var saveStatus: Bool = false
    var actionSheet: UIAlertController = UIAlertController()
    private weak var delegate: HomeDelegate?
    private var keyboardToolbarView: KeyboardToolbarView?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        contentView.backgroundColor = .primaryColor
        
        configureMoreActionSheet()
    }
    
    // MARK: - Custom methods
    func configure(delegate: HomeDelegate) {
        self.delegate = delegate
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView(recognizer:))))
        configureLabelsRecognizers()
        configureKeyboardToolbar()
    }
    
    func configureLabelsRecognizers() {
        usernameLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(usernameLabelTapGestureRecognizer(recognizer:))))
        
        locationLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(locationLabelTapGestureRecognizer(recognizer:))))
        
        likesLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                               action: #selector(likesLabelTapGestureRecognizer(recognizer:))))
        
        descriptionLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                     action: #selector(descriptionLabelTapGestureRecognizer(recognizer:))))
    }
    
    func configureKeyboardToolbar() {
        guard let toolbar = keyboardToolbarView else { return }

        contentView.addSubview(toolbar.contentView)
    
        toolbar.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: toolbar.contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: toolbar.contentView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: toolbar.contentView.bottomAnchor)
        ])
        toolbar.contentView.clipsToBounds = true
        toolbar.contentView.isUserInteractionEnabled = true
    }
    
    @objc func didTapView(recognizer: UITapGestureRecognizer) {
        if keyboardToolbarView?.contentView != nil {
            keyboardToolbarView?.contentView.removeFromSuperview()
        }
    }
    
    @objc func usernameLabelTapGestureRecognizer(recognizer: UITapGestureRecognizer) {
        print("goToProfileTab")
        // TODO: go to profile tab
    }
    
    @objc func locationLabelTapGestureRecognizer(recognizer: UITapGestureRecognizer) {
        print("goToMapView")
        // TODO: go to map view
    }
    
    @objc func likesLabelTapGestureRecognizer(recognizer: UITapGestureRecognizer) {
        let highlightedUserRange = NSRange(location: 9, length: 3)
        let othersRange = NSRange(location: 17, length: 6)
        
        if recognizer.didTapAttributedTextInLabel(label: likesLabel, inRange: highlightedUserRange) {
            print("hey")
        } else if recognizer.didTapAttributedTextInLabel(label: likesLabel, inRange: othersRange) {
            print("ho")
        }
    }
    
    @objc func descriptionLabelTapGestureRecognizer(recognizer: UITapGestureRecognizer) {
        let usernameRange = NSRange(location: 0, length: 14)
        let hashtagRange = NSRange(location: 31, length: 22)
        
        if recognizer.didTapAttributedTextInLabel(label: descriptionLabel, inRange: usernameRange) {
            print("hey")
        } else if recognizer.didTapAttributedTextInLabel(label: descriptionLabel, inRange: hashtagRange) {
            print("ho")
        }
    }
    
    func showLikeAnimation() {
        // TODO: show animation on top of the image when post is liked
    }
    
    func showImageSavedAnimation() {
        imageSavedOffsetConstraint.constant = 0
        delegate?.showImageSavedAnimation(imageView: postImageView)
        UIView.animate(withDuration: 1, animations: {
            self.layoutIfNeeded()
        }, completion: { _ in
            self.imageSavedOffsetConstraint.constant = -self.imageSavedView.frame.height
            UIView.animate(withDuration: 1, delay: 2, options: .curveEaseIn, animations: {
                self.layoutIfNeeded()
            }, completion: nil)
        })
    }
    
    func configureMoreActionSheet() {
        actionSheet = UIAlertController(title: "Actions", message: "What do you want to do?", preferredStyle: .actionSheet)
        
        let reportAction = UIAlertAction(title: "Report", style: .destructive, handler: nil)
        let muteAction = UIAlertAction(title: "Mute", style: .default, handler: nil)
        let unfollowAction = UIAlertAction(title: "Unfollow", style: .default, handler: nil)
        let copyAction = UIAlertAction(title: "Copy Link", style: .default, handler: nil)
        let shareAction = UIAlertAction(title: "Share to...", style: .default, handler: nil)
        let showPostAction = UIAlertAction(title: "Turn On Post Notifications", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        muteAction.setValue(UIColor.secondaryColor, forKey: "titleTextColor")
        unfollowAction.setValue(UIColor.secondaryColor, forKey: "titleTextColor")
        copyAction.setValue(UIColor.secondaryColor, forKey: "titleTextColor")
        shareAction.setValue(UIColor.secondaryColor, forKey: "titleTextColor")
        showPostAction.setValue(UIColor.secondaryColor, forKey: "titleTextColor")
        cancelAction.setValue(UIColor.secondaryColor, forKey: "titleTextColor")
        
        actionSheet.addAction(reportAction)
        actionSheet.addAction(muteAction)
        actionSheet.addAction(unfollowAction)
        actionSheet.addAction(copyAction)
        actionSheet.addAction(shareAction)
        actionSheet.addAction(showPostAction)
        actionSheet.addAction(cancelAction)
    }
}

extension FeedTableViewCell: UITextFieldDelegate {
    
}
