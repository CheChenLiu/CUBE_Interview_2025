//
//  OnboardingViewController.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/4/2.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "請選擇顯示樣式"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let option1Button = UIButton.createOptionButton(title: "無好友畫面")
    private let option2Button = UIButton.createOptionButton(title: "只有好友列表")
    private let option3Button = UIButton.createOptionButton(title: "好友列表含邀請")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        
        option1Button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        option2Button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        option3Button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
    }
    
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, option1Button, option2Button, option3Button])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
    }
    
    @objc private func optionSelected(_ sender: UIButton) {
        guard let option = sender.titleLabel?.text else { return }
        
        if option == "無好友畫面" {
            viewState = .noneFriends
        } else if option == "只有好友列表" {
            viewState = .onlyFriends
        } else if option == "好友列表含邀請" {
            viewState = .friensWithInvite
        }
        
        // 切換到主畫面
        let tabBarVC = MainTabBarController()
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let windowSceneDelegate = scene.delegate as? SceneDelegate,
           let window = windowSceneDelegate.window {
            window.rootViewController = tabBarVC
            window.makeKeyAndVisible()
        }
    }
}

extension UIButton {
    static func createOptionButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }
}
