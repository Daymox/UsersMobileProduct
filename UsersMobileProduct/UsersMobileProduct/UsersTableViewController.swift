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
			 image: "https://media.licdn.com/dms/image/C4E03AQGnFkyInx8Xtw/profile-displayphoto-shrink_800_800/0/1604940146914?e=1713398400&v=beta&t=zIT-379-dsE5Wn9qqjFo41f1jxsf__NuaYNecYHuIjg"),
		
		User(name: "Franco Corvalan",
			 jobTitle: "Software Engineer",
			 email: "lgomez@veritran.com",
			 image: "https://media.licdn.com/dms/image/C4D03AQFBOjhQVFaUsA/profile-displayphoto-shrink_800_800/0/1658857063222?e=1713398400&v=beta&t=mgER5YNq7DTXRfUzky0OCt_k5667HfabKK-WlUWfLWE"),
		
		User(name: "Guillermo Cavalieri",
			 jobTitle: "Software Engineer",
			 email: "gcavalieri@veritran.com",
			 image: "https://media.licdn.com/dms/image/D4D35AQFL0g4z0cc7EA/profile-framedphoto-shrink_800_800/0/1680555742229?e=1708549200&v=beta&t=DoDsWJMcQ9_6nLlSS7VcEfL_DaSe7wgfTEv5CGU4chM"),
		
		User(name: "Jhony Giraldo",
			 jobTitle: "Software Engineer",
			 email: "jgiraldo@veritran.com",
			 image: "https://media.licdn.com/dms/image/C4E03AQGRgz3s75gkPQ/profile-displayphoto-shrink_800_800/0/1606852595367?e=1713398400&v=beta&t=Y41xoOhuuAkhLEPoz1kKyW0PLNVpNtiD5BDBiWJSga8"),
		
		User(name: "Juan Ignacio",
			 jobTitle: "Product Owner",
			 email: "jandres@veritran.com",
			 image: "https://media.licdn.com/dms/image/C4E03AQGC7ZS5QpIZkw/profile-displayphoto-shrink_800_800/0/1638373481343?e=1713398400&v=beta&t=dkVS9mq1JJGzuYf-T0v0vPh9vb7e_qFS-0TgQx5k-Rk"),
		
		User(name: "Julian Florez",
			 jobTitle: "Software Engineer",
			 email: "jflorezgaleano@veritran.com",
			 image: "https://media.licdn.com/dms/image/C5603AQG5WivuRxhEXA/profile-displayphoto-shrink_800_800/0/1655644303968?e=1713398400&v=beta&t=bM3ZT5t9d_NWr9zfcubrkzEo11ayWNuUuAXRcKmnsTg"),
		
		User(name: "Laura Gomez",
			 jobTitle: "Software Engineer",
			 email: "lgomez@veritran.com",
			 image: "https://media.licdn.com/dms/image/C4E03AQGJsiP3WqhqXg/profile-displayphoto-shrink_800_800/0/1597692543216?e=1713398400&v=beta&t=eRnDzpJecqu4WBYaVssDdmm6XTuBbCREeTq01xxXNqI"),
		
		User(name: "Leonardo Florez",
			 jobTitle: "Software Engineer",
			 email: "lflopez@veritran.com",
			 image: "https://media.licdn.com/dms/image/C4E03AQEskgSxAj878w/profile-displayphoto-shrink_800_800/0/1564539525698?e=1713398400&v=beta&t=y-e8yTCknGZLvI3l1utB95qdfx1RW-UDo1h-5pXxxMk"),
		
		User(name: "Manuel Kenar",
			 jobTitle: "Lead Engineer",
			 email: "mkenar@veritran.com",
			 image: "https://media.licdn.com/dms/image/C4E03AQE8VJlQs2iUfg/profile-displayphoto-shrink_800_800/0/1589995694672?e=1713398400&v=beta&t=LI2MIhji9jKysCfAXAuS9kyVKufhJxxD2UdDylpKDLw"),
		
		User(name: "Mateo Garcia",
			 jobTitle: "Trainee",
			 email: "mgarcia@veritran.com",
			 image: ""),
		
		User(name: "Rosalia Miranda",
			 jobTitle: "Software Engineer",
			 email: "rmiranda@veritran.com",
			 image: ""),
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
