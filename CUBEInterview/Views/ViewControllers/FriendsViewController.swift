//
//  FriendsViewController.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class FriendsViewController: UIViewController {
    let friendsViewViewModel = FriendsViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigationBar()
    }
    
    private func dataBinding() {
        friendsViewViewModel.onDataChange = {
            
        }
    }

    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear // 移除底部線條
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .systemPink
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
