//
//  GradientView.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import UIKit

class GradientView: UIView {
    private let gradientLayer = CAGradientLayer()
    var leftColor: UIColor
    var rightColor: UIColor
    var startPoint: CGPoint
    var endPoint: CGPoint
    
    init(leftColor: UIColor, rightColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        self.leftColor = leftColor
        self.rightColor = rightColor
        self.startPoint = startPoint
        self.endPoint = endPoint
        
        super.init(frame: .zero)
        setupGradientLayer()
    }

    override init(frame: CGRect) {
        self.leftColor = .black
        self.rightColor = .white
        self.startPoint = CGPoint(x: 0, y: 0.5)
        self.endPoint = CGPoint(x: 1, y: 0.5)
        super.init(frame: frame)
        setupGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        self.leftColor = .black
        self.rightColor = .white
        self.startPoint = CGPoint(x: 0, y: 0.5)
        self.endPoint = CGPoint(x: 1, y: 0.5)
        super.init(coder: coder)
        setupGradientLayer()
    }

    private func setupGradientLayer() {
        gradientLayer.colors = [
            leftColor.cgColor,  // 左邊深色
            rightColor.cgColor   // 右邊淺色
        ]
        gradientLayer.startPoint = startPoint  // 從左開始
        gradientLayer.endPoint = endPoint    // 到右結束
        layer.insertSublayer(gradientLayer, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds  // 確保漸層大小正確
    }
}

