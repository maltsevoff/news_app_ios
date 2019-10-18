//
//  ViewController.swift
//  newsApp
//
//  Created by Aleksandr Maltsev on 18.10.2019.
//  Copyright © 2019 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var newsTableView: UITableView!
	let requestManager = RequestManager()
	var news: [String] = []
	var currentNewsType = "emailed"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getActualNews()
	}
	
	func getActualNews() {
		requestManager.getNews(newsType: currentNewsType) { titles in
			self.news = titles
			DispatchQueue.main.async {
				self.newsTableView.reloadData()
			}
		}
	}
	
	// MARK: - Table View
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return news.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
		
		cell.textLabel?.text = news[indexPath.row]
		return cell
	}


}

