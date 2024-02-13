//
//  UsersTableViewController.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 8/02/24.
//

import UIKit

struct User {
	let name: String
	let jobTitle: String
	let email: String
	let image: String
}

class UsersTableViewController: UITableViewController {
	
	private struct Constant {
		static let cellIdentifier = "usersMobileProduct"
		static let identifier = "detailsUser"
	}
	
	var selectedUser: User?
	
	var users = [
		User(name: "Daniel Cano",
			 jobTitle: "",
			 email: "dcarbelaez@veritran.com",
			 image: "daniel"),
		
		User(name: "Franco Corvalan",
			 jobTitle: "Software Engineer",
			 email: "lgomez@veritran.com",
			 image: "franco"),
	
		User(name: "Guillermo Cavalieri",
			 jobTitle: "Software Engineer",
			 email: "gcavalieri@veritran.com",
			 image: "guillermo"),
		
		User(name: "Jhony Giraldo",
			 jobTitle: "Software Engineer",
			 email: "jgiraldo@veritran.com",
			 image: "jhony"),
		
		User(name: "Juan Ignacio",
			 jobTitle: "Product Owner",
			 email: "jandres@veritran.com",
			 image: "ignacio"),
		
		User(name: "Julian Florez",
			 jobTitle: "Software Engineer",
			 email: "jflorezgaleano@veritran.com",
			 image: "julian"),
		
		User(name: "Laura Gomez",
			 jobTitle: "Software Engineer",
			 email: "lgomez@veritran.com",
			 image: "laura"),
		
		User(name: "Leonardo Florez",
			 jobTitle: "Software Engineer",
			 email: "lflopez@veritran.com",
			 image: "leonardo"),
		
		User(name: "Manuel Kenar",
			 jobTitle: "Lead Engineer",
			 email: "mkenar@veritran.com",
			 image: "manuel"),
		
		User(name: "Mateo Garcia",
			 jobTitle: "Trainee",
			 email: "mgarcia@veritran.com",
			 image: "mateo"),
		
		User(name: "Rosalia Miranda",
			 jobTitle: "Software Engineer",
			 email: "rmiranda@veritran.com",
			 image: "rosalia"),
	]
	
	func getUser(for index: Int) -> User {
		return users[index]
	}
	
	func canDeleteUser(for index: Int) -> Bool {
		let user = getUser(for: index)
		let shouldDelete = user.name != "Manuel Kenar" && user.name != "Juan Ignacio"
		return shouldDelete
	}
	
	func deleteUser(at index: Int) {
		let user = getUser(for: index)
		users.remove(at: index)
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
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return users.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)
		var content = cell.defaultContentConfiguration()
		let user = users[indexPath.row]
		content.text = user.name
		cell.contentConfiguration = content
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		canDeleteUser(for: indexPath.row)
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true	)
		selectedUser = users[indexPath.row]
		performSegue(withIdentifier: Constant.identifier, sender: self)
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			deleteUser(at: indexPath.row)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constant.identifier {
				if let detailsUserViewController = segue.destination as? DetailsUserViewController {
					detailsUserViewController.user = selectedUser
				}
			}
		}
}
