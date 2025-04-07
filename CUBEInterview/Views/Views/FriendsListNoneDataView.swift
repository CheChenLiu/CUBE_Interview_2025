//
//  FriendsListNoneDataView.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class FriendsListNoneDataView: UIView {
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imgFriendsEmpty")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "就從加好友開始吧：）"
        label.textColor = .gray474747
        label.font = UIFont.systemFont(ofSize: 21)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）"
        label.numberOfLines = 0
        label.textColor = .gray999999
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.greenA6CC42.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 6
        return view
    }()
    
    lazy var gradientView: GradientView = {
        let view = GradientView(leftColor: UIColor.green56B30B,
                                rightColor: UIColor.greenA6CC42,
                                startPoint: CGPoint(x: 0, y: 0.5),
                                endPoint: CGPoint(x: 1, y: 0.5))
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    lazy var addFriendLabel: UILabel = {
        let label = UILabel()
        label.text = "加好友"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var addFriendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icAddFriendWhite")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray999999
        label.font = UIFont.systemFont(ofSize: 13)
        let fullText = "幫助好友更快找到你？設定 KOKO ID"
        let targetText = "設定 KOKO ID"
        
        let attributedString = NSMutableAttributedString(string: fullText)
        
        if let range = fullText.range(of: targetText) {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.pinkEC008C, range: nsRange)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: nsRange)
        }

        label.attributedText = attributedString
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(contentImageView)
        NSLayoutConstraint(item: contentImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: contentImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 245).isActive = true
        NSLayoutConstraint(item: contentImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 172).isActive = true
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(hintLabel)
        NSLayoutConstraint(item: hintLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: hintLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: hintLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: hintLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18).isActive = true
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(shadowView)
        NSLayoutConstraint(item: shadowView, attribute: .bottom, relatedBy: .equal, toItem: hintLabel, attribute: .top, multiplier: 1.0, constant: -37).isActive = true
        NSLayoutConstraint(item: shadowView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: shadowView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 192).isActive = true
        NSLayoutConstraint(item: shadowView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45).isActive = true
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.addSubview(gradientView)
        NSLayoutConstraint(item: gradientView, attribute: .top, relatedBy: .equal, toItem: shadowView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: gradientView, attribute: .centerX, relatedBy: .equal, toItem: shadowView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: gradientView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 192).isActive = true
        NSLayoutConstraint(item: gradientView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        gradientView.addSubview(addFriendLabel)
        NSLayoutConstraint(item: addFriendLabel, attribute: .centerY, relatedBy: .equal, toItem: gradientView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: addFriendLabel, attribute: .width, relatedBy: .equal, toItem: gradientView, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: addFriendLabel, attribute: .centerX, relatedBy: .equal, toItem: gradientView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: addFriendLabel, attribute: .height, relatedBy: .equal, toItem: gradientView, attribute: .height, multiplier: 1.0, constant: 0).isActive = true
        addFriendLabel.translatesAutoresizingMaskIntoConstraints = false
        
        gradientView.addSubview(addFriendImageView)
        NSLayoutConstraint(item: addFriendImageView, attribute: .centerY, relatedBy: .equal, toItem: gradientView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: addFriendImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24).isActive = true
        NSLayoutConstraint(item: addFriendImageView, attribute: .trailing, relatedBy: .equal, toItem: gradientView, attribute: .trailing, multiplier: 1.0, constant: -8).isActive = true
        NSLayoutConstraint(item: addFriendImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24).isActive = true
        addFriendImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(descriptionLabel)
        NSLayoutConstraint(item: descriptionLabel, attribute: .bottom, relatedBy: .equal, toItem: gradientView, attribute: .top, multiplier: 1.0, constant: -25).isActive = true
        NSLayoutConstraint(item: descriptionLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptionLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptionLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLable)
        NSLayoutConstraint(item: titleLable, attribute: .bottom, relatedBy: .equal, toItem: descriptionLabel, attribute: .top, multiplier: 1.0, constant: -8).isActive = true
        NSLayoutConstraint(item: titleLable, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLable, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLable, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 29).isActive = true
        titleLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
