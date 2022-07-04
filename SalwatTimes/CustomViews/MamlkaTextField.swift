//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import UIKit
import CombineCocoa

class MamlkaTextField: UITextField {

    // MARK: - Properties
    private var rectHeight: CGFloat = 45
    private var padding = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 45)
    private var textFont = UIFont(font: FontFamily.BahijTheSansArabic.bold, size: 16)
    private var placeHolderText = String()

    private let errorLabel = UILabel(frame: .zero)

    // Life cycle methods
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func borderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    init(iconName: String, placeHolder: String) {
        self.placeHolderText = placeHolder
        super.init(frame: .zero)
        self.setup()
        self.setIcon(iconName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func setErrorText(error: String?) {
        errorLabel.text = error
    }

    // MARK: - Private methods
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: rectHeight).isActive = true
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorName.lightGray.color.cgColor
        self.textColor = ColorName.blackColor.color
        self.textAlignment = .right
        self.backgroundColor = ColorName.whiteColor.color
        self.font = textFont
        self.attributedPlaceholder = NSAttributedString(
            string: placeHolderText,
            attributes: [NSAttributedString.Key.foregroundColor: ColorName.lightGray.color]
        )
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.addGestureRecognizer(tap)
    }

    @objc private func handleTap(sender: MamlkaTextField) {
        self.isUserInteractionEnabled = true
        self.becomeFirstResponder()
    }

    func setIcon(_ imageName: String) {
        self.leftViewMode = .always
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        let image = UIImage(systemName: imageName, withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: image?.withTintColor(ColorName.propelColor.color) )
        imageView.translatesAutoresizingMaskIntoConstraints = true

        let outerView = UIView()
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.addSubview(imageView)

        outerView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: imageView.frame.size.width + 23,
                height: imageView.frame.size.height
            )
        )

        imageView.center = CGPoint(
            x: (outerView.bounds.size.width) / 2,
            y: outerView.bounds.size.height / 2
        )
        self.leftView = outerView
    }

}
