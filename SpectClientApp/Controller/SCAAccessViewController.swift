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
    private let accessCode = "455B"
    private let loginText = "Login"
    private let loginError = "Login Error"
    private let incorrectAccessCodeError = "Invalid access code. Please try again."
    private let noTextEnteredError = "Please type in the access code in order to login."
    private let dismissModalText = "OK"

    // View.
    private var accessView : SCAAccessView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = loginText

        accessView = SCAAccessView(frame: view.frame)
        accessView.loginButton.isUserInteractionEnabled = false
        accessView.loginButton.addTarget(self,
                                         action: #selector(self.loginButtonTapped),
                                         for: .touchUpInside)
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

    // Disable the login button unless the user types.
    @objc private func textDidChange() {
        guard let text = accessView.accessCodeTextField.text else {
            accessView.loginButton.isUserInteractionEnabled = false
            return
        }
        if !text.isEmpty  {
            accessView.loginButton.isUserInteractionEnabled = true
        } else {
            accessView.loginButton.isUserInteractionEnabled = false
        }
    }

    @objc private func loginButtonTapped() {
        attemptLogin()
    }

    private func attemptLogin() {
        guard let text = accessView.accessCodeTextField.text else {
            displayErrorMessage()
            return
        }
        if text == accessCode {
            // TODO: Navigate to the next page.
            print("yay")
        } else {
            displayErrorMessage(text: text)
        }
    }

    private func displayErrorMessage(text: String = "") {
        let error = text.isEmpty ? noTextEnteredError : incorrectAccessCodeError
        let alert = UIAlertController(title: loginError, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: dismissModalText, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension SCAAccessViewController : UITextFieldDelegate {
    // Dismiss the keyboard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        attemptLogin()
        return true
    }
}
