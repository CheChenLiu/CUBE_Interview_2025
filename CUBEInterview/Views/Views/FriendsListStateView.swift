//
//  FriendsListStateView.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class FriendsListStateView: UIView {
    lazy var fiendsListButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitle("好友", for: .normal)
        button.setTitleColor(.gray474747, for: .normal)
        return button
    }()
    
    lazy var chatListButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitle("聊天", for: .normal)
        button.setTitleColor(.gray474747, for: .normal)
        return button
    }()
    
    lazy var fiendsListButtonBottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .pinkEC008C
        view.layer.cornerRadius = 2
        view.clipsToBounds = true
        return view
    }()
    
    lazy var friendAmountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .pinkF9B2DC
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()
    
    lazy var chatAmountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .pinkF9B2DC
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.textColor = .white
        label.text = "99+"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayEFEFEF
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(fiendsListButton)
        NSLayoutConstraint(item: fiendsListButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 22).isActive = true
        NSLayoutConstraint(item: fiendsListButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 32).isActive = true
        NSLayoutConstraint(item: fiendsListButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        NSLayoutConstraint(item: fiendsListButton, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 26).isActive = true
        fiendsListButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(friendAmountLabel)
        NSLayoutConstraint(item: friendAmountLabel, attribute: .leading, relatedBy: .equal, toItem: fiendsListButton, attribute: .trailing, multiplier: 1.0, constant: 2.5).isActive = true
        NSLayoutConstraint(item: friendAmountLabel, attribute: .bottom, relatedBy: .equal, toItem: fiendsListButton, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendAmountLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        NSLayoutConstraint(item: friendAmountLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        friendAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(chatListButton)
        NSLayoutConstraint(item: chatListButton, attribute: .centerY, relatedBy: .equal, toItem: fiendsListButton, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: chatListButton, attribute: .leading, relatedBy: .equal, toItem: friendAmountLabel, attribute: .trailing, multiplier: 1.0, constant: 15.5).isActive = true
        NSLayoutConstraint(item: chatListButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        NSLayoutConstraint(item: chatListButton, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 26).isActive = true
        chatListButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(fiendsListButtonBottomLineView)
        NSLayoutConstraint(item: fiendsListButtonBottomLineView, attribute: .centerX, relatedBy: .equal, toItem: fiendsListButton, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: fiendsListButtonBottomLineView, attribute: .top, relatedBy: .equal, toItem: fiendsListButton, attribute: .bottom, multiplier: 1.0, constant: 6).isActive = true
        NSLayoutConstraint(item: fiendsListButtonBottomLineView, attribute: .leading, relatedBy: .equal, toItem: fiendsListButton, attribute: .leading, multiplier: 1.0, constant: 3).isActive = true
        NSLayoutConstraint(item: fiendsListButtonBottomLineView, attribute: .trailing, relatedBy: .equal, toItem: fiendsListButton, attribute: .trailing, multiplier: 1.0, constant: -3).isActive = true
        NSLayoutConstraint(item: fiendsListButtonBottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 4).isActive = true
        fiendsListButtonBottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(chatAmountLabel)
        NSLayoutConstraint(item: chatAmountLabel, attribute: .leading, relatedBy: .equal, toItem: chatListButton, attribute: .trailing, multiplier: 1.0, constant: 3).isActive = true
        NSLayoutConstraint(item: chatAmountLabel, attribute: .bottom, relatedBy: .equal, toItem: chatListButton, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: chatAmountLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        NSLayoutConstraint(item: chatAmountLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        chatAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bottomLineView)
        NSLayoutConstraint(item: bottomLineView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomLineView, attribute: .top, relatedBy: .equal, toItem: fiendsListButtonBottomLineView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomLineView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1).isActive = true
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
