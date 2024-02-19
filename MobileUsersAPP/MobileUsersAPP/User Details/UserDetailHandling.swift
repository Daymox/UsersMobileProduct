//
//  userDetailHandling.swift
//  MobileUsersAPP
//
//  Created by Johan Mateo Garcia Rios on 18/02/24.
//

import UIKit

protocol UserDetailHandlingProtocol {
	var user: User? {get set}
	
	func configureLabels()
	func loadImagesAsync(url: URL)
}

extension UserDetailHandlingProtocol where Self: UserDetailsViewController {
	func configureLabels() {
		guard let user = user else {
			return
		}
		userNameLabel.text = user.name
		jobTitleLabel.text = user.jobTitle
		emailLabel.text = user.email
	}
	
	func loadImagesAsync(url: URL) {
		URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
			if let data = data, let image = UIImage(data: data) {
				DispatchQueue.main.async {
					self?.profileImageView.image = image
				}
			}
		}.resume()
	}
}
