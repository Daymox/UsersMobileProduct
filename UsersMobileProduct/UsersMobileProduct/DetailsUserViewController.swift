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
		
		if let imageUrl = URL(string: user.image) {
			loadImageAsync(url: imageUrl)
		}
	}
	
	func loadImageAsync(url: URL) {
		URLSession.shared.dataTask(with: url) { 
			[weak self] (data, _, error) in
			
			if let data = data, let image = UIImage(data: data) {
				DispatchQueue.main.async {
					self?.imageProfile.image = image
				}
			}
		}.resume()
	}
}

