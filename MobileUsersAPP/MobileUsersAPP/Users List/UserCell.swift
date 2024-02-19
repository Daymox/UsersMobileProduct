//
//  UserCell.swift
//  MobileUsersAPP
//
//  Created by Johan Mateo Garcia Rios on 18/02/24.
//

import UIKit

protocol UserCellProtocol where Self: UITableViewCell {
	func setUserName(_ userName: String)
	func setProfileImage(_ profileImage: UIImage?)
}

class UserCell: UITableViewCell {

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!
}

extension UserCell: UserCellProtocol {
	func setUserName(_ userName: String) {
		userNameLabel.text = userName
	}
	
	func setProfileImage(_ profileImage: UIImage?) {
		profileImageView.image = profileImage
	}
}
