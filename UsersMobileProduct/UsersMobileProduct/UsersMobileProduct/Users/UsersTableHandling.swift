//
//  UsersTableHandling.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 15/02/24.
//

import UIKit

protocol UsersTableHandling {
	var selectedUser: User? { get set }
	
	func getUser(for index: Int) -> User
	func canDeleteUser(for index: Int) -> Bool
	func deleteUser(at index: Int)
	func proccessUserSelected(with name: String)
	func presentAlert(with message: String, and title: String)
}

extension UsersTableHandling where Self: UsersTableViewController {
	func getUser(for index: Int) -> User {
		return UserList.users[index]
	}
	
	func canDeleteUser(for index: Int) -> Bool {
		let user = getUser(for: index)
		let shouldDelete = user.name != "Manuel Kenar" && user.name != "Juan Ignacio"
		return shouldDelete
	}
	
	func deleteUser(at index: Int) {
		let user = getUser(for: index)
		UserList.users.remove(at: index)
		let indexPath = IndexPath(row: index, section: 0)
		proccessUserSelected(with: user.name)
		tableView.performBatchUpdates {
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
	func proccessUserSelected(with name: String) {
		presentAlert(with: name, and: "Usuario Eliminado")
	}
	
	func presentAlert(with message: String, and title: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default)
		alert.addAction(okAction)
		present(alert, animated: true)
	}
}
