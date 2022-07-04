//
//  TextFieldWithLabel.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit

class TextFieldWithLabel: UITextField {

    private let headLabel: PaddingLabel = {
        let label = PaddingLabel()
        let font = UIFont(font: FontFamily.BahijTheSansArabic.plain, size: 14)
        label.font = font
        label.textAlignment = .natural
        label.paddingLeft = 12
        label.paddingRight = 12
        return label
    }()

    internal var headText: String? {
        willSet {
            headLabel.text = newValue
        }
    }

    private var padding = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 45)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    init() {
        super.init(frame: .zero)
        setup()
        setViewHeight()
        layoutHeadLabel()
        headLabel.text = "has not been implemented"
        bringSubviewToFront(headLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        textAlignment = .right
        layerBorderColor = ColorName.propelColor.color
        layerBorderWidth = 1
        layerCornerRadius = 12
        clipsToBounds = false
    }

    private func setViewHeight() {
        self.translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    private func layoutHeadLabel() {
        self.addSubview(headLabel)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            headLabel.bottomAnchor.constraint(equalTo: topAnchor,constant:  -4)
        ])
    }
}
