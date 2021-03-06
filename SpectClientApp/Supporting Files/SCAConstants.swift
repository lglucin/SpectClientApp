//
//  SCAConstants.swift
//  SpectClientApp
//
//  Created by Lloyd Lucin on 7/14/18.
//  Copyright © 2018 Spect Inc. All rights reserved.
//

import Foundation
import UIKit

class SCAConstants {
    // Spacing
    static let doubleStandardSpacing : CGFloat = SCAConstants.standardSpacing * 2
    static let smallMargin : CGFloat = 8
    static let standardSpacing : CGFloat = 20

    // Dimensions
    static let iconSquareDimension = 30

    // Fonts
    // NOTE: Avenir Next was chosen rather than the style guide "Lato" for two reasons:
    //   - Avenir Next is compatible with small caps (see SCAAccessView).
    //   - Did not want to waste time importing the Lato font.
    static let bigHeaderFont = UIFont(name: "Avenir Next", size: 40)
    static let descriptionFont = UIFont(name: "Avenir Next", size: 20)
    static let descriptionFontBold = UIFont(name: "AvenirNext-DemiBold", size: 20)
    static let mediumDescriptionFont = UIFont(name: "Avenir Next", size: 25)
    static let mediumHeaderFont = UIFont(name: "Avenir Next", size: 30)
    static let smallDetailedFont = UIFont(name: "Avenir Next", size: 15)

    // Colors
    static let primaryGreen = #colorLiteral(red: 0.3843137255, green: 0.8117647059, blue: 0.7333333333, alpha: 1)
    static let secondaryOrange = #colorLiteral(red: 0.9333333333, green: 0.4588235294, blue: 0.2823529412, alpha: 1)
    static let tertiaryBlack = #colorLiteral(red: 0.1843137255, green: 0.1882352941, blue: 0.2, alpha: 1)
    static let textColor = #colorLiteral(red: 0.4117647059, green: 0.4196078431, blue: 0.4156862745, alpha: 1)
    static let subHeaderColor = #colorLiteral(red: 0.7490196078, green: 0.7490196078, blue: 0.7490196078, alpha: 1)
    static let textFieldUnderlineColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
    static let bolderTextColor = #colorLiteral(red: 0.1843137255, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
    static let hoverOverButtonColor = #colorLiteral(red: 0.3098039216, green: 0.631372549, blue: 0.5764705882, alpha: 1)
    static let disabledButtonColor = #colorLiteral(red: 0.5294117647, green: 0.537254902, blue: 0.5490196078, alpha: 1)
}
