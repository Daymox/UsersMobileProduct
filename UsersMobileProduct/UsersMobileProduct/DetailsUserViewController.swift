//
//  DetailsUserViewController.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 9/02/24.
//


import UIKit

class DetailsUserViewController: UIViewController {
	var user: User?
	
	@IBOutlet weak var labelName: UILabel!
	@IBOutlet weak var labelJobTitle: UILabel!
	@IBOutlet weak var labelEmail: UILabel!
	@IBOutlet weak var imageProfile: UIImageView!
	
	override func viewDidLoad() {
		
		guard let user = user else {
			return
		}
		
		labelName.text = user.name
		labelJobTitle.text = user.jobTitle
		labelEmail.text = user.email
		imageProfile.image = UIImage(named: user.image)
	}
}

	
	



