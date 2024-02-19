//
//  LoginHandling.swift
//  MobileUsersAPP
//
//  Created by Johan Mateo Garcia Rios on 18/02/24.
//

import UIKit

protocol UserInterfaceHandling {
	func configureUIOnEmptyFields(email: String, password: String)
	func configureUIOnValidation(result: Bool)
}

protocol CredentialsValidation {
	func validateCredentials(email: String, password: String) -> Bool
}

extension UserInterfaceHandling where Self: LoginViewController {
	func configureUIOnEmptyFields(email: String, password: String) {
		TestCredentialsLabel.textColor = UIColor.orange
		TestCredentialsLabel.text = LoginConstants.emptyField
		TestCredentialsLabel.isHidden = false
		
		if email.isEmpty {
			emailTextField.layer.borderWidth = 1.0
			emailTextField.layer.borderColor = UIColor.red.cgColor
		}
		
		if password.isEmpty {
			passwordTextField.layer.borderWidth = 1.0
			passwordTextField.layer.borderColor = UIColor.red.cgColor
		}
	}
	
	func configureUIOnValidation(result: Bool) {
		let messageInScreen: String
		
		if result {
			TestCredentialsLabel.textColor = UIColor.blue
			messageInScreen = LoginConstants.validAccess
		} else {
			TestCredentialsLabel.textColor = UIColor.red
			messageInScreen = LoginConstants.invalidAccess
		}
		
		TestCredentialsLabel.text = messageInScreen
		TestCredentialsLabel.isHidden = false
	}
}

extension CredentialsValidation where Self: LoginViewController {
	func validateCredentials(email: String, password: String) -> Bool {
		return email == LoginConstants.expectedEmail && password == LoginConstants.expectedPassword
	}
}
