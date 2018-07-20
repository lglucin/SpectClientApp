//
//  SCAAccessView.swift
//  SpectClientApp
//
//  Created by Lloyd Lucin on 7/20/18.
//  Copyright © 2018 Spect Inc. All rights reserved.
//

import UIKit

class SCAAccessView: UIView {

    // Strings.
    private let welcomeText = "Welcome!"
    private let instructionsText = "Please Login to Spect Below"
    private let accessCodeText = "Access Code"
    private let enterAccessCodeText = "Enter access code"
    private let loginText = "Login"

    // UI.
    lazy var loginButton = SCAGreenButton()
    lazy var accessCodeTextField = UITextField()
    private lazy var welcomeBackLabel = UILabel()
    private lazy var instructionsLabel = UILabel()
    private lazy var accessCodeLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        welcomeBackLabel.text = welcomeText
        welcomeBackLabel.font = SCAConstants.bigHeaderFont
        welcomeBackLabel.textColor = SCAConstants.bolderTextColor
        welcomeBackLabel.sizeToFit()
        welcomeBackLabel.textAlignment = .center
        welcomeBackLabel.adjustsFontSizeToFitWidth = true
        addSubview(welcomeBackLabel)

        instructionsLabel.text = instructionsText
        instructionsLabel.font = SCAConstants.descriptionFont
        instructionsLabel.textColor = SCAConstants.textColor
        instructionsLabel.textAlignment = .center
        instructionsLabel.adjustsFontSizeToFitWidth = true
        addSubview(instructionsLabel)

        accessCodeLabel.text = accessCodeText
        accessCodeLabel.textAlignment = .left
        accessCodeLabel.font = SCAConstants.descriptionFont?.withSmallCaps
        accessCodeLabel.sizeToFit()
        accessCodeLabel.textColor = SCAConstants.subHeaderColor
        addSubview(accessCodeLabel)

        accessCodeTextField.placeholder = enterAccessCodeText
        accessCodeTextField.font = SCAConstants.mediumDescriptionFont
        accessCodeTextField.textColor = SCAConstants.textColor
        accessCodeTextField.isSecureTextEntry = true
        let border = CALayer()
        let width = CGFloat(1)
        border.borderColor = SCAConstants.textFieldUnderlineColor.cgColor
        accessCodeTextField.sizeToFit()
        border.frame = CGRect(x: 0,
                              y: accessCodeTextField.frame.size.height - width,
                              width: frame.width - SCAConstants.doubleStandardSpacing,
                              height: 1)
        border.borderWidth = width
        accessCodeTextField.layer.addSublayer(border)
        accessCodeTextField.layer.masksToBounds = false
        addSubview(accessCodeTextField)

        loginButton.setTitle(loginText, for: .normal)
        addSubview(loginButton)

        setSnapkitConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setSnapkitConstraints() {
        welcomeBackLabel.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(SCAConstants.doubleStandardSpacing)
            } else {
                make.top.equalTo(self).offset(SCAConstants.doubleStandardSpacing)
            }
            make.centerX.equalTo(self)
        }

        instructionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeBackLabel.snp.bottom).offset(SCAConstants.standardSpacing)
            make.centerX.equalTo(self)
        }

        accessCodeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(SCAConstants.standardSpacing)
            make.centerY.equalTo(self).offset(-accessCodeLabel.frame.height)
        }

        accessCodeTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(SCAConstants.standardSpacing)
            make.top.equalTo(accessCodeLabel.snp.bottom).offset(SCAConstants.smallMargin)
            accessCodeTextField.sizeToFit()
            make.height.equalTo(accessCodeLabel.frame.height)
        }

        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(accessCodeTextField.snp.bottom).offset(SCAConstants.doubleStandardSpacing)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(SCAConstants.standardSpacing)
            make.right.equalTo(self).offset(-SCAConstants.standardSpacing)
            loginButton.titleLabel?.sizeToFit()
            make.height.equalTo((loginButton.titleLabel?.frame.height)! * 3)
        }
    }
}
