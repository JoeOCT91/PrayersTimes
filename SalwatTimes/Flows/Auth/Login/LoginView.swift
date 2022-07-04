//
//  LoginView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//

import UIKit
import SwifterSwift

class LoginView: UIView {

    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var backGroundView = UIView()
    private var containerStack = UIStackView()

    private var logoImageView = UIImageView(frame: .zero)
    private var headTitle = UILabel(text: L10n.loginWelcomeTitle)
    private var errorLabel = UILabel()

    var emailTextField = MamlkaTextField(iconName: L10n.emailIconName, placeHolder: L10n.emailAddressPlaceHolder)
    var passwordTextField = MamlkaTextField(iconName: L10n.passwordIconName, placeHolder: L10n.passwordPlaceHolder)
    var loginButton = MamlkaButton(title: L10n.loginButtonTitle)
    var registerButton = MamlkaButton(title: L10n.registerButtonTitle, backgroundColor: ColorName.whiteColor.color)

    init() {
        super.init(frame: .zero)
        backgroundColor = ColorName.grayColor.color
        backGroundView.backgroundColor = ColorName.propelColor.color
        configureLogoImageView()
        configureContainerStackView()
        configureHeadTitle()
        configureRegisterButon()
        configureErrorLabel()
        configurePasswordTextField()
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setErrorLabel(errorValue: String?, errorState: Bool) {
        // self.animateErrorLabel(state: !errorState)
        // errorLabel.isHidden = !errorState
        errorLabel.text = errorValue
    }

    private func configureLogoImageView() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = Asset.appLogo.image
    }

    private func configureContainerStackView() {
        let stackViews = [headTitle, errorLabel, emailTextField, passwordTextField, loginButton, registerButton]
        containerStack.backgroundColor = ColorName.whiteColor.color
        containerStack.addArrangedSubviews(stackViews)
        containerStack.setCustomSpacing(25, after: passwordTextField)
        containerStack.setCustomSpacing(25, after: headTitle)
        containerStack.layerCornerRadius = 25
        containerStack.spacing = 10
        containerStack.axis = .vertical
        containerStack.isLayoutMarginsRelativeArrangement = true
        containerStack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    private func configureHeadTitle() {
        headTitle.font = UIFont(font: FontFamily.BahijTheSansArabic.bold, size: 18)
        headTitle.textAlignment = .center
        headTitle.numberOfLines = 1
    }

    func configureLoginTextfield() {

    }

    func configurePasswordTextField() {
        passwordTextField.isSecureTextEntry = true
    }
    
    func configureRegisterButon() {
        registerButton.layerBorderWidth = 1
        registerButton.layerBorderColor = ColorName.propelColor.color
        registerButton.setTitleColorForAllStates(ColorName.propelColor.color)
    }

    func configureErrorLabel() {
        errorLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.plain, size: 16)
        errorLabel.textColor = .red
    }
}

extension LoginView {
    private func configureUI() {
        layoutBackGroundView()
        layoutScrollView()
        layoutContentView()
        layoutContainerView()
        layoutLogoImageView()
        layoutSkipButton()

    }

    private func layoutBackGroundView() {
        addSubview(backGroundView)
        backGroundView.anchor(top: topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.centerYAnchor, right: rightAnchor)
    }

    private func layoutScrollView() {
        addSubview(scrollView)
        scrollView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    private func layoutContentView() {
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.contentLayoutGuide.topAnchor,
                           left: scrollView.contentLayoutGuide.leftAnchor,
                           bottom: scrollView.contentLayoutGuide.bottomAnchor,
                           right: scrollView.contentLayoutGuide.rightAnchor)
        contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }

    private func layoutContainerView() {
        contentView.addSubview(containerStack)
        containerStack.anchor(left: contentView.leftAnchor, right: contentView.rightAnchor, leftConstant: 30, rightConstant: 30)
        containerStack.anchorCenterSuperview()
    }

    private func layoutLogoImageView() {
        contentView.addSubview(logoImageView)
        logoImageView.anchor(bottom: containerStack.topAnchor,
                             bottomConstant: 25,
                             widthConstant: UIScreen.main.bounds.width * 0.45,
                             heightConstant: UIScreen.main.bounds.width * 0.45)
        logoImageView.anchorCenterXToSuperview()
    }

    private func layoutSkipButton() {
//        contentView.addSubview(skipButton)
//        skipButton.anchor(bottom: contentView.bottomAnchor, bottomConstant: 30)
//        skipButton.anchorCenterXToSuperview()
    }
}
