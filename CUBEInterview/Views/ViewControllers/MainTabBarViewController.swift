//
//  MainTabBarViewController.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class MainTabBarController: UITabBarController {
    lazy var topLineView: UIView = {
       let view = UIView()
        view.backgroundColor = .grayEFEFEF
        return view
    }()
    
    let centerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupNavigationBar()
        setupCenterButton()
        
        self.selectedIndex = 1
    }

    private func setupTabBar() {
        let moneyVC = MoneyViewController()
        let friendsVC = FriendsViewController()
        let kokoVC = UIViewController()
        let recordsVC = MoneyRecordsViewController()
        let settingsVC = SettingViewController()
        
        let moneyNav = UINavigationController(rootViewController: moneyVC)
        let friendsNav = UINavigationController(rootViewController: friendsVC)
        let recordsNav = UINavigationController(rootViewController: recordsVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)

        moneyNav.tabBarItem = UITabBarItem(title: "錢錢",
                                           image: UIImage(named: "icTabbarProductsOff"),
                                           selectedImage: UIImage(named: "icTabbarProductsOff"))
        friendsNav.tabBarItem = UITabBarItem(title: "朋友",
                                             image: UIImage(named: "icTabbarFriendsOn"),
                                             selectedImage: UIImage(named: "icTabbarFriendsOn"))
        kokoVC.tabBarItem = UITabBarItem(title: "",
                                         image: nil,
                                         selectedImage: nil)
        recordsNav.tabBarItem = UITabBarItem(title: "記帳",
                                             image: UIImage(named: "icTabbarManageOff"),
                                             selectedImage: UIImage(named: "icTabbarManageOff"))
        settingsNav.tabBarItem = UITabBarItem(title: "設定",
                                              image: UIImage(named: "icTabbarSettingOff"),
                                              selectedImage: UIImage(named: "icTabbarSettingOff"))

        viewControllers = [moneyNav, friendsNav, kokoVC, recordsNav, settingsNav]

        tabBar.tintColor = UIColor.pinkEC008C
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    private func setupCenterButton() {
        view.addSubview(topLineView)
        topLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topLineView, attribute: .top, relatedBy: .equal, toItem: tabBar, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topLineView, attribute: .width, relatedBy: .equal, toItem: tabBar, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topLineView, attribute: .centerX, relatedBy: .equal, toItem: tabBar, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0.5).isActive = true
        
        centerButton.setImage(UIImage(named: "icTabbarHomeOff"), for: .normal)
        centerButton.backgroundColor = UIColor.clear
        
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerButton)
        NSLayoutConstraint(item: centerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 85).isActive = true
        NSLayoutConstraint(item: centerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 68).isActive = true
        NSLayoutConstraint(item: centerButton, attribute: .centerX, relatedBy: .equal, toItem: tabBar, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: centerButton, attribute: .top, relatedBy: .equal, toItem: tabBar, attribute: .top, multiplier: 1.0, constant: -13).isActive = true
        
        centerButton.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
        centerButton.adjustsImageWhenHighlighted = false
    }

    @objc private func centerButtonTapped() {
        print("KOKO 按鈕被點擊！")
        selectedIndex = 2 // 點擊後切換到KOKO
    }
}
