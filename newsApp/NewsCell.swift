//
//  NewsCell.swift
//  newsApp
//
//  Created by Aleksandr Maltsev on 18.10.2019.
//  Copyright © 2019 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

	@IBOutlet weak private var articleImageView: UIImageView!
	@IBOutlet weak private var titleLabel: UILabel!
	
	var articleImageUrl: String? {
		didSet {
			let queue = DispatchQueue.global(qos: .background)
			queue.async {
				do {
					if let validUrl = self.articleImageUrl {
						let url = URL(string: validUrl)
						let data = try Data(contentsOf: url!)
						let img = UIImage(data: data)
						DispatchQueue.main.async {
							self.articleImageView.image = img
						}
					}
				} catch {
					
				}
			}
		}
	}
	var articleTitle: String? {
		didSet {
			titleLabel.text = articleTitle
		}
	}
	override func awakeFromNib() {
        super.awakeFromNib()
		articleImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
