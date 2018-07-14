//
//  SCAGreenButton.swift
//  SpectClientApp
//
//  Created by Lloyd Lucin on 7/14/18.
//  Copyright © 2018 Spect Inc. All rights reserved.
//

import UIKit

class SCAGreenButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        self.titleLabel?.font = SCAConstants.descriptionFont
        self.titleLabel?.textAlignment = .center
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.gray, for: .disabled)
        self.backgroundColor = SCAConstants.primaryGreen
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.layer.borderWidth = 0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted
                ? SCAConstants.primaryGreen
                : SCAConstants.hoverOverButtonColor
        }
    }

    override open var isUserInteractionEnabled: Bool {
        didSet {
            backgroundColor = isUserInteractionEnabled
                ? SCAConstants.hoverOverButtonColor
                : SCAConstants.disabledButtonColor
        }
    }
}
