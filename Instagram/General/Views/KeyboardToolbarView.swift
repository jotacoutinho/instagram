//
//  KeyboardToolbarView.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 03/12/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

class KeyboardToolbarView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var emojisView: UIView! {
        didSet {
            emojisView.backgroundColor = .primaryColor
        }
    }
    
    @IBOutlet weak var cameraImageView: UIImageView! {
        didSet {
            cameraImageView.image = UIImage(named: "cameraButton")?.withRenderingMode(.alwaysTemplate)
            cameraImageView.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var camera2ImageView: UIImageView! {
        didSet {
            camera2ImageView.image = UIImage(named: "cameraButton")?.withRenderingMode(.alwaysTemplate)
            camera2ImageView.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var camera3ImageView: UIImageView! {
        didSet {
            camera3ImageView.image = UIImage(named: "cameraButton")?.withRenderingMode(.alwaysTemplate)
            camera3ImageView.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var camera4ImageView: UIImageView! {
        didSet {
            camera4ImageView.image = UIImage(named: "cameraButton")?.withRenderingMode(.alwaysTemplate)
            camera4ImageView.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var camera5ImageView: UIImageView! {
        didSet {
            camera5ImageView.image = UIImage(named: "cameraButton")?.withRenderingMode(.alwaysTemplate)
            camera5ImageView.tintColor = .secondaryColor
        }
    }
    
    @IBOutlet weak var commentView: UIView! {
        didSet {
            commentView.backgroundColor = .primaryColor
            commentView.isUserInteractionEnabled = true
        }
    }
    
    @IBOutlet weak var commentUserImageView: UIImageView! {
        didSet {
            commentUserImageView.image = UIImage(named: "jota")
            commentUserImageView.layer.cornerRadius = commentUserImageView.frame.height/2
            commentUserImageView.contentMode = .scaleAspectFill
            commentUserImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var addCommentTextView: UITextView! {
        didSet {
            addCommentTextView.text = "Add a comment..."
            addCommentTextView.textAlignment = .left
            addCommentTextView.isScrollEnabled = false
            addCommentTextView.textColor = .lightGray
            addCommentTextView.tintColor = .highlightColor
            addCommentTextView.font = .systemFont(ofSize: 14)
            addCommentTextView.backgroundColor = .clear
            addCommentTextView.delegate = self
        }
    }
    
    @IBOutlet weak var postButton: UIButton! {
        didSet {
            postButton.setTitle("Post", for: .normal)
            postButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            postButton.tintColor = .highlightColor
            postButton.isEnabled = false
        }
    }
    
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
        addSubview(contentView)
        isUserInteractionEnabled = true
    }
}

extension KeyboardToolbarView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .secondaryColor
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != nil, !textView.text.isEmpty {
            postButton.isEnabled = true
        } else {
            postButton.isEnabled = false
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add a comment..."
            textView.textColor = .lightGray
        }
    }
}
