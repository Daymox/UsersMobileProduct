//
//  DetailsUserViewController.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 15/02/24.
//

import UIKit

class DetailsUserViewController: UIViewController, UserDetailsHandling {
	var user: User?
	
	@IBOutlet weak var labelName: UILabel!
	@IBOutlet weak var labelJobTitle: UILabel!
	@IBOutlet weak var labelEmail: UILabel!
	@IBOutlet weak var imageProfile: UIImageView!
	
	override func viewDidLoad() {
		configureLabels()
		
		if let imageUrl = URL(string: user?.image ?? "") {
			loadImageAsync(url: imageUrl)
		}
	}
}
