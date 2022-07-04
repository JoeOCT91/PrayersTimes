//
//  PersonalInformationView.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import UIKit

class PersonalInformationView: UIView {

    private var scrollView = UIScrollView(frame: .zero)
    private var contentView = UIView(frame: .zero)
    private var containerStack = UIStackView(frame: .zero)

    let firstNameTextField = TextFieldWithLabel()
    var lastNameTextField = TextFieldWithLabel()
    let emailTextField = TextFieldWithLabel()
    let mobileTextField = TextFieldWithLabel()
    let countryTextField = TextFieldWithLabel()
    let cityTextfield = TextFieldWithLabel()
    let saveButton = MamlkaButton(title: L10n.saveButton, backgroundColor: ColorName.greenColor.color)

    init() {
        super.init(frame: .zero)
        backgroundColor = ColorName.grayColor.color
        configureStackView()
        configureTextFields()

        layoutScrollView()
        layoutContentView()
        layoutContainerStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(with user: User) {
        self.firstNameTextField.text = user.firstName
        self.lastNameTextField.text = user.lastName
        self.emailTextField.text = user.email
        self.mobileTextField.text = user.mobileNumber
        self.countryTextField.text = user.country
        self.cityTextfield.text = user.city
    }

    private func configureTextFields() {
        firstNameTextField.headText = L10n.firstName
        lastNameTextField.headText = L10n.lastName
        emailTextField.headText = L10n.emailHead
        mobileTextField.headText = L10n.mobileNumberPlaceHolder
        countryTextField.headText = L10n.countryPlaceHolder
        cityTextfield.headText = L10n.cityPlaceHolder
    }

    private func configureStackView() {
        let stackViews = [firstNameTextField, lastNameTextField, emailTextField, mobileTextField, countryTextField, cityTextfield, saveButton]
        containerStack.addArrangedSubviews(stackViews)
        containerStack.distribution = .fill
        containerStack.axis = .vertical
        containerStack.spacing = 35
    }

    private func layoutScrollView() {
        addSubview(scrollView)
        scrollView.anchor(top: safeAreaLayoutGuide.topAnchor,
                          left: leftAnchor,
                          bottom: safeAreaLayoutGuide.bottomAnchor,
                          right: rightAnchor)
    }

    private func layoutContentView() {
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.contentLayoutGuide.topAnchor,
                           left: scrollView.contentLayoutGuide.leftAnchor,
                           bottom: scrollView.contentLayoutGuide.bottomAnchor,
                           right: scrollView.contentLayoutGuide.rightAnchor)
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true
    }

    private func layoutContainerStackView() {
        contentView.addSubview(containerStack)
        containerStack.anchor(left: contentView.leftAnchor, right: contentView.rightAnchor, leftConstant: 30, rightConstant: 30)
        containerStack.anchorCenterYToSuperview()
    }
}
