//
//  FriendsListInviteView.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/31.
//

import UIKit

class FriendsListInviteView: UIView {
    lazy var shadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
        return view
    }()
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    lazy var headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "imgFriendsList")
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray474747
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var desciptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray999999
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .left
        label.text = "邀請你成為好友：）"
        return label
    }()
    
    lazy var agreeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btnFriendsAgree"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btnFriendsDelet"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var bottomShadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
        view.isHidden = true
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(bottomShadowView)
        NSLayoutConstraint(item: bottomShadowView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomShadowView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomShadowView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: bottomShadowView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: bottomShadowView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 315).isActive = true
        bottomShadowView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomShadowView.addSubview(bottomView)
        NSLayoutConstraint(item: bottomView, attribute: .top, relatedBy: .equal, toItem: bottomShadowView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomView, attribute: .centerX, relatedBy: .equal, toItem: bottomShadowView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomView, attribute: .leading, relatedBy: .equal, toItem: bottomShadowView, attribute: .leading, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: bottomView, attribute: .trailing, relatedBy: .equal, toItem: bottomShadowView, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: bottomView, attribute: .bottom, relatedBy: .equal, toItem: bottomShadowView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(shadowView)
        NSLayoutConstraint(item: shadowView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: shadowView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: shadowView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: shadowView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: shadowView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 315).isActive = true
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.addSubview(topView)
        NSLayoutConstraint(item: topView, attribute: .top, relatedBy: .equal, toItem: shadowView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topView, attribute: .centerX, relatedBy: .equal, toItem: shadowView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topView, attribute: .width, relatedBy: .equal, toItem: shadowView, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topView, attribute: .bottom, relatedBy: .equal, toItem: shadowView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.addSubview(headImageView)
        NSLayoutConstraint(item: headImageView, attribute: .leading, relatedBy: .equal, toItem: topView, attribute: .leading, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: headImageView, attribute: .centerY, relatedBy: .equal, toItem: topView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: headImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        NSLayoutConstraint(item: headImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        headImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.addSubview(cancelButton)
        NSLayoutConstraint(item: cancelButton, attribute: .centerY, relatedBy: .equal, toItem: topView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: cancelButton, attribute: .trailing, relatedBy: .equal, toItem: topView, attribute: .trailing, multiplier: 1.0, constant: -15).isActive = true
        NSLayoutConstraint(item: cancelButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: cancelButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        topView.addSubview(agreeButton)
        NSLayoutConstraint(item: agreeButton, attribute: .centerY, relatedBy: .equal, toItem: topView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: agreeButton, attribute: .trailing, relatedBy: .equal, toItem: cancelButton, attribute: .leading, multiplier: 1.0, constant: -15).isActive = true
        NSLayoutConstraint(item: agreeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: agreeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        agreeButton.translatesAutoresizingMaskIntoConstraints = false
        
        topView.addSubview(nameLabel)
        NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: headImageView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: headImageView, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: agreeButton, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 22).isActive = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        topView.addSubview(desciptionLabel)
        NSLayoutConstraint(item: desciptionLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1.0, constant: 2).isActive = true
        NSLayoutConstraint(item: desciptionLabel, attribute: .leading, relatedBy: .equal, toItem: nameLabel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: desciptionLabel, attribute: .trailing, relatedBy: .equal, toItem: nameLabel, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: desciptionLabel, attribute: .bottom, relatedBy: .equal, toItem: headImageView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: desciptionLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 22).isActive = true
        desciptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateView(name: String) {
        nameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
