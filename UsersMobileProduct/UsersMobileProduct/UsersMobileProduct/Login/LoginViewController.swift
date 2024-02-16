//
//  LoginViewController.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 15/02/24.
//

import UIKit

class LoginViewController: UIViewController, UserInterfaceHandling, CredentialValidation {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var resultLabel: UILabel!
	
	@IBAction func logInButton(_ sender: UIButton) {
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
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == LoginConstants.identifier {
			emailTextField.resignFirstResponder()
			passwordTextField.resignFirstResponder()
			emailTextField.text = ""
			passwordTextField.text = ""
			resultLabel.text = ""
		}
	}
}
