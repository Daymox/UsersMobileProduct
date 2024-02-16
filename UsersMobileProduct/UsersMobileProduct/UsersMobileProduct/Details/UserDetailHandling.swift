//
//  UserDetailHandling.swift
//  UsersMobileProduct
//
//  Created by Mateo Garcia on 15/02/24.
//

import UIKit

protocol UserDetailsHandling {
	var user: User? { get set }
	
	func configureLabels()
	func loadImageAsync(url: URL)
}

extension UserDetailsHandling where Self: DetailsUserViewController {
	func configureLabels() {
		guard let user = user else {
			return
		}
		
		labelName.text = user.name
		labelJobTitle.text = user.jobTitle
		labelEmail.text = user.email
	}
	
	func loadImageAsync(url: URL) {
		URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
			if let data = data, let image = UIImage(data: data) {
				DispatchQueue.main.async {
					self?.imageProfile.image = image
				}
			}
		}.resume()
	}
}
