//
//  UsersListViewController.swift
//  MobileUsersAPP
//
//  Created by Johan Mateo Garcia Rios on 18/02/24.
//

import UIKit

protocol UsersListViewControllerProtocol: AnyObject {
	func deleteRow(at index: Int)
	func presentAlert(with message: String, and title: String)
	func loadImagesAsync(url: URL, completion: @escaping (UIImage?) -> Void)
}

class UsersListViewController: UIViewController {
	private struct Constant {
		static let cellIdentifier = "userCell"
		static let identifier = "userDetails"
	}
	
	@IBOutlet var tableView: UITableView!
	
	let main: UserHandlingProtocol = UserHandling()
	
	var selectedUser: User?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.dataSource = self
		tableView.delegate = self
		
		main.setViewController(self)
		
	}
}

extension UsersListViewController: UsersListViewControllerProtocol {
	func deleteRow(at index: Int) {
		let indexPath = IndexPath(row: index, section: 0)
		tableView.performBatchUpdates {
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
		main.processUserDeleted(at: indexPath.row)
	}
	
	func presentAlert(with message: String, and title: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default)
		alert.addAction(okAction)
		present(alert, animated: true)
	}
	
	func loadImagesAsync(url: URL, completion: @escaping (UIImage?) -> Void) {
		URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
			if let data = data, let image = UIImage(data: data) {
				DispatchQueue.main.async {
					completion(image)
				}
			}
		}.resume()
	}
}

extension UsersListViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return main.getNumberOfUsers()
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath) as! UserCellProtocol
		
		let user = main.getUser(for: indexPath.row)
		cell.setUserName(user.name)
	
		if let imageURL = URL(string: user.image) {
			loadImagesAsync(url: imageURL) { [weak cell] (image) in
				cell?.setProfileImage(image)
			}
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		main.canDeleteUser(for: indexPath.row)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			main.deleteUser(at: indexPath.row)
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		selectedUser = UsersStorage.users[indexPath.row]
		performSegue(withIdentifier: Constant.identifier, sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constant.identifier {
			if let userDetails = segue.destination as? UserDetailsViewController {
				userDetails.user = selectedUser
			}
		}
	}
}

