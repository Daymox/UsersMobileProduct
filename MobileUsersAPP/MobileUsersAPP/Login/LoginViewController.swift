//
//  LoginViewController.swift
//  MobileUsersAPP
//
//  Created by Johan Mateo Garcia Rios on 18/02/24.
//

import UIKit

class LoginViewController: UIViewController, UserInterfaceHandling, CredentialsValidation {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBAction func LogInButton(_ sender: UIButton) {
		let email = emailTextField.text ?? ""
		let password = passwordTextField.text ?? ""
		
		if (email.isEmpty || password.isEmpty) {
			configureUIOnEmptyFields(email: email, password: password)
			return
		}
		
		let credentialsAreValid = validateCredentials(email: email, password: password)
		configureUIOnValidation(result: credentialsAreValid)
		
		if credentialsAreValid {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.performSegue(withIdentifier: LoginConstants.identifier, sender: self)
			}
		}
	}
	@IBOutlet weak var TestCredentialsLabel: UILabel!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == LoginConstants.identifier {
			emailTextField.resignFirstResponder()
			passwordTextField.resignFirstResponder()
			emailTextField.text = ""
			passwordTextField.text = ""
			TestCredentialsLabel.text = ""
		}
	}
	
}
