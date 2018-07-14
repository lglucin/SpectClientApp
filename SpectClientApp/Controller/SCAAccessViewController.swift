//
//  SCAAccessViewController.swift
//  SpectClientApp
//
//  Created by Lloyd Lucin on 7/13/18.
//  Copyright © 2018 Spect Inc. All rights reserved.
//

import UIKit
import SnapKit

class SCAAccessViewController : UIViewController {

    // Strings.
    private let welcomeText = "Welcome!"
    private let instructionsText = "Please Login to Spect Below"
    private let accessCodeText = "Access Code"
    private let enterAccessCodeText = "Enter Access Code"
    private let loginText = "Login"

    // UI.
    private lazy var welcomeBackLabel = UILabel()
    private lazy var instructionsLabel = UILabel()
    private lazy var accessCodeLabel = UILabel()
    private lazy var accessCodeTextField = UITextField()
    private lazy var loginButton = SCAGreenButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = loginText

        // TODO: Set style for nav bar.
        welcomeBackLabel.text = welcomeText
        welcomeBackLabel.font = SCAConstants.bigHeaderFont
        welcomeBackLabel.textColor = SCAConstants.bolderTextColor
        welcomeBackLabel.sizeToFit()
        welcomeBackLabel.textAlignment = .center
        welcomeBackLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(welcomeBackLabel)

        instructionsLabel.text = instructionsText
        instructionsLabel.font = SCAConstants.descriptionFont
        instructionsLabel.textColor = SCAConstants.textColor
        instructionsLabel.textAlignment = .center
        instructionsLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(instructionsLabel)

        accessCodeLabel.text = accessCodeText
        accessCodeLabel.textAlignment = .left
        accessCodeLabel.font = SCAConstants.descriptionFont?.withSmallCaps
        accessCodeLabel.sizeToFit()
        // TODO: Make this the type of font that is all caps but not really.
        accessCodeLabel.textColor = SCAConstants.subHeaderColor
        view.addSubview(accessCodeLabel)

        accessCodeTextField.placeholder = enterAccessCodeText
        accessCodeTextField.font = SCAConstants.descriptionFont
        accessCodeTextField.textColor = SCAConstants.textColor
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0,
                              y: accessCodeTextField.frame.size.height - width,
                              width: accessCodeTextField.frame.size.width,
                              height: accessCodeTextField.frame.size.height)
        border.borderWidth = width
        accessCodeTextField.layer.addSublayer(border)
        accessCodeTextField.layer.masksToBounds = true
        view.addSubview(accessCodeTextField)

        loginButton.setTitle(loginText, for: .normal)
        view.addSubview(loginButton)

        setSnapkitConstraints()
    }

    private func setSnapkitConstraints() {
        welcomeBackLabel.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide).offset(SCAConstants.doubleStandardSpacing)
            } else {
                make.top.equalTo(view).offset(SCAConstants.doubleStandardSpacing)
            }
            make.centerX.equalTo(view)
        }

        instructionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeBackLabel.snp.bottom).offset(SCAConstants.standardSpacing)
            make.centerX.equalTo(view)
        }

        accessCodeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(SCAConstants.standardSpacing)
            make.centerY.equalTo(view)
        }

        accessCodeTextField.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(SCAConstants.standardSpacing)
            make.top.equalTo(accessCodeLabel.snp.bottom).offset(SCAConstants.smallMargin)
        }

        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(accessCodeTextField.snp.bottom).offset(SCAConstants.doubleStandardSpacing)
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(SCAConstants.standardSpacing)
            make.right.equalTo(view).offset(-SCAConstants.standardSpacing)
            loginButton.titleLabel?.sizeToFit()
            make.height.equalTo((loginButton.titleLabel?.frame.height)! * 4)
        }
    }
}

extension UIFont {

    var withSmallCaps: UIFont {
        let upperCaseFeature = [
            UIFontDescriptor.FeatureKey.featureIdentifier : kUpperCaseType,
            UIFontDescriptor.FeatureKey.typeIdentifier : kUpperCaseSmallCapsSelector
        ]
        let lowerCaseFeature = [
            UIFontDescriptor.FeatureKey.featureIdentifier : kLowerCaseType,
            UIFontDescriptor.FeatureKey.typeIdentifier : kLowerCaseSmallCapsSelector
        ]
        let features = [upperCaseFeature, lowerCaseFeature]
        let smallCapsDescriptor = self.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.featureSettings : features])
        return UIFont(descriptor: smallCapsDescriptor, size: pointSize)
    }
}
