//
//  UserDetailsViewController.swift
//  MobileUsersAPP
//
//  Created by Johan Mateo Garcia Rios on 18/02/24.
//

import UIKit

class UserDetailsViewController: UIViewController, UserDetailHandlingProtocol {
	var user: User?
	
	@IBOutlet weak var nationalityLabel: UILabel!
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var jobTitleLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var profileImageView: UIImageView!
	
	override func viewDidLoad() {
		configureLabels()
		
		if let imageUrl = URL(string: user?.image ?? "") {
			loadImagesAsync(url: imageUrl)
		}
	}
	
}
