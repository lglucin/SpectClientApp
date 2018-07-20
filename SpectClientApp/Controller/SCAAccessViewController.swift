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

    // Access Code
    private var accessCode = "455B"

    // View.
    private var accessView : SCAAccessView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"

        accessView = SCAAccessView(frame: view.frame)
        accessView.loginButton.isUserInteractionEnabled = false
        accessView.accessCodeTextField.delegate = self
        accessView.accessCodeTextField.addTarget(self,
                                                 action: #selector(self.textDidChange),
                                                 for: .editingChanged)

        view = accessView

        let tap: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self,
                                   action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // Disable the login button unless the user types enough characters.
    @objc private func textDidChange() {
        guard let text = accessView.accessCodeTextField.text else {
            accessView.loginButton.isUserInteractionEnabled = false
            return
        }
        if text.count >= accessCode.count {
            accessView.loginButton.isUserInteractionEnabled = true
        } else {
            accessView.loginButton.isUserInteractionEnabled = false
        }
    }
}

extension SCAAccessViewController : UITextFieldDelegate {
    // Dismiss the keyboard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
