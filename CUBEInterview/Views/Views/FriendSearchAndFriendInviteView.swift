//
//  FriendSearchAndFriendInviteView.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/4/1.
//

import UIKit

protocol FriendSearchAndFriendInviteViewDelegate: AnyObject {
    func focusSearch()
    func outFocusSearch()
}

class FriendSearchAndFriendInviteView: UIView {
    weak var delegate: FriendSearchAndFriendInviteViewDelegate?
    var viewModel: FriendsListCellViewModel
    
    init(viewModel: FriendsListCellViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayEFEFEF
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var searchIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icSearchBarSearchGray")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var searcheTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "想轉一筆給誰呢？"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .gray8E8E93
        return textField
    }()
    
    lazy var addFriendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icBtnAddFriends"), for: .normal)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: FriendsListTableViewCell.identity)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        return tableView
    }()
    
    private func setupView() {
        self.addSubview(searchView)
        NSLayoutConstraint(item: searchView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: searchView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: searchView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36).isActive = true
        NSLayoutConstraint(item: searchView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.73, constant: 0).isActive = true
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        searchView.addSubview(searchIconImageView)
        NSLayoutConstraint(item: searchIconImageView, attribute: .centerY, relatedBy: .equal, toItem: searchView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchIconImageView, attribute: .leading, relatedBy: .equal, toItem: searchView, attribute: .leading, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: searchIconImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 14).isActive = true
        NSLayoutConstraint(item: searchIconImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 14).isActive = true
        searchIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        searchView.addSubview(searcheTextField)
        NSLayoutConstraint(item: searcheTextField, attribute: .centerY, relatedBy: .equal, toItem: searchView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searcheTextField, attribute: .leading, relatedBy: .equal, toItem: searchIconImageView, attribute: .trailing, multiplier: 1.0, constant: 8).isActive = true
        NSLayoutConstraint(item: searcheTextField, attribute: .trailing, relatedBy: .equal, toItem: searchView, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: searcheTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 22).isActive = true
        searcheTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(addFriendButton)
        NSLayoutConstraint(item: addFriendButton, attribute: .centerY, relatedBy: .equal, toItem: searchView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: addFriendButton, attribute: .leading, relatedBy: .equal, toItem: searchView, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: addFriendButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24).isActive = true
        NSLayoutConstraint(item: addFriendButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24).isActive = true
        addFriendButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: searchView, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func refreshData() {
        viewModel.parseRequest4Model()
    }
}

extension FriendSearchAndFriendInviteView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsListTableViewCell.identity, for: indexPath) as! FriendsListTableViewCell
        var starImageViewIsHidden = true
        var moreButtonIsHidden = false
        var invitingButtonIsHidden = false
        var name = ""
        if let friend = viewModel.friendAt(indexPath: indexPath) {
            starImageViewIsHidden = friend.isTop == "0"
            moreButtonIsHidden = !(friend.status == 1 || friend.status == 0)
            invitingButtonIsHidden = !(friend.status == 2)
            name = friend.name
        }
        cell.updateView(starImageViewIsHidden: starImageViewIsHidden,
                        name: name,
                        moreButtonIsHidden: moreButtonIsHidden,
                        invitingButtonIsHidden: invitingButtonIsHidden)
        return cell
    }
}

extension FriendSearchAndFriendInviteView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension FriendSearchAndFriendInviteView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.focusSearch()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        viewModel.filterFriendsAtExceptState2(by: text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        delegate?.outFocusSearch()
        viewModel.filterFriendsAtExceptState2(by: text)
    }
}
