//
//  UsersTableViewController.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 15/02/24.
//

import UIKit

class UsersTableViewController: UITableViewController, UsersTableHandling {
	
	var selectedUser: User?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(UINib(nibName: "CustomUserCell", bundle: nil), forCellReuseIdentifier: UsersConstants.cellIdentifier)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return UserList.users.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: UsersConstants.cellIdentifier, for: indexPath)
		var content = cell.defaultContentConfiguration()
		let user = UserList.users[indexPath.row]
		content.text = user.name
		cell.contentConfiguration = content

		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		canDeleteUser(for: indexPath.row)
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		selectedUser = UserList.users[indexPath.row]
		performSegue(withIdentifier: UsersConstants.identifier, sender: self)
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			deleteUser(at: indexPath.row)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == UsersConstants.identifier {
			if let detailsUserViewController = segue.destination as? DetailsUserViewController {
				detailsUserViewController.user = selectedUser
			}
		}
	}
}
