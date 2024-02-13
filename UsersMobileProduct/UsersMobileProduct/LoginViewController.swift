//
//  ViewController.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 8/02/24.
//

import UIKit

class LoginViewController: UIViewController {
	
	private struct Constant {
		static let expectedEmail = "admin@veritran.com"
		static let expectedPassword = "qwerty"
		static let emptyField = "Empty Field"
		static let validAccess = "Valid Access"
		static let invalidAccess = "Invalid Access"
		static let identifier = "usersMobileProduct"
	}
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBAction func logInButton(_ sender: UIButton) {
		ProccessCredentials()
	}
	@IBOutlet weak var resultLabel: UILabel!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constant.identifier {
			emailTextField.resignFirstResponder()
			passwordTextField.resignFirstResponder()
			emailTextField.text = ""
			passwordTextField.text = ""
			resultLabel.text = ""
		}
	}
	
	func ProccessCredentials() {
		let email = emailTextField.text ?? ""
		let password = passwordTextField.text ?? ""
		
		if (email.isEmpty || password.isEmpty) {
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
			
			return
		}
		
		let credentialsAreValid = ValidateCredentials(email: email, password: password)
		ProccessValidationResult(result: credentialsAreValid)
		if credentialsAreValid {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.performSegue(withIdentifier: Constant.identifier, sender: self)
			}
		}
	}
	
	func ValidateCredentials(email: String, password: String) -> Bool {
		return email == Constant.expectedEmail && password == Constant.expectedPassword
	}
	
	func ProccessValidationResult(result: Bool) {
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

