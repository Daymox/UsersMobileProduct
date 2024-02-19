//
//  UserHandling.swift
//  MobileUsersAPP
//
//  Created by Johan Mateo Garcia Rios on 18/02/24.
//

import Foundation

protocol UserHandlingProtocol {
	func setViewController(_ viewController: UsersListViewControllerProtocol)
	func getUser(for index: Int) -> User
	func getNumberOfUsers() -> Int
	func canDeleteUser(for index: Int) -> Bool
	func deleteUser(at index: Int)
	func processUserDeleted(at index: Int)
}

class UserHandling {
	weak var viewController: UsersListViewControllerProtocol?
	let usersStorage: UsersStorageProtocol = UsersStorage()
}

extension UserHandling: UserHandlingProtocol {
	func setViewController(_ viewController: UsersListViewControllerProtocol) {
		self.viewController = viewController
	}
	
	func getUser(for index: Int) -> User {
		return usersStorage.getUser(for: index)
	}
	
	func getNumberOfUsers() -> Int {
		return usersStorage.getNumberOfUser()
	}
	
	func canDeleteUser(for index: Int) -> Bool {
		let user = getUser(for: index)
		return user.name != "Manuel Kenar" && user.name != "Juan Ignacio"
	}
	
	func deleteUser(at index: Int) {
		guard let viewController = viewController else {
			return
		}
		usersStorage.deleteUser(at: index)
		viewController.deleteRow(at: index)
	}
	
	func processUserDeleted(at index: Int) {
		guard let viewController = viewController else {
			return
		}
		let user = usersStorage.getUser(for: index)
		viewController.presentAlert(with: "Usuario Eliminado", and: user.name)
	}

}
