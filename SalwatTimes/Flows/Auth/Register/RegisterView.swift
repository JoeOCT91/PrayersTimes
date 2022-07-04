//
//  RegisterView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 26/06/2022.
//

import UIKit

class RegisterView: UIView {

    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var backGroundView = UIView()
    private var containerStack = UIStackView()

    private var logoImageView = UIImageView(frame: .zero)

    var firstNameTextField = MamlkaTextField(iconName: L10n.usernameIconName, placeHolder: L10n.firstName)
    var lastNameTextField = MamlkaTextField(iconName: L10n.usernameIconName, placeHolder: L10n.lastName)
    var emailTextField = MamlkaTextField(iconName: L10n.emailIconName, placeHolder: L10n.emailAddressPlaceHolder)
    var passwordTextField = MamlkaTextField(iconName: L10n.passwordIconName, placeHolder: L10n.passwordPlaceHolder)
    var rePasswordTextField = MamlkaTextField(iconName: L10n.passwordIconName, placeHolder: L10n.rePasswordPlaceHolder)
    var mobileNumberTextfield = MamlkaTextField(iconName: L10n.mobileIconName, placeHolder: L10n.mobileNumberPlaceHolder)
    var countryTextfield = MamlkaTextField(iconName: L10n.globeIconName, placeHolder: L10n.countryPlaceHolder)
    var cityTextField = MamlkaTextField(iconName: L10n.cityIconName, placeHolder: L10n.cityPlaceHolder)
    var registerButton = MamlkaButton(title: L10n.registerButtonTitle)


    init() {
        super.init(frame: .zero)
        backgroundColor = ColorName.grayColor.color
        backGroundView.backgroundColor = ColorName.propelColor.color
        configureContainerStackView()
        configureLogoImageView()

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureLogoImageView() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = Asset.appLogo.image
    }

    func configureContainerStackView() {
        let stackViews: [UIView] =  [firstNameTextField, lastNameTextField, emailTextField, passwordTextField, rePasswordTextField, mobileNumberTextfield, countryTextfield, cityTextField, registerButton]
        containerStack.backgroundColor = ColorName.whiteColor.color
        containerStack.addArrangedSubviews(stackViews)
        containerStack.setCustomSpacing(35, after: cityTextField)
        containerStack.layerCornerRadius = 25
        containerStack.spacing = 10
        containerStack.axis = .vertical
        containerStack.isLayoutMarginsRelativeArrangement = true
        containerStack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
extension RegisterView {
    private func configureUI() {
        layoutBackGroundView()
        layoutScrollView()
        layoutContentView()
        layoutLogoImageView()
        layoutContainerView()
    }

    private func layoutBackGroundView() {
        addSubview(backGroundView)
        backGroundView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.centerYAnchor, right: rightAnchor)
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
        containerStack.anchor(top: logoImageView.bottomAnchor,
                              left: contentView.leftAnchor,
                              right: contentView.rightAnchor,
                              leftConstant: 25,
                              rightConstant: 25)
    }

    private func layoutLogoImageView() {
        contentView.addSubview(logoImageView)
        logoImageView.anchor(top: contentView.topAnchor,
                             topConstant: 25,
                             widthConstant: UIScreen.main.bounds.width * 0.45,
                             heightConstant: UIScreen.main.bounds.width * 0.45)
        logoImageView.anchorCenterXToSuperview()
    }
}
