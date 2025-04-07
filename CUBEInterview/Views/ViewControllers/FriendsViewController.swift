//
//  FriendsViewController.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class FriendsViewController: UIViewController {
    let friendsListCellViewModel = FriendsListCellViewModel()
    
    private var friendsUserInfoViewHeightConstraint: NSLayoutConstraint?
    private var friendsListInviteContentViewHeightConstraint: NSLayoutConstraint?
    private var friendsListStateViewHeightConstraint: NSLayoutConstraint?
    
    lazy var friendsUserInfoView: FriendsUserInfoView = {
        let view = FriendsUserInfoView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var friendsListInviteContentView: FriendsListInviteContentView = {
        let view = FriendsListInviteContentView()
        view.delegate = self
        return view
    }()
    
    lazy var friendsListStateView: FriendsListStateView = {
        let view = FriendsListStateView()
        return view
    }()
    
    lazy var searchAndAddFriendView: FriendSearchAndAddFriendView = {
        let view = FriendSearchAndAddFriendView(viewModel: friendsListCellViewModel)
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
    lazy var searchAndFriendInviteView: FriendSearchAndFriendInviteView = {
        let view = FriendSearchAndFriendInviteView(viewModel: friendsListCellViewModel)
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
    lazy var friendsListNoneDataView: FriendsListNoneDataView = {
        let view = FriendsListNoneDataView()
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        dataBinding()
        setupNavigationBar()
        setUpView()
        setUpViewState()
        friendsListCellViewModel.parseUserInfoModel()
        
        if viewState == .onlyFriends {
            friendsListCellViewModel.parseRequestModel()
        } else if viewState == .friensWithInvite {
            friendsListCellViewModel.parseRequest4Model()
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap)
    }
    
    private func dataBinding() {
        friendsListCellViewModel.onHeightChange = { [weak self] userInfoHeight, inviteContentHeight, stateViewHeight in
            self?.friendsUserInfoViewHeightConstraint?.constant = userInfoHeight
            self?.friendsListInviteContentViewHeightConstraint?.constant = inviteContentHeight
            self?.friendsListStateViewHeightConstraint?.constant = stateViewHeight
        }
        
        friendsListCellViewModel.onUserInfoDataChange = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.friendsUserInfoView.titleLable.text = self.friendsListCellViewModel.userInfo?.name
                self.friendsUserInfoView.idContentLabel.text = self.friendsListCellViewModel.formmatedKoKoID
                self.friendsUserInfoView.userImageView.image = UIImage(named: "imgFriendsFemaleDefault")
                if self.friendsListCellViewModel.userInfo?.kokoid == nil || self.friendsListCellViewModel.userInfo?.kokoid == "" {
                    self.friendsUserInfoView.hintView.isHidden = false
                } else {
                    self.friendsUserInfoView.hintView.isHidden = true
                }
            }
        }
        
        friendsListCellViewModel.onDataChange = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if viewState == .onlyFriends {
                    self.searchAndAddFriendView.tableView.refreshControl?.endRefreshing()
                    self.searchAndAddFriendView.tableView.reloadData()
                } else if viewState == .friensWithInvite {
                    self.searchAndFriendInviteView.tableView.refreshControl?.endRefreshing()
                    self.searchAndFriendInviteView.tableView.reloadData()
                }
                
                if self.friendsListCellViewModel.state2Amount > 0 {
                    self.friendsListStateView.friendAmountLabel.isHidden = false
                    self.friendsListStateView.friendAmountLabel.text = self.friendsListCellViewModel.status2AmountString
                }
                self.friendsListStateView.chatAmountLabel.isHidden = false
                self.friendsListInviteContentView.setUpView(nameArray: self.friendsListCellViewModel.state2NameArray)
            }
        }
    }
    
    private func setUpViewState() {
        if viewState == .noneFriends {
            friendsListNoneDataView.isHidden = false
            searchAndAddFriendView.isHidden = true
            searchAndFriendInviteView.isHidden = true
            friendsListInviteContentView.isHidden = true
            friendsListCellViewModel.updateInviteContentHeight(inviteContentHeight: 0)
        } else if viewState == .onlyFriends {
            friendsListNoneDataView.isHidden = true
            searchAndAddFriendView.isHidden = false
            searchAndFriendInviteView.isHidden = true
            friendsListInviteContentView.isHidden = true
            friendsListCellViewModel.updateInviteContentHeight(inviteContentHeight: 0)
        } else {
            friendsListNoneDataView.isHidden = true
            searchAndAddFriendView.isHidden = true
            searchAndFriendInviteView.isHidden = false
            friendsListInviteContentView.isHidden = false
            if friendsListCellViewModel.friendsListInviteContentViewSingleViewIsHidden == true {
                friendsListCellViewModel.updateInviteContentHeight(inviteContentHeight: 165)
            } else {
                friendsListCellViewModel.updateInviteContentHeight(inviteContentHeight: 80)
            }
        }
        
        friendsUserInfoView.isHidden = false
        friendsListStateView.isHidden = false
        updateViewHeights()
    }
    
    private func hideViewWhenFocusSearch() {
        friendsListCellViewModel.updateUserInfoHeight(userInfoHeight: 0)
        friendsListCellViewModel.updateInviteContentHeight(inviteContentHeight: 0)
        friendsListCellViewModel.updateStateViewHeight(stateViewHeight: 0)
        
        friendsUserInfoView.isHidden = true
        friendsListInviteContentView.isHidden = true
        friendsListStateView.isHidden = true
    }
    
    private func updateViewHeights() {
        UIView.animate(withDuration: 0.3) {
            self.friendsUserInfoViewHeightConstraint?.constant = self.friendsListCellViewModel.friendsUserInfoViewHeight
            self.friendsListInviteContentViewHeightConstraint?.constant = self.friendsListCellViewModel.friendsListInviteContentViewHeight
            self.friendsListStateViewHeightConstraint?.constant = self.friendsListCellViewModel.friendsListStateViewHeight
            
            self.view.layoutIfNeeded()
        }
    }
    
    private func setUpView() {
        self.view.addSubview(friendsUserInfoView)
        NSLayoutConstraint(item: friendsUserInfoView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsUserInfoView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsUserInfoView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        friendsUserInfoViewHeightConstraint = NSLayoutConstraint(item: friendsUserInfoView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0)
        friendsUserInfoViewHeightConstraint?.isActive = true
        friendsUserInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(friendsListInviteContentView)
        NSLayoutConstraint(item: friendsListInviteContentView, attribute: .top, relatedBy: .equal, toItem: friendsUserInfoView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsListInviteContentView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsListInviteContentView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        friendsListInviteContentViewHeightConstraint = NSLayoutConstraint(item: friendsListInviteContentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0)
        friendsListInviteContentViewHeightConstraint?.isActive = true
        friendsListInviteContentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(friendsListStateView)
        NSLayoutConstraint(item: friendsListStateView, attribute: .top, relatedBy: .equal, toItem: friendsListInviteContentView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsListStateView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsListStateView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        friendsListStateViewHeightConstraint = NSLayoutConstraint(item: friendsListStateView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0)
        friendsListStateViewHeightConstraint?.isActive = true
        friendsListStateView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(friendsListNoneDataView)
        NSLayoutConstraint(item: friendsListNoneDataView, attribute: .top, relatedBy: .equal, toItem: friendsListStateView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsListNoneDataView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsListNoneDataView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: friendsListNoneDataView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -13).isActive = true
        friendsListNoneDataView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(searchAndAddFriendView)
        NSLayoutConstraint(item: searchAndAddFriendView, attribute: .top, relatedBy: .equal, toItem: friendsListStateView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchAndAddFriendView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchAndAddFriendView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchAndAddFriendView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -13).isActive = true
        searchAndAddFriendView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(searchAndFriendInviteView)
        NSLayoutConstraint(item: searchAndFriendInviteView, attribute: .top, relatedBy: .equal, toItem: friendsListStateView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchAndFriendInviteView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchAndFriendInviteView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchAndFriendInviteView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -13).isActive = true
        searchAndFriendInviteView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear // 移除底部線條
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .pinkEC008C
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let atmButton = UIBarButtonItem(image: UIImage(named: "icNavPinkWithdraw"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(atmTapped))
        let transferButton = UIBarButtonItem(image: UIImage(named: "icNavPinkTransfer"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(transferTapped))
        navigationItem.leftBarButtonItems = [atmButton, transferButton]

        let scanButton = UIBarButtonItem(image: UIImage(named: "icNavPinkScan"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(scanTapped))
        navigationItem.rightBarButtonItem = scanButton
    }
    
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }

    @objc private func atmTapped() {
        print("ATM 點擊")
    }

    @objc private func transferTapped() {
        print("轉帳 點擊")
    }

    @objc private func scanTapped() {
        print("掃描 點擊")
    }
}

extension FriendsViewController: FriendSearchAndAddFriendViewDelegate, FriendSearchAndFriendInviteViewDelegate {
    func focusSearch() {
        hideViewWhenFocusSearch()
        updateViewHeights()
    }

    func outFocusSearch() {
        friendsListCellViewModel.updateUserInfoHeight(userInfoHeight: 114)
        friendsListCellViewModel.updateStateViewHeight(stateViewHeight: 50)
        setUpViewState()
    }
}

extension FriendsViewController: FriendsListInviteContentViewDelegate {
    func updateInviteView(singleViewIsHidden: Bool) {
        friendsListCellViewModel.setInviteViewHidden(singleViewIsHidden)
        setUpViewState()
    }
}
