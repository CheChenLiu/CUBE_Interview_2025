//
//  FriendsListTableViewCell.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    static let identity = "FriendsListTableViewCell"
    lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icFriendsStar")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imgFriendsList")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray474747
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var transforButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 2
        button.setTitle("轉帳", for: .normal)
        button.setTitleColor(.pinkEC008C, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = UIColor.pinkEC008C.cgColor
        button.layer.borderWidth = 1
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    lazy var invitingButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 2
        button.setTitle("邀請中", for: .normal)
        button.setTitleColor(.gray999999, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = UIColor.gray999999.cgColor
        button.layer.borderWidth = 1
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icFriendsMore"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayE4E4E4
        return view
    }()
    
    lazy var moreButtonWidth = NSLayoutConstraint()
    lazy var invitingButtonWidth = NSLayoutConstraint()
    lazy var invitingButtonTrailing = NSLayoutConstraint()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(starImageView)
        NSLayoutConstraint(item: starImageView, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: starImageView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 23).isActive = true
        NSLayoutConstraint(item: starImageView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: -23).isActive = true
        NSLayoutConstraint(item: starImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 14).isActive = true
        NSLayoutConstraint(item: starImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 14).isActive = true
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(headImageView)
        NSLayoutConstraint(item: headImageView, attribute: .leading, relatedBy: .equal, toItem: starImageView, attribute: .trailing, multiplier: 1.0, constant: 6).isActive = true
        NSLayoutConstraint(item: headImageView, attribute: .centerY, relatedBy: .equal, toItem: starImageView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: headImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        NSLayoutConstraint(item: headImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        headImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(nameLabel)
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: headImageView, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .centerY, relatedBy: .equal, toItem: headImageView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 22).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(moreButton)
        NSLayoutConstraint(item: moreButton, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: moreButton, attribute: .centerY, relatedBy: .equal, toItem: headImageView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: moreButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24).isActive = true
        moreButtonWidth = NSLayoutConstraint(item: moreButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18)
        moreButtonWidth.isActive = true
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(invitingButton)
        invitingButtonTrailing = NSLayoutConstraint(item: invitingButton, attribute: .trailing, relatedBy: .equal, toItem: moreButton, attribute: .leading, multiplier: 1.0, constant: -15)
        invitingButtonTrailing.isActive = true
        NSLayoutConstraint(item: invitingButton, attribute: .centerY, relatedBy: .equal, toItem: headImageView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: invitingButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24).isActive = true
        invitingButtonWidth = NSLayoutConstraint(item: invitingButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)
        invitingButtonWidth.isActive = true
        invitingButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(transforButton)
        NSLayoutConstraint(item: transforButton, attribute: .trailing, relatedBy: .equal, toItem: invitingButton, attribute: .leading, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: transforButton, attribute: .centerY, relatedBy: .equal, toItem: headImageView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: transforButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24).isActive = true
        NSLayoutConstraint(item: transforButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 47).isActive = true
        transforButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(bottomLineView)
        NSLayoutConstraint(item: bottomLineView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: bottomLineView, attribute: .leading, relatedBy: .equal, toItem: nameLabel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1).isActive = true
        NSLayoutConstraint(item: bottomLineView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateView(starImageViewIsHidden: Bool, name: String, moreButtonIsHidden: Bool, invitingButtonIsHidden: Bool) {
        starImageView.isHidden = starImageViewIsHidden
        nameLabel.text = name
        if moreButtonIsHidden == true {
            moreButtonWidth.constant = 0
        } else {
            moreButtonWidth.constant = 18
        }
        
        if invitingButtonIsHidden == true {
            invitingButtonWidth.constant = 0
            invitingButtonTrailing.constant = -15
        } else {
            invitingButtonWidth.constant = 60
            invitingButtonTrailing.constant = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
