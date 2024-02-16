//
//  LoginHandling.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 15/02/24.
//

import UIKit

protocol UserInterfaceHandling {
	func configureUIOnEmptyFields(email: String, password: String)
	func configureUIOnValidation(result: Bool)
}

extension UserInterfaceHandling where Self: LoginViewController {
	func configureUIOnEmptyFields(email: String, password: String) {
		resultLabel.textColor = UIColor.orange
		resultLabel.text = Constant.emptyField
		resultLabel.isHidden = false
		
		if email.isEmpty {
			emailTextField.layer.borderWidth = 1.0
			emailTextField.layer.borderColor = UIColor.red.cgColor
		} else {
			emailTextField.layer.borderWidth = 0.0
		}
		
		if password.isEmpty {
			passwordTextField.layer.borderWidth = 1.0
			passwordTextField.layer.borderColor = UIColor.red.cgColor
		} else {
			passwordTextField.layer.borderWidth = 0.0
		}
	}
	
	func configureUIOnValidation(result: Bool) {
		let messageInScreen: String
		
		if result {
			resultLabel.textColor = UIColor.blue
			messageInScreen = Constant.validAccess
		} else {
			resultLabel.textColor = UIColor.red
			messageInScreen = Constant.invalidAccess
		}
		
		resultLabel.text = messageInScreen
		resultLabel.isHidden = false
	}
}

protocol CredentialValidation {
	func validateCredentials(email: String, password: String) -> Bool
}

extension CredentialValidation where Self: LoginViewController {
	func validateCredentials(email: String, password: String) -> Bool {
		return email == Constant.expectedEmail && password == Constant.expectedPassword
	}
}
