//
//  FriendsUserInfoView.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class FriendsUserInfoView: UIView {
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .gray474747
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var idContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray474747
        return label
    }()
    
    lazy var rightArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icInfoBackDeepGray")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 26
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var hintView: UIView = {
        let view = UIView()
        view.backgroundColor = .pinkEC008C
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLable)
        NSLayoutConstraint(item: titleLable, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 35).isActive = true
        NSLayoutConstraint(item: titleLable, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: titleLable, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        NSLayoutConstraint(item: titleLable, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(idContentLabel)
        NSLayoutConstraint(item: idContentLabel, attribute: .top, relatedBy: .equal, toItem: titleLable, attribute: .bottom, multiplier: 1.0, constant: 8).isActive = true
        NSLayoutConstraint(item: idContentLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: idContentLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        NSLayoutConstraint(item: idContentLabel, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
        idContentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(rightArrowImageView)
        NSLayoutConstraint(item: rightArrowImageView, attribute: .leading, relatedBy: .equal, toItem: idContentLabel, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: rightArrowImageView, attribute: .centerY, relatedBy: .equal, toItem: idContentLabel, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: rightArrowImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 16).isActive = true
        NSLayoutConstraint(item: rightArrowImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 16).isActive = true
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(hintView)
        NSLayoutConstraint(item: hintView, attribute: .centerY, relatedBy: .equal, toItem: idContentLabel, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: hintView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: hintView, attribute: .leading, relatedBy: .equal, toItem: idContentLabel, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: hintView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 10).isActive = true
        hintView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(userImageView)
        NSLayoutConstraint(item: userImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 27).isActive = true
        NSLayoutConstraint(item: userImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: userImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 52).isActive = true
        NSLayoutConstraint(item: userImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 52).isActive = true
        userImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
