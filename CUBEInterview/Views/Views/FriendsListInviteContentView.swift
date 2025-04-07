//
//  FriendsListInviteContentView.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/31.
//

import UIKit

protocol FriendsListInviteContentViewDelegate: AnyObject {
    func updateInviteView(singleViewIsHidden: Bool)
}

class FriendsListInviteContentView: UIView {
    weak var delegate: FriendsListInviteContentViewDelegate?
    private var nameArray: [String] = []
    private var lastUpdatedNameArray: [String] = []
    
    lazy var heightConstraint = NSLayoutConstraint()
    private var contentViewArray = [FriendsListInviteView]()
    
    lazy var friendsListInviteView: FriendsListInviteView = {
        let view = FriendsListInviteView()
        view.isHidden = true
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var singleInviteView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var multipleInviteScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    lazy var multipleInviteContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentView)
        NSLayoutConstraint(item: contentView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(singleInviteView)
        NSLayoutConstraint(item: singleInviteView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: singleInviteView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: singleInviteView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80).isActive = true
        NSLayoutConstraint(item: singleInviteView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: singleInviteView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        singleInviteView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(multipleInviteScrollView)
        NSLayoutConstraint(item: multipleInviteScrollView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteScrollView, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteScrollView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteScrollView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteScrollView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        multipleInviteScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let singleViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleViewState))
        contentView.addGestureRecognizer(singleViewTapGesture)
        
    }
    
    @objc private func toggleViewState() {
        singleInviteView.isHidden = !singleInviteView.isHidden
        multipleInviteScrollView.isHidden = !multipleInviteScrollView.isHidden
        delegate?.updateInviteView(singleViewIsHidden: singleInviteView.isHidden)
    }
    
    func setUpView(nameArray: [String]) {
        guard nameArray != lastUpdatedNameArray else { return }

        self.nameArray = nameArray
        lastUpdatedNameArray = nameArray
        
        updateViewZoomIn(nameArray: nameArray)
        updateViewZoomOut(nameArray: nameArray)
        multipleInviteScrollView.isHidden = true
    }
    
    private func updateViewZoomIn(nameArray: [String]) {
        guard nameArray.count > 0 else { return }
        
        for _ in nameArray {
            
            for (index, _) in nameArray.enumerated() {
                let itemView = FriendsListInviteView()
                
                singleInviteView.addSubview(itemView)
                if (index == 0) {
                    NSLayoutConstraint(item: itemView, attribute: .top, relatedBy: .equal, toItem: singleInviteView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
                    NSLayoutConstraint(item: itemView, attribute: .leading, relatedBy: .equal, toItem: singleInviteView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
                    NSLayoutConstraint(item: itemView, attribute: .trailing, relatedBy: .equal, toItem: singleInviteView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
                    NSLayoutConstraint(item: itemView, attribute: .height, relatedBy: .equal, toItem: singleInviteView, attribute: .height, multiplier: 1.0, constant: 0).isActive = true
                    itemView.translatesAutoresizingMaskIntoConstraints = false
                    itemView.tag = index
                    itemView.updateView(name: nameArray[index])
                    itemView.bottomShadowView.isHidden = false
                }
            }
        }
    }

    private func updateViewZoomOut(nameArray: [String]) {
        guard nameArray.count > 0 else { return }
        
        for itemView in contentViewArray {
            itemView.removeFromSuperview()
        }
        contentViewArray.removeAll()
        
        multipleInviteScrollView.addSubview(multipleInviteContentView)
        multipleInviteContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: multipleInviteContentView, attribute: .top, relatedBy: .equal, toItem: multipleInviteScrollView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteContentView, attribute: .leading, relatedBy: .equal, toItem: multipleInviteScrollView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteContentView, attribute: .trailing, relatedBy: .equal, toItem: multipleInviteScrollView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteContentView, attribute: .bottom, relatedBy: .equal, toItem: multipleInviteScrollView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: multipleInviteContentView, attribute: .width, relatedBy: .equal, toItem: multipleInviteScrollView, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        
        var lastView: UIView?
        
        for (index, name) in nameArray.enumerated() {
            let itemView = FriendsListInviteView()
            multipleInviteContentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint(item: itemView, attribute: .leading, relatedBy: .equal, toItem: multipleInviteContentView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: itemView, attribute: .trailing, relatedBy: .equal, toItem: multipleInviteContentView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: itemView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 75).isActive = true
            
            if index == 0 {
                NSLayoutConstraint(item: itemView, attribute: .top, relatedBy: .equal, toItem: multipleInviteContentView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
            } else if let lastView = lastView {
                NSLayoutConstraint(item: itemView, attribute: .top, relatedBy: .equal, toItem: lastView, attribute: .bottom, multiplier: 1.0, constant: 5).isActive = true
            }
            
            lastView = itemView
            contentViewArray.append(itemView)
            itemView.updateView(name: name)
        }
        
        if let lastView = lastView {
            NSLayoutConstraint(item: lastView, attribute: .bottom, relatedBy: .equal, toItem: multipleInviteContentView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
