//
//  SettingView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit

class SettingsView: UIView {

    private var scrollView = UIScrollView(frame: .zero)
    private var contentView = UIView()
    private var backgroundView = UIView()
    private var basicInformationStack = UIStackView(frame: .zero)
    private var balanceStack = UIStackView(frame: .zero)
    private var buttonsStack = UIStackView(frame: .zero)

    private var userImageView = UIImageView(frame: .zero)
    private var userFullNameLabel = UILabel(frame: .zero)

    private let stackCornerRadius: CGFloat = 12
    private let sidePadding: CGFloat = 45

    private var sepLineView: UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = ColorName.grayColor.color
        return view
    }

    var personalInfoTapGesture = UITapGestureRecognizer()
    var changePasswordTapGesture = UITapGestureRecognizer()
    var logoutTapGesture = UITapGestureRecognizer()

    init() {
        super.init(frame: .zero)
        backgroundColor = ColorName.grayColor.color
        backgroundView.backgroundColor = ColorName.propelColor.color
        configureUserNameLabel()
        configureUserImageView()
        configureBasicInformationStack()

        configureButtonStackView()

        // layouts functions
        layoutScrollView()
        layoutContainerView()
        layoutBasicInformationStack()
        layoutBackgroundView()
        layoutUserImageView()
        layoutBalanceStack()
        layoutButtonsStack()
        contentView.sendSubviewToBack(backgroundView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureBasicInformationStack() {
        let stackViews = [userImageView, userFullNameLabel]
        basicInformationStack.addArrangedSubviews(stackViews)
        basicInformationStack.axis = .horizontal
        basicInformationStack.backgroundColor = ColorName.whiteColor.color
        basicInformationStack.layerCornerRadius = stackCornerRadius
        basicInformationStack.distribution = .fill
        basicInformationStack.spacing = 25
        basicInformationStack.layoutMargins = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        basicInformationStack.isLayoutMarginsRelativeArrangement = true
        basicInformationStack.backgroundColor = ColorName.whiteColor.color
    }

    private func configureUserImageView() {
        let image = UIImage(asset: Asset.userImagePlaceHolder)
        self.userImageView.image = image
    }

    private func configureUserNameLabel() {
        userFullNameLabel.textAlignment = .right
        userFullNameLabel.numberOfLines = 0
        let name = "يوسف محمد السروي"

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0 //

        let welcomeAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.bold, size: 18)]
        let nameAttributes = [NSAttributedString.Key.foregroundColor: ColorName.propelColor.color,
                               NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.plain, size: 16)]

        let welcome = NSMutableAttributedString(string: L10n.welcome, attributes: welcomeAttributes as [NSAttributedString.Key : Any])
        let nameAttributedString = NSMutableAttributedString(string: "\n\(name)", attributes: nameAttributes as [NSAttributedString.Key: Any])
        welcome.append(nameAttributedString)
        let range = NSMakeRange(0, welcome.length)
        welcome.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: range)

        userFullNameLabel.attributedText = welcome
    }

    private func configureButtonStackView() {
        let basicInformationImage = UIImage(asset: Asset.userInformationIcon)
        let logoutImage = UIImage(asset: Asset.logoutIcon)
        let basicInformation = createButtonStackView(viewTitle: L10n.personalInformations, viewIcon: basicInformationImage)
        let changePassword = createButtonStackView(viewTitle: L10n.changePassword, viewIcon: basicInformationImage)
        let logout = createButtonStackView(viewTitle: L10n.logout, viewIcon: logoutImage)
        basicInformation.addGestureRecognizer(personalInfoTapGesture)
        changePassword.addGestureRecognizer(changePasswordTapGesture)
        logout.addGestureRecognizer(logoutTapGesture)

        let buttonsStackViews = [basicInformation, changePassword, logout]
        buttonsStack.addArrangedSubviews(buttonsStackViews)
        buttonsStack.axis = .vertical
        buttonsStack.distribution = .fill
        buttonsStack.layoutMargins = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        buttonsStack.backgroundColor = ColorName.whiteColor.color
        buttonsStack.isLayoutMarginsRelativeArrangement = true
    }

    private func createButtonStackView(viewTitle: String, viewIcon: UIImage?) -> UIView {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .light)
        let arrowIcon = UIImage(systemName: "chevron.left", withConfiguration: iconConfig)?.withTintColor(.random, renderingMode: .alwaysOriginal)
        let containerStack = UIStackView(frame: .zero)
        let iconImageView = UIImageView(image: viewIcon)
        let titleLabel = UILabel(text: viewTitle)
        let arrowImageView = UIImageView(image: arrowIcon)

        titleLabel.textAlignment = .right
        titleLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.light, size: 16)

        let imageIconConstant: CGFloat = 26
        iconImageView.widthAnchor.constraint(equalToConstant: imageIconConstant).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: imageIconConstant).isActive = true

        let bottomLine = sepLineView
        containerStack.addSubview(bottomLine)
        bottomLine.anchor(left: containerStack.leftAnchor, bottom: containerStack.bottomAnchor, right: containerStack.rightAnchor)

        let containerStackViews = [iconImageView, titleLabel, arrowImageView]
        containerStack.addArrangedSubviews(containerStackViews)
        containerStack.layoutMargins = UIEdgeInsets(top: 18, left: 0, bottom: 26, right: 0)
        containerStack.isLayoutMarginsRelativeArrangement = true

        containerStack.axis = .horizontal
        containerStack.spacing = 25
        containerStack.distribution = .fill
        return containerStack
    }

    func layoutScrollView() {
        addSubview(scrollView)
        scrollView.anchor(top: safeAreaLayoutGuide.topAnchor,
                          left: leftAnchor,
                          bottom: safeAreaLayoutGuide.bottomAnchor,
                          right: rightAnchor)
    }

    func layoutContainerView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
    }

    private func layoutBackgroundView() {
        contentView.addSubview(backgroundView)
        backgroundView.anchor(top: topAnchor,
                              left: contentView.leftAnchor,
                              bottom: basicInformationStack.centerYAnchor,
                              right: contentView.rightAnchor)
    }

    private func layoutBasicInformationStack() {
        contentView.addSubview(basicInformationStack)
        basicInformationStack.anchor(top: contentView.topAnchor,
                                     left: contentView.leftAnchor,
                                     right: contentView.rightAnchor,
                                     topConstant: 100,
                                     leftConstant: sidePadding,
                                     rightConstant: sidePadding)
    }

    private func layoutUserImageView() {
        let constant: CGFloat  = 75
        userImageView.anchor(widthConstant: constant, heightConstant: constant)
    }

    private func layoutBalanceStack() {
        contentView.addSubview(balanceStack)
        balanceStack.anchor(top: basicInformationStack.bottomAnchor,
                            left: basicInformationStack.leftAnchor,
                            right: basicInformationStack.leftAnchor)
    }

    private func layoutButtonsStack() {
        contentView.addSubview(buttonsStack)
        buttonsStack.anchor(top: basicInformationStack.bottomAnchor,
                            left: basicInformationStack.leftAnchor,
                            right: basicInformationStack.rightAnchor,
                            topConstant: 18)
    }
}
