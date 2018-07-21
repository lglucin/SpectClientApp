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
        titleLabel?.font = SCAConstants.descriptionFontBold
        titleLabel?.textAlignment = .center
        setTitleColor(.white, for: .normal)
        setTitleColor(.gray, for: .disabled)
        backgroundColor = SCAConstants.primaryGreen
        layer.cornerRadius = 20
        clipsToBounds = true
        layer.borderWidth = 0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted
                ? SCAConstants.hoverOverButtonColor
                : SCAConstants.primaryGreen
        }
    }

    override open var isUserInteractionEnabled: Bool {
        didSet {
            backgroundColor = isUserInteractionEnabled
                ? SCAConstants.primaryGreen
                : SCAConstants.disabledButtonColor
            let titleColor : UIColor = isUserInteractionEnabled ? .white : #colorLiteral(red: 0.7585542798, green: 0.7629072666, blue: 0.7736519575, alpha: 1)
            setTitleColor(titleColor, for: .normal)
        }
    }
}
