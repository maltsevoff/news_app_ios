//
//  ViewController.swift
//  newsApp
//
//  Created by Aleksandr Maltsev on 18.10.2019.
//  Copyright © 2019 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBAction func emailedButton(_ sender: UIButton) {
		currentNewsType = "emailed"
	}
	@IBAction func sharedButton(_ sender: UIButton) {
		currentNewsType = "shared"
	}
	@IBAction func viewedButton(_ sender: UIButton) {
		currentNewsType = "viewed"
	}
	@IBOutlet weak var newsTableView: UITableView!
	let requestManager = RequestManager()
	var news: [News] = []
	var currentNewsType = "emailed" {
		didSet {
			if oldValue != currentNewsType {
				getActualNews()
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "News"
		getActualNews()
	}
	
	func getActualNews() {
		print("news: \(currentNewsType)")
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
		let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
		let newsNode = news[indexPath.row]
		cell.articleTitle = newsNode.title
		cell.articleImageUrl = newsNode.imageUrl
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath.row)
		performSegue(withIdentifier: "ShowArticleDetail", sender: nil)
	}

}

